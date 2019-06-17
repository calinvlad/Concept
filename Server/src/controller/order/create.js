const db = require('../../../db/models')
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
    }
}