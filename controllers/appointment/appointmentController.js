'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const EmailFactory = require('../../utils/email/EmailFactory');
const Error = require('../../utils/error/Error');
const NotificationManager = require('../../utils/notifications/NotificationManager');

exports.request_appointment = async (req, res) =>
{
    const date = req.body.date;
    const hour = req.body.hour;
    const message = req.body.message;
    const doctor_id = req.body.doctor_id;
    const patient_id = req.body.patient_id;
    const patient_name = req.body.patient_name;
    const patient_surname = req.body.patient_surname;
    const patient_phone_number = req.body.patient_phone_number;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'INSERT INTO physiolink.appointment (date, message, isConfirmed, isCompleted, doctor_id, patient_id) ' +
                    `VALUES ('${date} ${hour}:00', '${message}', false, false, ${doctor_id}, ${patient_id})`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    /* We now send an email to the doctor, informing them that a new request arrived */
    const doctor_email = await driver.executeQuery('SELECT email FROM physiolink.doctor ' +
                    `WHERE doctor.id = ${doctor_id}`);
    
    res.status(201).end();

    /* Split DATETIME type ('2017-07-18 16:00:00') into DATE and HOUR */
    EmailFactory.getInstance().sendRequestEmail(doctor_email[0].email, {
            name: patient_name,
            surname: patient_surname,
            phoneNumber: patient_phone_number,
            date: date,
            hour: hour + ":00",
            message: message
    });

    NotificationManager.createNotification(doctor_id, 
        "Νέο αίτημα ραντεβού",
        `Μόλις λάβατε νέο αίτημα ραντεβού για τις ${date}, ώρα ${hour}:00`+
        ' Για περισσότερες πληροφορίες, μπείτε στο PhysioLink');
}

exports.accept_appointment = async (req, res) =>
{
    const appointment_id = req.body.appointment_id;
    const doctor_name = req.body.doctor_name;
    const doctor_surname = req.body.doctor_surname;
    const doctor_phone_number = req.body.doctor_phone_number;
    const date = req.body.date;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'UPDATE physiolink.appointment SET isConfirmed=true ' +
                `WHERE id=${appointment_id};`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    res.status(200).end();

    const patient = await driver.executeQuery('SELECT patient.email, patient.id FROM ' +
        'physiolink.appointment INNER JOIN physiolink.patient ON patient.id = appointment.patient_id ' +
         `WHERE appointment.id = ${appointment_id};`);
         
    EmailFactory.getInstance().sendAcceptedRequestEmail(patient[0].email, {
        name: doctor_name,
        surname: doctor_surname,
        phoneNumber: doctor_phone_number,
        date: date
    });

    NotificationManager.createNotification(patient[0].id, 
        "Αποδοχή αιτήματος ραντεβού",
        `Το αίτημα σας για ραντεβού για τις ${date} μόλις έγινε αποδεκτό!`+
        ' Για περισσότερες πληροφορίες, μπείτε στο PhysioLink');
}

exports.decline_appointment = async (req, res) =>
{
    const date = req.body.date;
    const reason = req.body.reason;
    const appointment_id = req.body.appointment_id;
    const doctor_name = req.body.doctor_name;
    const doctor_surname = req.body.doctor_surname;
    const doctor_phone_number = req.body.doctor_phone_number;

    const patient = await driver.executeQuery('SELECT patient.email, patient.id FROM ' +
    'physiolink.appointment INNER JOIN physiolink.patient ON patient.id = appointment.patient_id ' +
     `WHERE appointment.id = ${appointment_id};`);

    await driver.executeQuery('START TRANSACTION;');
    const query = 'DELETE FROM physiolink.appointment ' +
                `WHERE id=${appointment_id};`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    res.status(200).end();

    EmailFactory.getInstance().sendDeclinedRequestEmail(patient[0].email, {
            name: doctor_name,
            surname: doctor_surname,
            phoneNumber: doctor_phone_number,
            date: date,
            reason: reason
        });

    NotificationManager.createNotification(patient[0].id, 
        "Απόρριψη αιτήματος ραντεβού",
        `Δυστυχώς, το αίτημα σας για ραντεβού για τις ${date} απορρίφθηκε`+
        ' Για περισσότερες πληροφορίες, μπείτε στο PhysioLink');
}

