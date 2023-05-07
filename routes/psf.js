'use strict';

let express = require('express');
let router = express.Router();
const psfController = require('../controllers/psfController.js');
const userMiddleware = require('../middlewares/userMiddleware');

router.post('/create', userMiddleware.username_check,
        psfController.create_psf);

module.exports = router;