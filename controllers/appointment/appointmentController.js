'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const EmailFactory = require('../../utils/email/EmailFactory');
const Error = require('../../utils/error/Error');

exports.request_appointment = async (req, res) =>
{
    const date = req.body.date;
    const message = req.body.message;
    const doctor_id = req.body.doctor_id;
    const patient_id = req.body.patient_id;
    const patient_name = req.body.patient_name;
    const patient_surname = req.body.patient_surname;
    const patient_phone_number = req.body.patient_phone_number;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'INSERT INTO physiolink.appointment (date, message, isConfirmed, isCompleted, doctor_id, patient_id) ' +
                    `VALUES ('${date}:00', '${message}', false, false, ${doctor_id}, ${patient_id})`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    /* We now send an email to the doctor, informing them that a new request arrived */
    const doctor_email = await driver.executeQuery('SELECT email FROM physiolink.doctor ' +
                    `WHERE doctor.id = ${doctor_id}`);
    
    res.status(201).end();

    /* Split DATETIME type ('2017-07-18 16:00:00') into DATE and HOUR */
    const splitted_date = date.split(' ');
    EmailFactory.getInstance().sendRequestEmail(doctor_email[0].email, {
            name: patient_name,
            surname: patient_surname,
            phoneNumber: patient_phone_number,
            date: splitted_date[0],
            hour: splitted_date[1],
            message: message
    });
}

exports.accept_appointment = async (req, res) =>
{
    const appointment_id = req.body.appointment_id;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'UPDATE physiolink.appointment SET isConfirmed=true ' +
                `WHERE id=${appointment_id};`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    res.status(200).end();

    const patient_email = await driver.executeQuery('SELECT patient.email FROM ' +
        'physiolink.appointment INNER JOIN physiolink.patient ON patient.id = appointment.patient_id ' +
         `WHERE appointment.id = ${appointment_id};`);
    //EmailFactory.getInstance().sendAcceptedRequestEmail(patient_email[0].email, {});
}

exports.decline_appointment = async (req, res) =>
{
    const appointment_id = req.body.appointment_id;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'DELETE FROM physiolink.appointment ' +
                `WHERE id=${appointment_id};`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    res.status(200).end();

    const patient_email = await driver.executeQuery('SELECT patient.email FROM ' +
        'physiolink.appointment INNER JOIN physiolink.patient ON patient.id = appointment.patient_id ' +
         `WHERE appointment.id = ${appointment_id};`);
    //EmailFactory.getInstance().sendDeclinedRequestEmail(patient_email[0].email, {});
}

exports.accept_payment = async (req, res) =>
{
    const appointment_id = req.body.appointment_id
    const service_id = req.body.service_id;

    const query = 'INSERT INTO physiolink.has_payment (appointment_id, service_id) ' +
            `VALUES (${appointment_id}, '${service_id}');`;
    await driver.executeQuery(query);

    driver.executeQuery('UPDATE physiolink.appointment SET isCompleted=true ' +
                        `WHERE id=${appointment_id};`);
    
    res.status(201).end();
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
        address: result[0].address,
        city: result[0].city,
        postal_code: result[0].postal_code,
        message: result[0].message
    }
    res.status(200).json({appointment});
}

exports.get_patient_latest_previous_appointment = async (req, res) =>
{
    const patient_id = req.query.patient_id;
    const doctor_id = req.query.doctor_id;

    const query = 'SELECT * ' +
        'FROM (physiolink.appointment INNER JOIN physiolink.has_payment ON has_payment.appointment_id=appointment.id) ' +
        'INNER JOIN physiolink.service ON has_payment.service_id=service.id ' +
        `WHERE appointment.isCompleted=true AND appointment.patient_id=${patient_id}` +
        'ORDER BY DATE(appointment.date) DESC;';
}