exports.accept_payment = async (req, res) =>
{
    const appointment_id = req.body.appointment_id
    const service_id = req.body.service_id;
    const date = req.body.date;

    const query = 'INSERT INTO physiolink.has_payment (appointment_id, service_id) ' +
            `VALUES (${appointment_id}, '${service_id}');`;
    await driver.executeQuery(query);

    driver.executeQuery('UPDATE physiolink.appointment SET isCompleted=true ' +
                        `WHERE id=${appointment_id};`);
    
    res.status(201).end();

    const service = await driver.executeQuery('SELECT service.title, service.description, service.price ' +
            `FROM physiolink.service WHERE service.id = '${service_id}';`);

    const patient = await driver.executeQuery('SELECT patient.email, patient.id FROM ' +
    'physiolink.appointment INNER JOIN physiolink.patient ON patient.id = appointment.patient_id ' +
     `WHERE appointment.id = ${appointment_id};`);
    EmailFactory.getInstance().sendCompletedPaymentEmail(patient[0].email, {
            service_name: service[0].title,
            price: service[0].price,
            description: service[0].description,
            date: date
    });

    NotificationManager.createNotification(patient[0].id, 
        "Ολοκλήρωση πληρωμής ραντεβού",
        `Το ραντεβού που πραγματοποιήθηκε στις ${date} μόλις χρεώθηκε!` +
        ' Για περισσότερες πληροφορίες, μπείτε στο PhysioLink');
}

exports.get_patient_upcoming_appointment = async (req, res) =>
{
    const patient_id = req.query.patient_id;
    const doctor_id = req.query.doctor_id;
    
    const curr_date = new Date().toLocaleDateString('zh-Hans-CN', {year: 'numeric', month: 'numeric', day: 'numeric'})
                        .replace(/\//g, "-");

    const query = 'SELECT DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, HOUR(appointment.date) AS hour, ' +
                'doctor.address, doctor.city, doctor.postal_code, appointment.message FROM ' +
                'physiolink.appointment INNER JOIN physiolink.doctor ' +
                'ON appointment.doctor_id = doctor.id ' +
                'WHERE appointment.isConfirmed=true AND appointment.isCompleted=false ' +
                `AND appointment.doctor_id = ${doctor_id} AND appointment.patient_id = ${patient_id} ` +
                `AND DATE(appointment.date) >= '${curr_date}';`;

    const result = await driver.executeQuery(query);
    
    if (result.length === 0)
    {
        res.status(400).json({message: Error.RESOURCE_NOT_FOUND});
        return;
    }
    const appointment = {
        date: result[0].date,
        hour: result[0].hour,
        city: result[0].city,
        address: result[0].address,
        postal_code: result[0].postal_code,
        message: result[0].message
    }
    res.status(200).json({appointment});
}

exports.get_patient_previous_appointment = async (req, res) =>
{
    const patient_id = req.query.patient_id;
    const doctor_id = req.query.doctor_id;

    const query = 'SELECT appointment.id AS appointment_id, DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, ' +
        'HOUR(appointment.date) AS hour, service.title AS service_title, ' +
        'service.description AS service_description, service.price AS service_price ' +
        'FROM (physiolink.appointment INNER JOIN physiolink.has_payment ON has_payment.appointment_id=appointment.id) ' +
        'INNER JOIN physiolink.service ON has_payment.service_id=service.id ' +
        `WHERE appointment.isCompleted=true AND appointment.patient_id=${patient_id} ` +
        `AND appointment.doctor_id=${doctor_id} ` +
        'ORDER BY appointment.date DESC ' +
        'LIMIT 1;';
    const result = await driver.executeQuery(query);

    if (result.length === 0)
    {
        res.status(400).json({message: Error.RESOURCE_NOT_FOUND});
        return;
    }
    
    const appointment = 
    {
        appointment_id: result[0].appointment_id,
        date: result[0].date,
        hour: result[0].hour,
        service_title: result[0].service_title,
        service_description: result[0].service_description,
        service_price: result[0].service_price
    };
    res.status(200).json({appointment});
}