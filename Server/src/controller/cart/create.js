const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async onRegister(req, res, next) {
        console.log('HERE I AM CREATING A CART')
        const products = JSON.stringify([])

        await db.Cart.create({
            products: products,
            userId: req.user.userId || req.params.userId || req.query.userId
        })
            .then((data) => {
                req.cart = data
                next()
            })
            .catch(err => error500(res, err))
    }
}