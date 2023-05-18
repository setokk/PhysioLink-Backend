'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const ScheduleManager = require('../../utils/schedule/ScheduleManager');

exports.get_doctor_appointments = async (req, res) =>
{
    const doctor_id = req.params.doc_id;

    const curr_date = new Date().toLocaleDateString('en-us', {year: 'numeric', month: 'numeric', day: 'numeric'})
                        .replace("/", "-");
    console.log(curr_date);

    const query = 'SELECT appointment.id, patient.name, patient.surname, ' + 
            'patient.phone_number, patient.amka FROM ' +
            'physiolink.appointment INNER JOIN physiolink.patient ' +
            'ON patient.id = appointment.patient_id ' +
            `WHERE appointment.doctor_id = ${doctor_id};`;

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}