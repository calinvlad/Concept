const db = require('../../../db/models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('../../../config')

function jwtSignAdmin (admin) {
    return jwt.sign(admin, config.authentication.jwtSecret, {
        expiresIn: config.authentication.expiresIn
    })
}

module.exports = {
    async login(req, res) {
        let admin;
        await db.Admin.findOne({
            where: {
                email: req.body.email
            }
        })
            .then((data) => {
                admin = data
                bcrypt.compare(req.body.pass, data.pass)
                    .then(async (data) => {
                        res.status(200).send({
                            success: true,
                            message: `Welcome ${admin.fname} ${admin.lname}`,
                            data: admin,
                            token: jwtSignAdmin(admin.toJSON())
                        })
                    })
                    .catch(err => {res.status(403).send({success: false, message: 'Oops, your email or password does not match'})})
            })
            .catch(err => res.status(500).send({success: false, message: 'Internal server error'}))
    }
}