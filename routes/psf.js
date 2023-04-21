'use strict';

let express = require('express');
let router = express.Router();
const psfController = require('../controllers/psfController.js');
const userCreationMiddleware = require('../middlewares/userCreationMiddleware');

router.post('/create', userCreationMiddleware.username_check,
        psfController.create_psf);

module.exports = router;