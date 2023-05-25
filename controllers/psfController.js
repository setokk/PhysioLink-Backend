'use strict';

const driver = require('../utils/db/DatabaseDriver');

exports.create_psf = async (req, res) =>
{
    const username = req.body.username;
    const password = req.body.password;

    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'psf')`;
    await driver.executeQuery(query);
    
    res.status(201).end();
}

exports.get_all_psf = async (req, res) =>
{
    const psf_id = req.params.psf_id;

    const query = 'SELECT user.username FROM physiolink.user ' +
            `WHERE user.role='psf' AND user.id!=${psf_id};`;
    const psfs = await driver.executeQuery(query);

    res.status(200).json({psfs});
}