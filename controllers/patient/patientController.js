'use strict';

const driver = require('../../utils/db/DatabaseDriver');
const Error = require('../../utils/error/Error');

exports.get_patient = async (req, res) =>
{
    const id = req.params.id;
    
    const query = 'SELECT user.username, name, surname, email, phone_number, amka, address, postal_code, doctor_id ' +
                    `FROM physiolink.patient INNER JOIN physiolink.user ON user.id = patient.id WHERE patient.id = ${id};`
    const result = await driver.executeQuery(query);
    
    if (result.length == 0)
    {
        res.json({message: Error.RESOURCE_NOT_FOUND});
        return;
    }
    
    const patient = 
    {
        username: result[0].username,
        name: result[0].name,
        surname: result[0].surname,
        email: result[0].email,
        phone_number: result[0].phone_number,
        amka: result[0].amka,
        city: result[0].city,
        address: result[0].address,
        postal_code: result[0].postal_code,
        doctor_id: result[0].doctor_id,
    }
    res.json({patient});
}

exports.create_patient = async (req, res) =>
{
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const surname = req.body.surname;
    const email = req.body.email;
    const phoneNumber = req.body.phone_number;
    const city = req.body.city;
    const address = req.body.address;
    const postal_code = req.body.postal_code;
    const amka = req.body.amka;
    const doctor_id = req.body.doctor_id;

    await driver.executeQuery('START TRANSACTION;');
    /* Insert into 'user' table */
    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'patient');`;
    await driver.executeQuery(query);

    /* Get AUTO_INCREMENTED id */
    const idQuery = `SELECT id FROM physiolink.user WHERE user.username = '${username}';`;
    const id = await driver.executeQuery(idQuery);

    /* Insert the patient user into 'patient' table aswell */
    const patientQuery = `INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES ` +
                     `(${id[0].id}, '${name}', '${surname}', '${email}', '${phoneNumber}', '${city}', '${address}', '${postal_code}', '${amka}', ${doctor_id});`;
    await driver.executeQuery(patientQuery);

    await driver.executeQuery('COMMIT;');
    res.status(201).end();
}

exports.edit_patient = (req, res) =>
{

}

exports.delete_patient = (req, res) =>
{
    
}