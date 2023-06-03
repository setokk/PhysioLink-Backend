'use strict';

const path = require('path');
const sharp = require('sharp');

const driver = require('../../utils/db/DatabaseDriver');

const HOSTNAME = 'http://physiolink.chibo.uk';

exports.get_image = async (req, res) =>
{
    const user_id = req.params.user_id;
    res.sendFile(path.join(process.cwd(), `/images/profile/${user_id}.jpeg`));
}

exports.upload_image = async (req, res) =>
{
    const user_id = req.params.user_id;
    let image = req.files.image;

    const filePath = path.join(process.cwd(), '/images/profile/') + user_id + ".jpeg";
    console.log(filePath);

    sharp(image.data)
        .toFormat('jpeg')
        .toBuffer()
        .then((convertedImage) =>
        {
            image.data = convertedImage;
            
            image.mv(filePath, async (err) => {
                if (err) {
                  console.error('Error saving image:', err);
                  res.sendStatus(500);
                  return;
                }
                
                await driver.executeQuery('UPDATE physiolink.user ' + 
                    `SET user.image='${HOSTNAME + '/physiolink/api/images/get/'}${user_id}' ` +
                    `WHERE user.id=${user_id}`);
        
                console.log('Image saved:', filePath);
                res.sendStatus(200);
              });

        });
}