const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        console.log('////////////////////////////')
        console.log('FILE: ', req.file)
        console.log('Product', req.query.productId)
        //
        await db.Images.create({
            productId: req.query.productId,
            image: req.file.path
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Image was created successfully'})
            })
            .catch(err => res.status(400).send({success: false, message: err}))
    }
}
