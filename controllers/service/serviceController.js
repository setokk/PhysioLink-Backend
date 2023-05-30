'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const Error = require('../../utils/error/Error');

exports.get_service = async (req, res) =>
{
    const id = req.params.id;

    const query = `SELECT * FROM physiolink.service WHERE service.id = ${id};`;
    const result = await driver.executeQuery(query);

    if (result.length == 0)
    {
        res.json({message: Error.RESOURCE_NOT_FOUND});
        return;
    }

    const service = result[0];
    res.json({service});
}

exports.create_service = async (req, res) =>
{
    const id = req.body.id;
    const title = req.body.title;
    const description = req.body.description;
    const price = req.body.price;

    const query = 'INSERT INTO physiolink.service (id, title, description, price) ' +
                    `VALUES('${id}', '${title}', '${description}', ${price});`;
    
    await driver.executeQuery(query);

    res.status(201).end();
}

exports.edit_service = async (req, res) =>
{
    const service_id = req.body.service_id;
    const title = req.body.title;
    const description = req.body.description;
    const price = req.body.price;

    await driver.executeQuery('START TRANSACTION;');
    
    await driver.executeQuery('UPDATE physiolink.service ' + 
                    `SET service.title='${title}', service.description='${description}', ` +
                    `service.price=${price} ` +
                    `WHERE service.id='${service_id}'`);

    await driver.executeQuery('COMMIT;');
    res.status(200).end();
}

exports.delete_service_of = async (req, res) =>
{
    const service_id = req.body.service_id;
    const doctor_id = req.body.doctor_id;

    const query = 'DELETE FROM physiolink.has_service ' + 
                `WHERE has_service.service_id='${service_id}' ` + 
                `AND has_service.doctor_id=${doctor_id};`;
    await driver.executeQuery(query);

    res.status(200).end();
}

exports.link_service_to_doc = async (req, res) =>
{
    const service_id = req.body.service_id;
    const doctor_id = req.body.doctor_id;

    await driver.executeQuery('START TRANSACTION;');
    const query = 'INSERT INTO physiolink.has_service (doctor_id, service_id) ' +
                   `VALUES (${doctor_id}, '${service_id}');`;
    await driver.executeQuery(query);
    await driver.executeQuery('COMMIT;');

    res.status(201).end();
}