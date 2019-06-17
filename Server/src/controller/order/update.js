const db = require('../../../db/models')
const moment = require('moment')

module.exports = {
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
    }
}