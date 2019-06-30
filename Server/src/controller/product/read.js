const db = require('../../../db/models')
const {success200, error500} = require('../../helpers/response')

module.exports = {
    async index(req, res, next) {
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
                req.data = data
                next()
            })
            .catch(err => error500(res, err))
    },
    async listById(req, res, next) {
        await db.Product.findOne({
            where: {
                productId: req.params.productId
            },
            include: [{
                model: db.Image
            },{
                model: db.Detail
            },{
                model: db.Spec
            },{
                model: db.Quantity
            }]
        })
            .then((product) => {
                req.data = {product, views: req.views, uniqueViews: req.uniqueViews}
                next()
            })
            .catch(err => error500(res, err))
    }
}