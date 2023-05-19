'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_hours_of_month = async (req, res) =>
{
    const month = req.body.month;
    const doctor_id = req.body.doctor_id;

    const query = 'SELECT DATE_FORMAT(DATE(date), "%Y-%m-%d") AS date, GROUP_CONCAT(HOUR(date) SEPARATOR ",") AS start_hours ' +
            'FROM physiolink.appointment ' +
            `WHERE MONTH(appointment.date) = ${month} AND appointment.doctor_id = ${doctor_id} ` +
            'GROUP BY DATE(appointment.date);';
    const dates = await driver.executeQuery(query);

    res.status(200).json({dates});
}