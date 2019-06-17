const moment = require('moment')
const db = require('../../../db/models')

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
            .then((data) => {
                res.status(200).send({success: true, message: 'product was updated successfully', data: data})
            })
            .catch(err => res.status(403).send({success: false, message: 'product could not be updated', data: err}))
    }
}