'use strict';

const driver = require('../../utils/db/DatabaseDriver');

const ScheduleManager = require('../../utils/schedule/ScheduleManager');

exports.get_unavailable_hours = async (req, res) =>
{
    const month = req.body.month;
    const doctor_id = req.body.doctor_id;

    const query = 'SELECT DATE_FORMAT(DATE(date), "%Y-%m-%d") AS date, GROUP_CONCAT(HOUR(date) SEPARATOR ",") AS start_hours ' +
            'FROM physiolink.appointment ' +
            `WHERE MONTH(appointment.date) = ${month} AND appointment.doctor_id = ${doctor_id} ` +
            'GROUP BY DATE(appointment.date) ' +
            'ORDER BY appointment.date ASC;';
    const result = await driver.executeQuery(query);

    for (let i = 0; i < result.length; i++)
    {
        let splittedStart = result[i]["start_hours"].split(",");
        splittedStart.sort();
        
        let splittedEnd = [];
        for (let j = 0; j < splittedStart.length; j++)
        {
            let hour = (parseInt(splittedStart[j]) + ScheduleManager.APPOINTMENT_DURATION) % 24;
            splittedEnd.push(hour.toString() + ":00");
            splittedStart[j] = splittedStart[j] + ":00";
        }
        result[i]["start_hours"] = splittedStart;
        result[i]["end_hours"] = splittedEnd;
    }

    const dates = result;
    res.status(200).json({dates});
}