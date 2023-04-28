'use strict';

const driver = require('../../utils/db/DatabaseDriver');

exports.get_all_patients = async (req, res) =>
{
    const query = 'SELECT * FROM physiolink.patient;';
    const patients = await driver.executeQuery(query);
    res.json(patients);
}

exports.get_doctor_patients = async (req, res) =>
{
    const doc_id = req.params.doc_id;

    const query = 'SELECT user.id, username, name, surname, email, phone_number, address, amka ' 
                    + 'FROM physiolink.patient INNER JOIN physiolink.user '
                    + `ON patient.id = user.id WHERE patient.doc_id = ${doc_id};`;
    const patients = await driver.executeQuery(query);

    if (patients.length == 0)
    {
        res.json({message: `No patients for doctor with id ${doc_id}`});
        return;
    }

    res.json({patients});
}