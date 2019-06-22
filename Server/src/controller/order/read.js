const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async list(req, res) {
        await db.Order.findAll()
            .then((data) => success200(res, data))
            .catch(err => error500(res, err))

    }
}