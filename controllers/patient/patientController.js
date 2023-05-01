'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_patient = async (req, res) =>
{
    const id = req.params.id;

    const query = 'SELECT name, surname, email, phone_number, amka, address, doc_id ' +
                    `FROM physiolink.patient WHERE patient.id = ${id};`
    const result = await driver.executeQuery(query);
    
    if (result.length == 0)
    {
        res.json({message: `Patient does not exist with id ${id}`});
        return;
    }
    
    const patient = 
    {
        name: result[0].name,
        surname: result[0].surname,
        email: result[0].email,
        phone_number: result[0].phone_number,
        amka: result[0].amka,
        address: result[0].address,
        doc_id: result[0].doc_id,
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
    const address = req.body.address;
    const amka = req.body.amka;
    const doctor_id = req.body.doctor_id;

    /* Insert into 'user' table */
    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'patient');`;
    await driver.executeQuery(query);

    /* Get AUTO_INCREMENTED id */
    const idQuery = `SELECT id FROM physiolink.user WHERE user.username = '${username}';`;
    const id = await driver.executeQuery(idQuery);

    /* Insert the patient user into 'patient' table aswell */
    const patientQuery = `INSERT INTO physiolink.patient (id, name, surname, email, phone_number, address, amka, doc_id) VALUES ` +
                     `(${id[0].id}, '${name}', '${surname}', '${email}', '${phoneNumber}', '${address}', '${amka}', ${doctor_id});`;
    await driver.executeQuery(patientQuery);

    res.status(201).end();
}

exports.edit_patient = (req, res) =>
{

}

exports.delete_patient = (req, res) =>
{
    
}