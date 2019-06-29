const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async index(req, res) {
        await db.Subcategory.findAll()
            .then(data => success200(res, data))
            .catch(err => error500(res, err))
    },
    async onProduct(req, res, next) {
        next()
    }
}