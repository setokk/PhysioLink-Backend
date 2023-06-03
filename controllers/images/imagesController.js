'use strict';

const path = require('path');

const driver = require('../../utils/db/DatabaseDriver');

exports.get_image = async (req, res) =>
{
    const user_id = req.params.user_id;
 
    const user = await driver.executeQuery('SELECT user.image FROM physiolink.user ' +
            `WHERE user.id=${user_id};`);
    
    
    res.sendFile(user[0].image);
}

exports.upload_image = async (req, res) =>
{
    const user_id = req.params.user_id;
    const image = req.files.image;

    const filePath = path.join(process.cwd(), '/images/profile/') + user_id + "." +
        image.name.split(".")[1];
    console.log(filePath);

    image.mv(filePath, async (err) => {
        if (err) {
          console.error('Error saving image:', err);
          res.sendStatus(500);
          return;
        }
        
        await driver.executeQuery('UPDATE physiolink.user ' + 
            `SET user.image='${path.resolve(filePath)}' ` +
            `WHERE user.id=${user_id}`);

        console.log('Image saved:', filePath);
        res.sendStatus(200);
      });
}