const db = require('../../../db/models')
const moment = require('moment')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async create(req, res) {
        const user = req.query.userId
        const {products, total, address} = req.body

        await db.Order.create({
            userId: user,
            products: JSON.stringify(products),
            total: total,
            address: JSON.stringify(address),
            created: moment().format('YYYY/MM/DD HH:mm:ss'),
            updated: moment().format('YYYY/MM/DD HH:mm:ss')
        })
            .then((data) => {
                success200(res, data)
            })
            .catch(err => error500(res, err))
    }
}