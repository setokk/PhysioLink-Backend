'use strict';

const driver = require('../db/DatabaseDriver');

module.exports = class NotificationManager
{
    static async createNotification(user_id, title, message)
    {
        const query = 'INSERT INTO physiolink.notification ' +
                    '(user_id, title, message) ' +
                    `VALUES (${user_id}, '${title}', '${message}');`;
        await driver.executeQuery(query);
    }
}