const db = require('../../../db/models')

module.exports = {
    async list(req, res) {
        await db.Order.findAll()
            .then((data) => {
                res.status(200).send({success: true, message: 'Orders had been listed successfully', data: data})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Unsuccessful listing of orders', data: err})
            })

    }
}