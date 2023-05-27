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
    const doctor_id = req.params.doc_id;

    const query = 'SELECT service.id, service.title, service.description, service.price FROM ' +
            'physiolink.service INNER JOIN physiolink.has_service ON service.id = has_service.service_id ' +
            `WHERE has_service.doctor_id = ${doctor_id} ` +
            'ORDER BY service.title ASC;';
    const services = await driver.executeQuery(query);
    res.status(200).json({services});
}