const db = require('../../../db/models')
const {error500} = require('../../helpers/response')

module.exports = {
    async index(req, res, next) {
        await db.Cart.findOne({
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
}