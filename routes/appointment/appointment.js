'use strict';

let express = require('express');
let router = express.Router();
const appointmentController = require('../../controllers/appointment/appointmentController');

router.post('/request', appointmentController.request_appointment);
router.post('/accept', appointmentController.accept_appointment);

module.exports = router;