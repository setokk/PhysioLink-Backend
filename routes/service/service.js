'use strict';

let express = require('express');
let router = express.Router();
const serviceController = require('../../controllers/service/serviceController');
const serviceMiddleware = require('../../middlewares/serviceMiddleware');

router.post('/create', serviceMiddleware.check_service_exists,
                serviceController.create_service);
router.post('/link', serviceController.link_service_to_doc);
router.post('/delete', serviceController.delete_service_of);
router.get('/get/:id', serviceController.get_service);

module.exports = router;