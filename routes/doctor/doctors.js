'use strict';

let express = require('express');
let router = express.Router();
const doctorsController = require('../../controllers/doctor/doctorsController');

router.get('/get', doctorsController.get_all_doctors);

module.exports = router;