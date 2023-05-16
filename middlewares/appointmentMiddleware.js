'use strict';

const driver = require('../utils/db/DatabaseDriver');
const Error = require('../utils/error/Error');

exports.check_availability = async (req, res, next) => {
    const { date, doctor_id } = req.body;
    const splitted_date = date.split(' '); // [0] = DATE, [1] = TIME

    const query = `SELECT * FROM physiolink.appointment WHERE appointment.doctor_id = ${doctor_id} AND appointment.date LIKE ${splitted_date[0]}%`;

    const result = await driver.executeQuery(query);

    if (result.length >= 0 && result.length < 2) {
        res.json({message: "High Availability"});
        return;
    } else if (result.length >= 2 && result.length < 6) {
        res.json({message: "Medium Availability"});
        return;
    } else if (result.length >= 6 && result.length < 8) {
        res.json({message: "Low Availability"});
        return;
    } else if (result.length == 8) { 
        res.json({message: "Unavailable"});
        return;
    }

    res.status(400).json({message: Error.RESOURCE_NOT_FOUND});
}