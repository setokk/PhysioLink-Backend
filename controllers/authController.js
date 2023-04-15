'use strict';

const bcrypt = require('bcrypt');

exports.log_in = (req, res) =>
{
    res.json({ id: 1, role: 'doctor', name: 'please', surname: 'work', email: 'test@gmail.com', phone_number: '6945345678', afm: '231314155'});
}

