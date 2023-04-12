'use strict';

let nodemailer = require('nodemailer');
require('dotenv').config();

const email = 'physiolinkservice@gmail.com';

// In order to work with gmail we have to
// generate an app password from gmail settings
// and pass it to pass
let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: email,
        pass: process.env.GMAIL_PASS,
    },
});

module.exports = transporter;