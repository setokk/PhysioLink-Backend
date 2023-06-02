'use strict';

let express = require('express');
const fileUpload = require('express-fileupload');

let router = express.Router();
const imagesController = require('../../controllers/images/imagesController');
const imagesMiddleware = require('../../middlewares/imagesMiddleware');

router.get('/get/:user_id', imagesMiddleware.check_image_exists, 
            imagesController.get_image);
router.post('/upload/:user_id', fileUpload(), imagesController.upload_image);

module.exports = router;