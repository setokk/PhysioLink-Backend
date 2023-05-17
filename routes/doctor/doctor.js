'use strict';

let express = require('express');
let router = express.Router();
const doctorController = require('../../controllers/doctor/doctorController');
const userMiddleware = require('../../middlewares/userMiddleware');
const idMiddleware = require('../../middlewares/idMiddleware');

router.post('/create', userMiddleware.username_check, 
        doctorController.create_doctor);

router.get('/get/:id', idMiddleware.check_id,
        doctorController.get_doctor);

module.exports = router;