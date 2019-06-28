const db = require('../../../db/models')
const{success200, error500} = require('../../helpers/response')

module.exports = {
    async index(req, res) {
        let categoryName;
        if(req.body.categoryName) {
            categoryName = {categoryName: req.body.categoryName}
        }
        await db.Subcategory.update({
            name: req.body.name,
            ...categoryName
        }, {
            where: {
                // name: req.query.subcategoryName,
                subcategoryId: req.query.subcategoryId
            }
        })
            .then(data => success200(res, data))
            .catch(err => error500(res, err))
    }
}