'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_new_notifications = async (req, res) =>
{
    const user_id = req.params.user_id;

    const query = 'SELECT * FROM physiolink.notification ' + 
                `WHERE notification.user_id=${user_id};`;
    const notifications = await driver.executeQuery(query);

    res.status(200).json({notifications});

    // We don't want to make extra queries for no reason
    if (notifications.length === 0)
        return;

    // DELETE the notifications from the database
    // We consider the notifications SEEN. We only want to send them one time
    await driver.executeQuery('START TRANSACTION;');
    await driver.executeQuery('DELETE FROM physiolink.notification ' +
                            `WHERE notification.user_id=${user_id};`);
    await driver.executeQuery('COMMIT;');
}