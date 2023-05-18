'use strict';

let express = require('express');
let router = express.Router();
const appointmentsController = require('../../controllers/appointment/appointmentsController');

router.get('/of/:doc_id', appointmentsController.get_doctor_appointments);

module.exports = router;