'use strict';

let path = require('path');

exports.show_documentation = (req, res) =>
{
    res.sendFile(path.join(__dirname, '../documentation/documentation.html'));
}