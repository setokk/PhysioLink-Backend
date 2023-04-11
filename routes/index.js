'use-strict';

let express = require('express');
let router = express.Router();
const indexController = require('../controllers/indexController.js');

/* GET documentation page. */
router.get('/', indexController.show_documentation);

module.exports = router;    
