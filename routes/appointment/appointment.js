'use strict';

let express = require('express');
let router = express.Router();
const appointmentController = require('../../controllers/appointment/appointmentController');

router.post('/request', appointmentController.request_appointment);
router.post('/accept', appointmentController.accept_appointment);
router.post('/payment/accept', appointmentController.accept_payment);
router.delete('/decline', appointmentController.decline_appointment);

router.get('/patient/upcoming', appointmentController.get_patient_upcoming_appointment);

module.exports = router;