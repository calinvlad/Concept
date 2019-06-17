const db = require('../../../db/models')

module.exports = {
    async register(req, res) {
        await db.User.create({
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            phone: req.body.phone,
            pass: req.body.pass
        })
            .then(async (data) => {
                await db.Address.create({
                    userId: data.userId,
                    address1: req.body.address1,
                    address2: req.body.address2,
                    city: req.body.city
                })
                    .then((data) => {
                        res.status(200).send({success: true, message: 'Your account was created successfully', data: data})
                    })
                    .catch(async err => {
                        await db.Users.destroy({
                            where: {
                                userId: data.userId
                            }
                        }).then(() => {
                            res.status(400).send({success: false, message: 'Address could not be created', data: err})
                        })

                    })
            })
            .catch(err => {
                res.status(400).send({success: false, data: err})
            })
    }
}
