'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const EmailFactory = require('../../utils/email/EmailFactory');

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
    const query = 'INSERT INTO physiolink.appointment (date, message, isConfirmed, doctor_id, patient_id) ' +
                    `VALUES ('${date}:00', '${message}', false, ${doctor_id}, ${patient_id})`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    /* We now send an email to the doctor, informing them that a new request arrived */
    const doctor_email = await driver.executeQuery(`SELECT email FROM physiolink.doctor ` +
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
    const doctor_id = req.body.doctor_id;
    const appoint_id = req.body.appoint_id;

    const query = 'UPDATE physiolink.appointment SET isConfirmed=true ' +
                `WHERE id=${appoint_id} AND doc_id=${doctor_id}`;
    await driver.executeQuery(query);

    res.status(200).end();
}

exports.decline_appointment = async (req, res) =>
{
    const doc_id = req.body.doc_id;
    const appoint_id = req.body.appoint_id;

    const query = 'DELETE FROM physiolink.appointment ' +
                `WHERE id=${appoint_id} AND doc_id=${doc_id}`;
    await driver.executeQuery(query);

    res.status(200).end();
}