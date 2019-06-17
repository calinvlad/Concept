const db = require('../../../db/models')

module.exports = {
    async register(req, res) {
        await db.Admin.create({
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            phone: req.body.phone,
            pass: req.body.pass
        })
            .then(async (data) => {
                res.status(200).send({success: true, message: 'Your admin account was created successfully', data: data})
            })
            .catch(err => {
                res.status(400).send({success: false, data: err})
            })
    },
}