const db = require('../../../db/models')
const{success200, error500, error404} = require('../../helpers/response')

module.exports = {
    async update(req, res) {
        await db.Detail.update({
            text: req.body
        }, {
            where: {detailId: req.params.detailId}
        })
            .then((data) => {
                success200(res, data[0])
            })
            .catch(err => error500(res, err))
    }
}