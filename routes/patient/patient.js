'use strict';

let express = require('express');
let router = express.Router();
const patientController = require('../../controllers/patient/patientController');
const userCreationMiddleware = require('../../middlewares/userCreationMiddleware');

router.post('/create', userCreationMiddleware.username_check, 
        patientController.create_patient);
router.get('/get/:id', patientController.get_patient);

module.exports = router;