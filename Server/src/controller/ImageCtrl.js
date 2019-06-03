const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        console.log('FILE: ', req.file)
        await db.Images.create({
            productId: req.query.productId,
            image: req.file.filename
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Image was created successfully'})
            })
            .catch(err => res.status(400).send({success: false, message: err}))
    }
}
