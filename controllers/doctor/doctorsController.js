'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const Error = require('../../utils/error/Error');

exports.get_all_doctors = async (req, res) =>
{
    const query = `SELECT user.id, user.image AS image, doctor.name, doctor.surname, doctor.email, ` +
            'doctor.phone_number, doctor.afm, doctor.address, doctor.city, doctor.postal_code, ' +
            'doctor.physio_name ' +
            'FROM physiolink.doctor INNER JOIN physiolink.user ' +
            'ON doctor.id=user.id;';
    const doctors = await driver.executeQuery(query);

    res.json({doctors});
}