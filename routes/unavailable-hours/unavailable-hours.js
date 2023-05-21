'use strict';

let express = require('express');
let router = express.Router();
const unavailableHoursController = require('../../controllers/unavailable-hours/unavailableHoursController');

router.post('/get', unavailableHoursController.get_unavailable_hours);

module.exports = router;