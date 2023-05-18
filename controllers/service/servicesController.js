'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_all_services = async (req, res) =>
{
    const query = 'SELECT * FROM physiolink.service';
    const services = await driver.executeQuery(query);
    res.json({services});
}