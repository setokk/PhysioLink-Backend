'use strict';

let express = require('express');
let router = express.Router();
const patientsController = require('../../controllers/patient/patientsController');

router.get('/of/:doc_id', patientsController.get_doctor_patients);
router.get('/get', patientsController.get_all_patients);

module.exports = router;