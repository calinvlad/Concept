const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async index(req, res, next) {
        await db.Cart.create({
            products: req.body.product,
            userId: req.user.userId || req.params.userId || req.query.userId
        })
            .then((data) => {
                req.cart = data
                next()
            })
            .catch(err => error500(res, err))
    }
}