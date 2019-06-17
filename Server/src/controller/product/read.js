const db = require('../../../db/models')

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
            .then(async (data) => {
                res.status(200).send({success: true, message: '', data: data})
            })
            .catch(err => res.status(500).send({success: false, message: 'Internal server error'}))
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
                res
                    .status(200)
                    .send({success: true, message: 'Fetching product went fine', data: data})
            })
            .catch(err => res.status(400).send({success: false, message: 'product could not be fetched', data: err}))
    }
}