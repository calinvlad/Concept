const db = require('../../db/models')

module.exports = {
    async create(req, res) {
        console.log('body', req.body.text)
        await db.Specs.create({
            text: req.body.text,
            userId: req.query.userId,
            productId: req.query.productId
        })
            .then((data) => res.status(200).send({success: true, message: 'Specifications created successfully'}))
            .catch(err => res.status(400).send({success: false, message: 'Specifications could not be created'}))
    },
    async update(req, res) {
        await db.Specs.update({
            text: req.body.text
        }, {
            where: {
                specId: req.query.specId,
            }
        })
    },
    async delete(req, res) {
        await db.Specs.destroy({
            where: {
                specId: req.query.specId,
            }
        })
    }
}