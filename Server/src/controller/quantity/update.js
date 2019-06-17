const db = require('../../../db/models')
const moment = require('moment')

module.exports = {
    async update(req, res) {
        let value
        console.log('QUERY', req.query.productId)
        await db.Quantity.findOne({
            where: {
                productId: req.query.productId
            }
        })
            .then((data) => {
                if(req.body.more) {
                    console.log('DATA***', data.quantity + ' ' + data.productId)
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