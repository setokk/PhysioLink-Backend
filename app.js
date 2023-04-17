'use strict';

/* Dependencies */
let express = require('express');
let path = require('path');
let logger = require('morgan');

/* Router initialization */
let indexRouter = require('./routes/index');
let authRouter = require('./routes/auth');
let doctorRouter = require('./routes/doctor/doctor');
let doctorsRouter = require('./routes/doctor/doctors');
let patientRouter = require('./routes/patient/patient');
let patientsRouter = require('./routes/patient/patients');
let provisionRouter = require('./routes/provision/provision');
let provisionsRouter = require('./routes/provision/provisions');

/* Local dependencies */
require('./utils/db/DatabaseDriver');

const EmailFactory = require('./utils/email/EmailFactory');
EmailFactory.getInstance(); // Load fields from constructor


let app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

/* Routes */
app.use('/physiolink/api', indexRouter);
app.use('/physiolink/api/auth', authRouter);
app.use('/physiolink/api/doctor', doctorRouter);
app.use('/physiolink/api/doctors', doctorsRouter);
app.use('/physiolink/api/patient', patientRouter);
app.use('/physiolink/api/patients', patientsRouter);
app.use('/physiolink/api/provision', provisionRouter);
app.use('/physiolink/api/provisions', provisionsRouter);


module.exports = app;
