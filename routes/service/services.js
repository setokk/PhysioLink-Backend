'use strict';

let express = require('express');
let router = express.Router();
const servicesController = require('../../controllers/service/servicesController');

router.get('/get', servicesController.get_all_services);
router.get('/of/:doctor_id', servicesController.get_doctor_services);
router.get('/not/of/:doctor_id', servicesController.get_excluded_doctor_services);

module.exports = router;