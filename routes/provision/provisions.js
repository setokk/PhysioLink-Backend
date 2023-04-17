'use strict';

let express = require('express');
let router = express.Router();
const provisionsController = require('../../controllers/provision/provisionsController');

router.get('/get', provisionsController.get_all_provisions);

module.exports = router;