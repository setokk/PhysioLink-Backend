'use strict';

/* Dependencies */
let express = require('express');
let path = require('path');
let logger = require('morgan');

/* Router initialization */
let indexRouter = require('./routes/index');
let authRouter = require('./routes/auth');
let psfRouter = require('./routes/psf');
let doctorRouter = require('./routes/doctor/doctor');
let doctorsRouter = require('./routes/doctor/doctors');
let patientRouter = require('./routes/patient/patient');
let patientsRouter = require('./routes/patient/patients');
let serviceRouter = require('./routes/service/service');
let servicesRouter = require('./routes/service/services');
let appointmentRouter = require('./routes/appointment/appointment');

/* Local dependencies */
await require('./utils/db/DatabaseDriver').executeQuery('SET autocommit=0;');

const EmailFactory = require('./utils/email/EmailFactory');
EmailFactory.getInstance(); // Load fields from constructor

/* App */
let app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

/* Routes */
app.use('/physiolink/api', indexRouter);
app.use('/physiolink/api/auth', authRouter);
app.use('/physiolink/api/psf', psfRouter);
app.use('/physiolink/api/doctor', doctorRouter);
app.use('/physiolink/api/doctors', doctorsRouter);
app.use('/physiolink/api/patient', patientRouter);
app.use('/physiolink/api/patients', patientsRouter);
app.use('/physiolink/api/service', serviceRouter);
app.use('/physiolink/api/services', servicesRouter);
app.use('/physiolink/api/appointment', appointmentRouter);

module.exports = app;
