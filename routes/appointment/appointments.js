'use strict';

let express = require('express');
let router = express.Router();
const appointmentsController = require('../../controllers/appointment/appointmentsController');

router.get('/confirmed', appointmentsController.get_doctor_confirmed_appointments);
router.get('/confirmed/latest', appointmentsController.get_doctor_latest_confirmed_appointments);
router.get('/pending/:doctor_id', appointmentsController.get_doctor_pending_appointments);

module.exports = router;