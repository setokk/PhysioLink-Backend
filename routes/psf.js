'use strict';

let express = require('express');
let router = express.Router();
const psfController = require('../controllers/psfController.js');

router.post('/create', psfController.create_psf);

module.exports = router;