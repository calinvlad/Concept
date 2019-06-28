const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async index(req, res) {
        await db.Category.destroy({
            where: {
                name: req.query.categoryName
            }
        })
            .then(data => success200(res, data))
            .catch(err => error500(res, err))
    }
}