const db = require('../../db/models')
const moment = require('moment')

/**
 * Create
 * Update
 */

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
    },

    async update(req, res) {
        let value
        await db.Quantity.findOne({
            productId: req.query.productId
        })
            .then((data) => {
                if(req.body.more) {
                    console.log('DATA***', data.quantity)
                    console.log('Quantity***', req.body.quantity)
                    value = data.quantity + req.body.quantity
                    console.log('VALUE***', value)
                }
                if(req.body.less) {
                    value = data.quantity - req.body.quantity < 0 ? 0 : data.quantity - req.body.quantity
                }
            })

        await db.Quantity.update({
            quantity: value,
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        }, {
            where: {productId: req.query.productId}
        })
            .then((data) => res.status(200).send({success: true, message: 'Quantity updated successful', data: data}))
            .catch(err => res.status(500).send({success: false, message: 'Internal server error', data: err}))
    }

}