const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async create(req, res) {
        let text = req.body.text ? req.body.text : ''

        await db.Detail.create({
            adminId: req.query.adminId,
            productId: req.product,
            text: text
        })
            .then((data) => success200(res, data))
            .catch(err => error500(res, err))
    }
}