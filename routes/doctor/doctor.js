'use strict';

'use strict';

let express = require('express');
let router = express.Router();
const doctorController = require('../../controllers/doctor/doctorController');

router.post('/create', doctorController.create_doctor);

module.exports = router;