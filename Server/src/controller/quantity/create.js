const db = require('../../../db/models')
const moment = require('moment')

module.exports = {
    async create(req, res) {
        let quantity = {}
        if(req.body.quantity) {
            quantity = {quantity: req.body.quantity}
        }
        await db.Quantity.create({
            ...quantity,
            created: moment().format('YYYY/MM/DD HH:mm:ss'),
            updated: moment().format('YYYY/MM/DD HH:mm:ss'),
            productId: req.product,
        })
            .then((data) => res.status(200).send({success: true, message: 'Product was created successfully', data: data}))
            .catch(err => res.status(500).send({success: false, data: err}))
    }
}