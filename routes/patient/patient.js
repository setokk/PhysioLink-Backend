'use strict';

let express = require('express');
let router = express.Router();
const patientController = require('../../controllers/patient/patientController');

router.post('/create', patientController.create_patient);

module.exports = router;