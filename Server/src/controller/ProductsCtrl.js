const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        const user = req.body.userId
        const {name, category, price, images} = req.body

        await db.Products.create({
            name: name,
            category: category,
            price: price,
            images: images,
            userId: user
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Product was created successfully', data: data})
            })
            .catch(err => res.status(403).send({success: false, message: 'Product creation error', data: err}))

        res.status(500).send({success: false, message: 'Internal server error'})
    },
    async list(req, res) {
        await db.Products.findAll()
            .then((data) => {
                res.status(200).send({success: true, message: '', data: data})
            })
            .catch(err => res.status(500).send({success: false, message: 'Internal server error'}))
    },
    async update(req, res) {
        const productId = req.params.productId
        const userId = req.query.userId
        const {name, price, category} = req.body
        await db.Products.update({
            name: name,
            category: category,
            price: price
        },{
            where: {
                userId: userId,
                productId: productId
            }
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Product was updated successfully'})
            })
            .catch(err => res.status(403).send({success: false, message: 'Product could not be updated', data: err}))
    },
    async delete(req, res) {
        const productId = req.params.productId
        const userId = req.query.userId

        await db.Products.destroy({
            where: {
                productId: productId
            }
        })
            .then(() => res.status(200).send({success: true, message: `Product was deleted successfully`}))
            .catch(err => res.status(500).send({success: false, message: `Product could not be deleted`}))
    }
}