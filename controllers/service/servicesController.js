'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_all_services = async (req, res) =>
{
    const query = 'SELECT * FROM physiolink.service ' +
                'ORDER BY service.title ASC;';
    const services = await driver.executeQuery(query);
    res.json({services});
}

exports.get_doctor_services = async (req, res) =>
{
    const doctor_id = req.params.doctor_id;

    const query = 'SELECT service.id, service.title, service.description, service.price FROM ' +
            'physiolink.service INNER JOIN physiolink.has_service ON service.id = has_service.service_id ' +
            `WHERE has_service.doctor_id = ${doctor_id} ` +
            'ORDER BY service.title ASC;';
    const services = await driver.executeQuery(query);
    res.status(200).json({services});
}

exports.get_excluded_doctor_services = async (req, res) =>
{
    const doctor_id = req.params.doctor_id;

    const query = 'SELECT service.id, service.title, service.description, service.price ' +
            'FROM physiolink.service ' +
            `WHERE service.id NOT IN (` +
            'SELECT has_service.service_id FROM physiolink.has_service ' +
            `WHERE has_service.doctor_id=${doctor_id}) ` + 
            'ORDER BY service.title ASC;';
    const services = await driver.executeQuery(query);
    res.status(200).json({services});
}