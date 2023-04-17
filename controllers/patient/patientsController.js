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

}