'use strict';

const driver = require('../utils/db/DatabaseDriver');

exports.username_check = async (req, res, next) =>
{
    const username = req.body.username;

    const query = `SELECT * FROM physiolink.user WHERE user.username='${username}';`;
    const result = await driver.executeQuery(query);
    if (result.length == 0) // No user with this username exists
    {
        next();
        return;
    }

    res.status(400).json({message: 'Username already exists'});
}