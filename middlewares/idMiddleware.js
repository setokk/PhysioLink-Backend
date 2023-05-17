'use strict';

const Error = require('../utils/error/Error');

exports.check_id = async (req, res, next) => {
    const { id } = req.params;

    if (isNaN(id) || id >= 1000000) { // Temporary one million users maximum; subject to change
        res.status(400).json({message: Error.INVALID_PARAMETERS});
    } else { 
        next();
        return;
    }
}