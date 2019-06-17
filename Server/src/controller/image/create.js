const db = require('../../../db/models')

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
    }
}