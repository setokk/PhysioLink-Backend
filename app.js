'use strict';

/* Dependencies */
let express = require('express');
let path = require('path');
let logger = require('morgan');

/* Router initialization */
let indexRouter = require('./routes/index');
let authRouter = require('./routes/auth');
let doctorRouter = require('./routes/doctor/doctor');
let patientRouter = require('./routes/patient/patient');
const EmailFactory = require('./utils/email/EmailFactory');

/* Local dependencies */
require('./utils/db/DatabaseDriver');
EmailFactory.getInstance();

let app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

/* Routes */
app.use('/physiolink/api', indexRouter);
app.use('/physiolink/api/auth', authRouter);
app.use('/physiolink/api/doctor', doctorRouter);
app.use('/physiolink/api/patient', patientRouter);


module.exports = app;
