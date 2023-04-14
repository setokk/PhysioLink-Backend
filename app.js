'use strict';

/* Dependencies */
let express = require('express');
let path = require('path');
let logger = require('morgan');

/* Router initialization */
let indexRouter = require('./routes/index');
let authRouter = require('./routes/auth');

let app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

/* Routes */
app.use('/physiolink/api', indexRouter);
app.use('/physiolink/api/auth', authRouter);


module.exports = app;
