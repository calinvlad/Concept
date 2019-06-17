const db = require('../../../db/models')
const fs = require('fs')

module.exports = {
    async delete(req, res, next) {
        const productId = req.params.productId
        const adminId = req.query.adminId

        await db.Product.destroy({
            where: {
                productId: productId
            }
        })
            .then((data) => {
                if(data === 0) {
                    res.status(400).send({success: false, message: `There is no matching product to delete`})
                }
                if(data !== 0) {
                    res.status(200).send({success: true, message: `Product was deleted successfully`})
                }

            })
            .catch(err => res.status(500).send({success: false, message: `Product could not be deleted`}))
    },
    async imagesFromFileSystem(req, res, next) {
        await db.Image.findAll({
            where: {productId: req.params.productId}
        })
            .then((images) => {
                let imagePath = []
                images.forEach(image => {
                    imagePath.push(image.image)
                })

                for(let i = 0; i < imagePath.length; i++) {

                    fs.unlink(`./uploads/${imagePath[i]}`, (err) => {
                        console.log(`${imagePath[i]} was deleted`)
                    });

                    if(i === imagePath.length - 1) {
                        break
                    }
                }
                next()

            })
            .catch(err => res.status(500).send({success: false, message: `No images`}))
    }
}