'use strict';

const driver = require('../utils/db/DatabaseDriver');

exports.create_psf = async (req, res) =>
{
    const username = req.body.username;
    const password = req.body.password;

    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'psf')`;
    await driver.executeQuery(query);
    
    res.end();
}