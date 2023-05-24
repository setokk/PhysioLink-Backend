'use strict';

const driver = require('../utils/db/DatabaseDriver');
const Error = require('../utils/error/Error');

exports.check_appointment_exists = async (req, res, next) =>
{
    const doctor_id = req.body.doctor_id;
    const patient_id = req.body.patient_id;

    const curr_date = new Date().toLocaleDateString('zh-Hans-CN', {year: 'numeric', month: 'numeric', day: 'numeric'})
    .replace(/\//g, "-");

    const query = 'SELECT appointment.id FROM physiolink.appointment ' +
                `WHERE appointment.doctor_id=${doctor_id} AND appointment.patient_id=${patient_id} ` +
                `AND '${curr_date}' <= DATE(appointment.date);`;
    const result = await driver.executeQuery(query);

    if (result.length != 0)
    {
        res.status(400).json({message: Error.RESOURCE_EXISTS});
        return;
    }

    // All OK
    next();
}