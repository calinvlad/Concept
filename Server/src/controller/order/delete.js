const db = require('../../../db/models')

module.exports = {
    async delete(req, res) {
        const order = req.params.orderId
        await db.Order.destroy({
            where: {
                orderId: order
            }
        })
            .then((data) => {
                res.status(200).send({success: true, message: 'Order was deleted successfully'})
            })
            .catch(err => {
                res.status(400).send({success: false, message: 'Order could not be deleted'})
            })
    }
}