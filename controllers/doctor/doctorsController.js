'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_all_doctors = async (req, res) =>
{
    const query = 'SELECT * FROM physiolink.doctor;';
    const doctors = await driver.executeQuery(query);
    
    res.json(doctors);
}