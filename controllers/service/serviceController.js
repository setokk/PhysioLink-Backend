'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_service = async (req, res) =>
{
    const id = req.params.id;

    const query = `SELECT * FROM physiolink.service WHERE service.id = ${id};`;
    const result = await driver.executeQuery(query);

    if (result.length == 0)
    {
        res.json({message: `Service does not exist with id ${id}`});
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

}

exports.delete_service = async (req, res) =>
{
    
}