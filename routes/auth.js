'use strict';

let express = require('express');
let router = express.Router();
const authController = require('../controllers/authController');

router.post('/log-in', authController.log_in);
router.post('/password/change', authController.change_password);

module.exports = router;
