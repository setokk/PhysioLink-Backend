'use strict';

const driver = require('../utils/db/DatabaseDriver');

const Error = require('../utils/error/Error');

exports.log_in = async (req, res) =>
{
    const username = req.body.username;
    const password = req.body.password;

    const query = `SELECT user.id, user.role, user.image AS image ` +
    `FROM physiolink.user WHERE user.username = '${username}' AND user.password = '${password}'`;
    const result = await driver.executeQuery(query);
    
    if (result.length == 0) // Didn't find a match
    {
        res.json({ message: Error.INVALID_CREDENTIALS });
        return;
    }
    
    const role = result[0].role;
    const id = result[0].id;
    let image = result[0].image;
    
    /* If role is psf, that's all the info we need 
        (there is no 'psf' table to get more user info from in the database) */
    if (role == 'psf')
    {
        res.json({ id: id, username: username, role: role });
        return;
    }

    const userQuery = `SELECT * FROM physiolink.${role} WHERE ${role}.id = ${id};`;
    const user = await driver.executeQuery(userQuery);
    if (role == 'doctor')
    {
        res.json({ id: id,
            username: username,
            role: role,
            image: image,
            name: user[0].name,
            surname: user[0].surname,
            email: user[0].email,
            phone_number: user[0].phone_number,
            afm: user[0].afm,
            city: user[0].city,
            address: user[0].address,
            postal_code: user[0].postal_code,
            physio_name: user[0].physio_name });
    }
    else if (role == 'patient')
    {
        res.json({ id: id,
            username: username,
            role: role,
            image: image,
            name: user[0].name,
            surname: user[0].surname,
            email: user[0].email,
            phone_number: user[0].phone_number,
            city: user[0].city,
            address: user[0].address,
            postal_code: user[0].postal_code,
            doctor_id: user[0].doctor_id,
            amka: user[0].amka });
    }
}

exports.change_password = async (req, res) =>
{
    const user_id = req.body.user_id;
    const password = req.body.password;

    await driver.executeQuery('UPDATE physiolink.user ' +
    `SET user.password='${password}' ` +
    `WHERE user.id=${user_id};`);

    res.status(200).end();
}