'use strict';

const driver = require('../utils/db/DatabaseDriver');

exports.check_service_exists = async (req, res, next) =>
{
    const id = req.body.id;
    const title = req.body.title;

    const query = `SELECT id FROM physiolink.service WHERE service.id = '${id}' OR service.title = '${title}';`;
    const result = await driver.executeQuery(query);

    /* Service with same id or name doesn't exist (all ok) */
    if (result.length == 0)
    {
        next();
        return;
    }

    res.json({message: 'Service with same id or title already exists'});
}