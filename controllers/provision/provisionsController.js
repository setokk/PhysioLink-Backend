'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_all_provisions = async (req, res) =>
{
    const query = 'SELECT * FROM physiolink.provision';
    const provisions = await driver.executeQuery(query);
    res.json(provisions);
}