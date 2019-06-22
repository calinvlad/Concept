
const db = require('../../../db/models')
const moment = require('moment')
const {success200, error500, error404} = require('../../helpers/response')

module.exports = {
    async update(req, res) {
        let value
        await db.Quantity.findOne({
            where: {
                productId: req.query.productId
            }
        })
            .then((data) => {
                if(req.body.more) {
                    value = data.quantity + req.body.quantity
                }
                if(req.body.less) {
                    value = data.quantity - req.body.quantity < 0 ? 0 : data.quantity - req.body.quantity
                }
            })
            .catch(err => error404(res, err))

        await db.Quantity.update({
            quantity: value,
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        }, {
            where: {productId: req.query.productId}
        })
            .then((data) => success200(res, data))
            .catch(err => error500(res, err))
    }
}