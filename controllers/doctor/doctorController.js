'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_doctor = (req, res) =>
{

}

exports.create_doctor = async (req, res) =>
{
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const surname = req.body.surname;
    const email = req.body.email;
    const phoneNumber = req.body.phone_number;
    const afm = req.body.afm;

    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'doctor');`;
    await driver.executeQuery(query);
    res.end();
}

exports.edit_doctor = (req, res) =>
{

}

exports.delete_doctor = (req, res) =>
{
    
}