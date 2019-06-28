const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async index(req, res) {
        await db.Category.update({
            name: req.body.name
        }, {
            where: {
                // name: req.query.categoryName,
                categoryId: req.query.categoryId
            }
        })
            .then(data => success200(res, data))
            .catch(err => error500(res, err))
    }
}