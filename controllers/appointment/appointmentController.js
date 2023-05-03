'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.request_appointment = async (req, res) =>
{
    const date = req.body.date;
    const message = req.body.message;
    const doc_id = req.body.doc_id;
    const patient_id = req.body.patient_id;

    const query = 'INSERT INTO physiolink.appointment (date, message, isConfirmed, doc_id, patient_id) ' +
                `VALUES ('${date}:00', '${message}', false, ${doc_id}, ${patient_id})`;
    await driver.executeQuery(query);

    res.status(201).end();
}