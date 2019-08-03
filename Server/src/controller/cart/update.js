const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async addProduct(req, res, next) {
        const product = req.product
        // Calculate product price based on quantity number
        const price = req.product.price * req.product.quantity
        product.price = price

        let products

        await db.Cart.findOne({
            where: {
                userId: req.query.userId
            }
        })
            .then(cartData => {
                products = cartData.products
                const checkProductInCart = products.filter(data => data.productId === product.productId)
                if (!checkProductInCart[0]) {
                    products.push(product)
                    return products
                }
                else {
                    error500(res, 'Will we update quantity here? || Product already in cart?')
                }
            })
            .then(async (products) => {
                if (products) {
                    // Calculate total
                    let total =  0
                    products.forEach(product => {
                        total += product.price

                    })
                    await db.Cart.update({
                        products: products,
                        total: total
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
                }
            })
            .catch(err => error500(res, err))
    },
    async total(req, res) {
        let cartId
        await db.Cart.findOne({
            where: {
                userId: req.query.userId
            },
            attributes: ['cartId', 'products', 'total', 'userId']
        })
            .then(async cart => {
                console.log('cccc', cart)

                cartId = cart.cartId
                let total = 0
                console.log('1', total)
                const products = JSON.parse(cart.products)
                products.forEach(product => {
                    total += parseFloat(product.price)
                    console.log(2, total)
                })
                return total
            })
            .then(async total => {
                console.log('total', total)
                console.log('cartid', cartId)

                await db.Cart.update({
                    total: total
                },{
                    where: {
                        userId: req.query.userId
                    }
                })
                    .then(updatedCart => {
                        console.log(updatedCart)
                        res.status(200).send({data: updatedCart})
                    })
                    .catch(err => error500(res, err))
            })
            .catch(err => error500(res, err))
    }
}