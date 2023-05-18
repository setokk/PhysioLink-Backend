'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const ScheduleManager = require('../../utils/schedule/ScheduleManager');

exports.get_doctor_appointments = async (req, res) =>
{
    const doctor_id = req.query.doctor_id;
    const date = req.query.date;
    
    const curr_date = new Date().toLocaleDateString('zh-Hans-CN', {year: 'numeric', month: 'numeric', day: 'numeric'})
                        .replace(/\//g, "-");
    console.log(curr_date);

    const query = 'SELECT appointment.id AS appointment_id, patient.name AS patient_name, ' + 
            'patient.surname AS patient_surname, patient.phone_number, patient.amka FROM ' +
            'physiolink.appointment INNER JOIN physiolink.patient ' +
            'ON patient.id = appointment.patient_id ' +
            `WHERE appointment.doctor_id = ${doctor_id} AND DATE(appointment.date) = '${date}';`;

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}