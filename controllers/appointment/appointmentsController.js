'use strict';

const { json } = require('express');
const driver = require('../../utils/db/DatabaseDriver');

exports.get_doctor_appointments = async (req, res) =>
{
    const { doctor_id } = req.body;

    const query =
    `SELECT patient_id, date, isConfirmed, message FROM physiolink.appointment WHERE appointment.doctor_id = ${doctor_id} AND isConfirmed = true`
    
    const result = await driver.executeQuery(query);
    // OPTIONAL: Return patient name from id
    const appointments = [];

    Object.keys(result).forEach( key => {
        var row = result[key];

        appointments.push({
            patient_id: row.patient_id,
            //patient_name: '',
            date: row.date,
            message: row.message
        });
    })

    return res.status(200).send(appointments);
}