'use strict';

let path = require('path');

exports.show_documentation = (req, res) =>
{
    res.sendFile(path.join(__dirname, '../documentation/documentation.html'));
}

exports.show_android_documentation = (req, res) =>
{
    res.sendFile(path.join(__dirname, '../documentation/mobiile-documentation.html'));
}