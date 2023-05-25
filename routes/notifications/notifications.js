'use strict';

let express = require('express');
let router = express.Router();
const notificationsController = require('../../controllers/notifications/notificationsController');

router.get('/notifications/of/:user_id', notificationsController.get_new_notifications);

module.exports = router;