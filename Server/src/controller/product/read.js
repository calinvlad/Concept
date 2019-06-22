const db = require('../../../db/models')
const {success200, error500} = require('../../helpers/response')

module.exports = {
    async list(req, res) {
        await db.Product.findAll({
            include: [
                {
                    model: db.Image
                },
                {
                    model: db.Spec
                },
                {
                    model: db.Detail
                },
                {
                    model: db.Quantity
                }
            ]
        })
            .then((data) => {
                success200(res, data)
            })
            .catch(err => error500(res, err))
    },
    async listById(req, res) {

        await db.Product.findOne({
            where: {
                productId: req.params.productId
            },
            include: [{
                model: db.Image
            },{
                model: db.Spec
            },{
                model: db.Quantity
            }]
        })
            .then((product) => {
                const data = {product, views: req.views, uniqueViews: req.uniqueViews}
                success200(res, data)
            })
            .catch(err => error500(res, err))
    }
}