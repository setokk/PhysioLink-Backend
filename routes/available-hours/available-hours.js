'use strict';

let express = require('express');
let router = express.Router();
const availableHoursController = require('../../controllers/available-hours/availableHoursController');

router.post('/get', availableHoursController.get_hours_of_month);

module.exports = router;