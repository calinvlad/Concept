const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async removeProduct(req, res, next) {
        console.log('1: ', req.product)
        const product = req.product
        let productRemovedFromCart

        await db.Cart.findOne({
            where: {
                userId: req.query.userId
            }
        })
            .then(cartData => {
                const products = JSON.parse(cartData.products)
                productRemovedFromCart = products.filter(data => data.productId !== product.productId)
            })
            .then(async () => {
                await db.Cart.update({
                    products: JSON.stringify(productRemovedFromCart)
                }, {
                    where: {
                        userId: req.query.userId
                    }
                })
                    .then((data) => {
                        req.data = data
                        next()
                    })
                    .catch(err => error500(res, err))
            })
            .catch(err => error500(res, err))
    }
}