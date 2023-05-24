'use strict';

let express = require('express');
let router = express.Router();
const appointmentController = require('../../controllers/appointment/appointmentController');
const appointmentMiddleware = require('../../middlewares/appointmentMiddleware');

router.post('/request', appointmentMiddleware.check_appointment_exists, 
            appointmentController.request_appointment);
router.post('/accept', appointmentController.accept_appointment);
router.post('/decline', appointmentController.decline_appointment);
router.post('/payment/accept', appointmentController.accept_payment);

router.get('/patient/upcoming', appointmentController.get_patient_upcoming_appointment);
router.get('/patient/previous', appointmentController.get_patient_previous_appointment);

module.exports = router;