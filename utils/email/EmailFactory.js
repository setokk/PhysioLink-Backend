'use strict';

const transporter = require('./transporter');
const handlebars = require('handlebars');
const fs = require('fs');
const path = require('path');

class EmailFactory 
{
    static async sendRequestEmail(toDoctor, patient)
    {
        const filePath = path.join(__dirname, '../email/templates/new_request.html');
        const source = fs.readFileSync(filePath, 'utf-8').toString();
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(source);
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

    static async sendDeclinedRequestEmail(toPatient, doctor)
    {
        const filePath = path.join(__dirname, '../email/templates/request_declined.html');
        const source = fs.readFileSync(filePath, 'utf-8').toString();
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(source);
        const replacements = {
            name: doctor.name,
            surname: doctor.surname,
            phoneNumber: doctor.phoneNumber,
            reason: doctor.reason,
            date: doctor.date
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

    static async sendAcceptedRequestEmail(toPatient, doctor)
    {
        const filePath = path.join(__dirname, '../email/templates/request_accepted.html');
        const source = fs.readFileSync(filePath, 'utf-8').toString();
        const logoPath = path.join(__dirname, '../email/templates/icons/logo.png');

        const template = handlebars.compile(source);
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
}

const doctorEmail = "tesmtracks@gmail.com";
const patient = {
    name: "Kwstas",
    surname: "Ok",
    phoneNumber: "6937324567",
    date: "12/07/2023",
    hour: "16:15",
    message: "Ponaei o laimos moy bohtheia"
};
EmailFactory.sendRequestEmail(doctorEmail, patient);