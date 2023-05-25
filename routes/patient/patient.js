'use strict';

let express = require('express');
let router = express.Router();
const patientController = require('../../controllers/patient/patientController');
const userMiddleware = require('../../middlewares/userMiddleware');

router.post('/create', userMiddleware.username_check, 
        patientController.create_patient);
router.post('/edit', patientController.edit_patient);
router.get('/get/:id', patientController.get_patient);

module.exports = router;