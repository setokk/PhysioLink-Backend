'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_doctor_appointments = async (req, res) =>
{
    const doctor_id = req.params.doc_id;

    const query = 'SELECT * FROM ' +
            'physiolink.appointment INNER JOIN physiolink.doctor ' +
            'ON doctor.id = appointment.doctor_id ' +
            `WHERE doctor.id = ${doctor_id};`;

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}