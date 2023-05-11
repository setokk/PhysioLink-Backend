'use strict';

const driver = require('../utils/db/DatabaseDriver');
const Error = require('../utils/error/Error');

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

    res.status(400).json({message: Error.RESOURCE_EXISTS});
}