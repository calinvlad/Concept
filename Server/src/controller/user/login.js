const db = require('../../../db/models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('../../../config')

function jwtSignUser (user) {
    return jwt.sign(user, config.authentication.jwtSecret, {
        expiresIn: config.authentication.expiresIn
    })
}

module.exports = {
    async login(req, res) {
        let user;
        await db.User.findOne({
            where: {
                email: req.body.email
            }
        })
            .then((data) => {
                user = data
                bcrypt.compare(req.body.pass, data.pass)
                    .then(async (data) => {
                        if(data){

                            await db.Address.findOne({where: {userId: user.userId}})
                                .then(data => {
                                    res.status(200).send({
                                        success: true,
                                        message: `Welcome ${user.fname}`,
                                        data: user,
                                        address: data,
                                        token: jwtSignUser(user.toJSON())
                                    })
                                })
                        }
                        else {
                            res.status(403).send({success: false, message: 'Oops, your email or password does not match'})
                        }
                    })
                    .catch(err => {res.status(403).send({success: false, message: 'Oops, your email or password does not match'})})
            })
            .catch(err => res.status(500).send({success: false, message: 'Internal server error'}))
    }
}