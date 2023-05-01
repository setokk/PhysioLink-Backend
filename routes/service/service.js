'use strict';

let express = require('express');
let router = express.Router();
const serviceController = require('../../controllers/service/serviceController');
const serviceCreationMiddleware = require('../../middlewares/serviceCreationMiddleware');

router.post('/create', serviceCreationMiddleware.check_service_exists,
                serviceController.create_service);
router.get('/get/:id', serviceController.get_service);

module.exports = router;