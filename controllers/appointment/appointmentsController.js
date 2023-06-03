'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const ScheduleManager = require('../../utils/schedule/ScheduleManager');

exports.get_doctor_confirmed_appointments = async (req, res) =>
{
    const doctor_id = req.query.doctor_id;
    const date = req.query.date;  

    const query = 'SELECT appointment.id AS appointment_id, patient.name AS patient_name, ' + 
            'patient.surname AS patient_surname, patient.phone_number, patient.amka, ' +
            'DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, HOUR(appointment.date) AS hour, user.image AS image ' +
            'FROM (physiolink.appointment INNER JOIN physiolink.patient ' +
            'ON patient.id = appointment.patient_id) INNER JOIN ' +
            'physiolink.user ON user.id=patient.id ' +
            `WHERE appointment.doctor_id = ${doctor_id} AND DATE(appointment.date) = '${date}' ` +
            'AND appointment.isConfirmed=true AND appointment.isCompleted=false ' +
            'ORDER BY appointment.date ASC;';

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}

exports.get_doctor_latest_confirmed_appointments = async (req, res) =>
{
    const doctor_id = req.query.doctor_id;
    const date = req.query.date;  
    
    const curr_date = new Date().toLocaleDateString('zh-Hans-CN', {year: 'numeric', month: 'numeric', day: 'numeric'})
                        .replace(/\//g, "-");
    console.log(curr_date);

    const query = 'SELECT appointment.id AS appointment_id, patient.name AS patient_name, ' + 
            'patient.surname AS patient_surname, patient.phone_number, patient.amka, ' +
            'DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, HOUR(appointment.date) AS hour, ' +
            'appointment.isCompleted AS isCompleted, appointment.message AS message, user.image AS image ' +
            'FROM (physiolink.appointment INNER JOIN physiolink.patient ' +
            'ON patient.id = appointment.patient_id) INNER JOIN ' +
            'physiolink.user ON user.id=patient.id ' +
            `WHERE appointment.doctor_id = ${doctor_id} AND DATE(appointment.date) = '${date}' ` +
            'AND appointment.isConfirmed=true ' +
            'AND appointment.isCompleted=false LIMIT 3;';   

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}

exports.get_doctor_pending_appointments = async (req, res) =>
{
    const doctor_id = req.params.doctor_id;

    const curr_date = new Date().toLocaleDateString('zh-Hans-CN', {year: 'numeric', month: 'numeric', day: 'numeric'})
                        .replace(/\//g, "-");
    console.log(curr_date);

    const query = 'SELECT appointment.id AS appointment_id, patient.name AS patient_name, ' + 
            'patient.surname AS patient_surname, patient.phone_number, patient.amka, ' +
            'DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, HOUR(appointment.date) AS hour, ' +
            'appointment.message AS message, user.image AS image ' + 
            'FROM (physiolink.appointment INNER JOIN physiolink.patient ' +
            'ON patient.id = appointment.patient_id) INNER JOIN ' +
            'physiolink.user ON user.id=patient.id ' +
            `WHERE appointment.doctor_id = ${doctor_id} ` +
            `AND DATE(appointment.date)>='${curr_date}' ` +
            'AND appointment.isConfirmed=false;';

    const appointments = await driver.executeQuery(query);
    res.status(200).json({appointments});
}

exports.get_patient_history_appointments = async (req, res) =>
{
    const patient_id = req.params.patient_id;

    const priceSum = await driver.executeQuery('SELECT COALESCE(SUM(service.price), 0) AS total ' +
            'FROM (physiolink.appointment INNER JOIN physiolink.has_payment ' +
            'ON appointment.id=has_payment.appointment_id) INNER JOIN physiolink.service ' +
            'ON has_payment.service_id=service.id ' + 
            `WHERE appointment.isCompleted=true AND appointment.patient_id=${patient_id};`);

    const query = 'SELECT DATE_FORMAT(DATE(appointment.date), "%Y-%m-%d") AS date, ' +
            'HOUR(appointment.date) AS hour, service.title AS service_title, ' +
            'appointment.message AS message, service.price AS price ' +
            'FROM (physiolink.appointment INNER JOIN physiolink.has_payment ' +
            'ON appointment.id=has_payment.appointment_id) INNER JOIN physiolink.service ' +
            'ON has_payment.service_id=service.id ' + 
            `WHERE appointment.isCompleted=true AND appointment.patient_id=${patient_id} ` +
            'ORDER BY appointment.date DESC;';
    const appointments = await driver.executeQuery(query);

    const history = {
        appointments: appointments,
        total_payment: priceSum[0].total
    };
    res.status(200).json({history});
}