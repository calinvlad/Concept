const moment = require('moment')
const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async create(req, res, next) {
        const admin = req.query.adminId
        const {name, category, price} = req.body
        console.log('!!!!!!!!!!!!!!!!!!!!!!!!!!!')

        await db.Product.create({
            name: name,
            category: category,
            price: price,
            adminId: admin,
            created: moment().format('YYYY/MM/DD HH:mm:ss'),
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        })
            .then((data) => {
                req.product = data.productId
                next()
            })
            // .catch(err => res.status(403).send({success: false, message: 'product creation error', data: err}))
            .catch(err => error500(res, err))
    },
}