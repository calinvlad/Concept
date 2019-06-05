const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        const user = req.query.userId
        const {name, category, price} = req.body

        await db.Products.create({
            name: name,
            category: category,
            price: price,
            userId: user
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Product was created successfully', data: data})
            })
            .catch(err => res.status(403).send({success: false, message: 'Product creation error', data: err}))

        res.status(500).send({success: false, message: 'Internal server error'})
    },
    async list(req, res) {
        await db.Products.findAll({
            include: [{
                model: db.Images
            }]
        })
            .then(async (data) => {
                res.status(200).send({success: true, message: '', data: data})
            })
            .catch(err => res.status(500).send({success: false, message: 'Internal server error'}))
    },
    async update(req, res) {
        const productId = req.params.productId
        const {name, price, category} = req.body
        await db.Products.update({
            name: name,
            category: category,
            price: price
        },{
            where: {
                productId: productId
            }
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Product was updated successfully', data: data})
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
    },
    async listById(req, res) {
        await db.Products.findOne({
            where: {
                productId: req.params.productId
            },
            include: [{
                model: db.Images
            },{
                model: db.Specs
            }]
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Fetching product went fine', data: data})
            })
            .catch(err => res.status(400).send({success: false, message: 'Product could not be fetched', data: err}))
    }
}
