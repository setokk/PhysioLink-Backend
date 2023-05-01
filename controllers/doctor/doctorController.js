'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_doctor = async (req, res) =>
{
    const id = req.params.id;

    const query = 'SELECT name, surname, email, phone_number, address, afm, physio_name ' +
                `FROM physiolink.doctor WHERE doctor.id = ${id};`;
    const result = await driver.executeQuery(query);

    if (result.length == 0)
    {
        res.json({message: `Doctor does not exist with id ${id}`});
        return;
    }
    
    const doctor = 
    {
        name: result[0].name,
        surname: result[0].surname,
        email: result[0].email,
        phone_number: result[0].phone_number,
        afm: result[0].afm,
        address: result[0].address,
        physio_name: result[0].physio_name,
    }
    res.json({doctor});
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
    const address = req.body.address;
    const physio_name = req.body.physio_name;

    /* Insert into 'user' table */
    const query = `INSERT INTO physiolink.user (username, password, role) VALUES ('${username}', '${password}', 'doctor');`;
    await driver.executeQuery(query);

    /* Get AUTO_INCREMENTED id */
    const idQuery = `SELECT id FROM physiolink.user WHERE user.username = '${username}'`;
    const id = await driver.executeQuery(idQuery);

    /* Insert the doctor user into 'doctor' table aswell */
    const docQuery = `INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, address, physio_name) VALUES ` +
                     `(${id[0].id}, '${name}', '${surname}', '${email}', '${phoneNumber}', '${afm}', '${address}', '${physio_name}')`;
    await driver.executeQuery(docQuery);

    res.status(201).end();
}

exports.edit_doctor = (req, res) =>
{

}

exports.delete_doctor = (req, res) =>
{
    
}