const db = require('../../db/models')
const fs = require('fs')

module.exports = {
    async create(req, res) {
        console.log('FILE: ', req.file)
        console.log('PRODUCT: ', req.query)
        await db.Image.create({
            productId: req.query.productId,
            image: req.file.filename
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Image was created successfully'})
            })
            .catch(err => res.status(400).send({success: false, message: err}))
    },
    async delete(req, res) {
        fs.unlink(`./uploads/${req.query.filePath}`, async (err) => {
            if(err) {res.status(400).send({success: false, message: 'File was not deleted', data: err})}
            await db.Image.destroy({
                where: {
                    imageId: req.query.imageId
                }
            })
                .then(() => res.status(200).send({success: true, message: 'Image was deleted successfully'}))
                .catch(err => res.status(400).send({success: false, message: 'Image could not be deleted', data: err}))
        })
    }
}
