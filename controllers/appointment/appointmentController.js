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

exports.accept_appointment = async (req, res) =>
{
    const doc_id = req.body.doc_id;
    const appoint_id = req.body.appoint_id;

    const query = 'UPDATE physiolink.appointment SET isConfirmed=true ' +
                `WHERE id=${appoint_id} AND doc_id=${doc_id}`;
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