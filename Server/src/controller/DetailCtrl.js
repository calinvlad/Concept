const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        console.log('body', req.body)
        await db.Detail.create({
            text: req.body.text,
            adminId: req.query.adminId,
            productId: req.query.productId
        })
            .then((data) => res.status(200).send({success: true, message: 'Specifications created successfully', data: data}))
            .catch(err => res.status(400).send({success: false, message: 'Specifications could not be created', data: err}))
    },
    async update(req, res) {
        await db.Detail.update({
            text: req.body.text
        }, {
            where: {
                specId: req.query.specId,
            }
        })
    },
    async delete(req, res) {
        await db.Detail.Specs.destroy({
            where: {
                specId: req.query.specId,
            }
        })
    }
}