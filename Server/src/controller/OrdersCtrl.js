const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        const user = req.query.userId
        const {products, total, address} = req.body

        await db.Orders.create({
            userId: user,
            products: JSON.stringify(products),
            total: total,
            address: address
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Your order was placed', data: data})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Your order was not placed', data: err})
            })
    },
    async list(req, res) {
        await db.Orders.findAll()
            .then((data) => {
                res.status(200).send({success: true, message: 'Orders had been listed successfully', data: data})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Unsuccessful listing of orders', data: err})
            })

    },
    async update(req, res) {
        const user = req.query.userId
        const order = req.params.orderId
        const {products, total, address} = req.body
        await db.Orders.update({
            products: products,
            total: total,
            address: address
        }, {
            where: {
                orderId: order,
                userId: user
            }
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Order was updated successfully', data: data})
            })
            .catch(err => {
                res.status(403).send({success: false, message: 'Order could not be updated', data: err})
            })
    },
    async delete(req, res) {
        const order = req.params.orderId
        await db.Orders.destroy({
            where: {
                orderId: order
            }
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Order was deleted successfully'})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Order could not be deleted'})
            })
    }
};
