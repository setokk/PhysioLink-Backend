'use strict';

let express = require('express');
let router = express.Router();
const appointmentsController = require('../../controllers/appointment/appointmentsController');

router.get('/confirmed', appointmentsController.get_doctor_confirmed_appointments);
router.get('/confirmed/latest', appointmentsController.get_latest_confirmed_doctor_appointments);
router.get('/pending/:doctor_id')

module.exports = router;