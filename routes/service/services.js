'use strict';

let express = require('express');
let router = express.Router();
const servicesController = require('../../controllers/service/servicesController');

router.get('/get', servicesController.get_all_services);

module.exports = router;