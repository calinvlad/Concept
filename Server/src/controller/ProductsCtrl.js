const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        const admin = req.query.adminId
        const {name, category, price} = req.body

        await db.Product.create({
            name: name,
            category: category,
            price: price,
            adminId: admin
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Product was created successfully', data: data})
            })
            .catch(err => res.status(403).send({success: false, message: 'Product creation error', data: err}))

        res.status(500).send({success: false, message: 'Internal server error'})
    },
    async list(req, res) {
        await db.Product.findAll({
            include: [{
                model: db.Image
            },
            {
                model: db.Spec
            },
            {
                model: db.Detail
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
        await db.Product.update({
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
        const adminId = req.query.adminId

        await db.Product.destroy({
            where: {
                productId: productId
            }
        })
            .then(() => res.status(200).send({success: true, message: `Product was deleted successfully`}))
            .catch(err => res.status(500).send({success: false, message: `Product could not be deleted`}))
    },
    async listById(req, res) {
        await db.Product.findOne({
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
