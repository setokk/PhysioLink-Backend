'use strict';

const transporter = require('./transporter');
const handlebars = require('handlebars');
const fs = require('fs');
const path = require('path');

/**
 * This class is used for sending template emails.
 * It uses the singleton pattern.
 */
class EmailFactory 
{
    static emailFactory;

    #requestHtml;
    #declinedHtml;
    #acceptedHtml;
    #paymentHtml;

    constructor() 
    {
        const requestHtmlPath = path.join(__dirname, '../email/templates/new_request.html');
        this.requestHtml = fs.readFileSync(requestHtmlPath, 'utf-8').toString();      

        const declinedHtmlPath = path.join(__dirname, '../email/templates/request_declined.html');
        this.declinedHtml = fs.readFileSync(declinedHtmlPath, 'utf-8').toString();

        const acceptedHtmlPath = path.join(__dirname, '../email/templates/request_accepted.html');
        this.acceptedHtml = fs.readFileSync(acceptedHtmlPath, 'utf-8').toString();

        const paymentHtmlPath = path.join(__dirname, '../email/templates/payment_completed.html');
        this.paymentHtml = fs.readFileSync(paymentHtmlPath, 'utf-8').toString();
    }

    static getInstance()
    {
        if (this.emailFactory === undefined)
            this.emailFactory = new EmailFactory();
            
        return this.emailFactory;
    }


    async sendRequestEmail(toDoctor, patient)
    {
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(this.requestHtml);
        const replacements = {
            name: patient.name,
            surname: patient.surname,
            phoneNumber: patient.phoneNumber,
            date: patient.date,
            hour: patient.hour,
            message: patient.message
        };
        const htmlToSend = template(replacements);

        var mailOptions = {
            to: toDoctor,
            subject: "Νέο Αίτημα Ραντεβού PhysioLink",
            html: htmlToSend,
            attachments: [{
                filename: 'logo.png',
                path: logoPath,
                cid: 'logo'
            }]
        };
    
        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
    }

    async sendDeclinedRequestEmail(toPatient, doctor)
    {
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(this.declinedHtml);
        const replacements = {
            name: doctor.name,
            surname: doctor.surname,
            phoneNumber: doctor.phoneNumber,
            date: doctor.date,
            reason: doctor.reason
        };
        const htmlToSend = template(replacements);

        var mailOptions = {
            to: toPatient,
            subject: "Ακύρωση Αιτήματος Ραντεβού PhysioLink",
            html: htmlToSend,
            attachments: [{
                filename: 'logo.png',
                path: logoPath,
                cid: 'logo'
            }]
        };
    
        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
    }

    async sendAcceptedRequestEmail(toPatient, doctor)
    {
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(this.acceptedHtml);
        const replacements = {
            name: doctor.name,
            surname: doctor.surname,
            phoneNumber: doctor.phoneNumber,
            date: doctor.date
        };
        const htmlToSend = template(replacements);

        var mailOptions = {
            to: toPatient,
            subject: "Αποδοχή Αιτήματος Ραντεβού PhysioLink",
            html: htmlToSend,
            attachments: [{
                filename: 'logo.png',
                path: logoPath,
                cid: 'logo'
            }]
        };
    
        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
    }

    async sendCompletedPaymentEmail(toPatient, doctor)
    {
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(this.paymentHtml);
        const replacements = {
            service_name: doctor.service_name,
            price: doctor.price,
            description: doctor.description,
            date: doctor.date
        };
        const htmlToSend = template(replacements);

        var mailOptions = {
            to: toPatient,
            subject: "Ολοκλήρωση Πληρωμής Ραντεβού PhysioLink",
            html: htmlToSend,
            attachments: [{
                filename: 'logo.png',
                path: logoPath,
                cid: 'logo'
            }]
        };
    
        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                console.log(error);
            } else {
                console.log('Email sent: ' + info.response);
            }
        });
    }
}

module.exports = EmailFactory;