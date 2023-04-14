'use strict';

let express = require('express');
let router = express.Router();
const authController = require('../controllers/authController');

router.post('/log-in', authController.log_in);

module.exports = router;
