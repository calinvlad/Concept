const moment = require('moment')
const db = require('../../../db/models')
const {success200, error500} = require('../../helpers/response')

module.exports = {
    async update(req, res) {
        const productId = req.params.productId
        const {name, price, category} = req.body
        await db.Product.update({
            name: name,
            category: category,
            price: price,
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        },{
            where: {
                productId: productId
            }
        })
            .then((data) => success200(res, data))
            .catch(err => error500(res, err))
    }
}