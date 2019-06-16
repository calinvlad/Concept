const db = require('../../db/models')
const moment = require('moment')

module.exports = {
    async create(req, res) {
        const user = req.query.userId
        const {products, total, address} = req.body

        await db.Order.create({
            userId: user,
            products: JSON.stringify(products),
            total: total,
            address: JSON.stringify(address),
            created: moment().format('YYYY/MM/DD HH:mm:ss'),
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Your order was placed', data: data})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Your order was not placed', data: err})
            })
    },
    async list(req, res) {
        await db.Order.findAll()
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
        await db.Order.update({
            products: products,
            total: total,
            address: address,
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
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
        await db.Order.destroy({
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
