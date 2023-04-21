'use strict';

let express = require('express');
let router = express.Router();
const doctorController = require('../../controllers/doctor/doctorController');
const userCreationMiddleware = require('../../middlewares/userCreationMiddleware');

router.post('/create', userCreationMiddleware.username_check, 
        doctorController.create_doctor);

module.exports = router;