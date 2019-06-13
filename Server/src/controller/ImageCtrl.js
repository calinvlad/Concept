const db = require('../../db/models')
const fs = require('fs')

module.exports = {
    async create(req, res) {
        let images = []
        req.files.forEach(file => {
            images.push({image: file.filename, productId: req.query.productId})
        })
        await db.Image.bulkCreate(images)
            .then((data) => {
                if(data.length > 0) res.status(200).send({success: true, message: 'Images were created successfully', data: data})
                if(data.length === 0 || !data) res.status(500).send({success: false, message: 'Internal server error'})
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
                .then((data) => {
                    if(data === 0 && !data) return
                    res.status(200).send({success: true, message: 'Image was deleted successfully'})
                })
                .catch(err => res.status(400).send({success: false, message: 'Image could not be deleted', data: err}))
        })
    }
}
