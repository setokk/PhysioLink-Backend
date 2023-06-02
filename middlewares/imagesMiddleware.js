'use strict';

const driver = require('../utils/db/DatabaseDriver');
const Error = require('../utils/error/Error');

exports.check_image_exists = async (req, res, next) =>
{
    const user_id = req.params.user_id;

    const result = await driver.executeQuery('SELECT user.image FROM physiolink.user ' + 
    `WHERE user.id=${user_id} AND user.image IS NOT NULL;`);

    if (result.length === 0)
    {
        res.status(200).json({message: Error.RESOURCE_NOT_FOUND});
        return;
    }

    next();
}