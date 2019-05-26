const db = require('../../db/models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const config = require('../../config')

function jwtSignUser (user) {
    return jwt.sign(user, config.authentication.jwtSecret, {
        expiresIn: config.authentication.expiresIn
    })
}

module.exports = {
    async register(req, res) {
        await db.Users.create({
            fname: req.body.fname,
            lname: req.body.lname,
            email: req.body.email,
            phone: req.body.phone,
            pass: req.body.pass
        })
            .then((data) => res.status(200).send({success: true, data: data}))
            .catch(err => {
                res.status(400).send({success: false, data: err})
            })
    },

    async login(req, res) {
        let user;
        await db.Users.findOne({
            where: {
                email: req.body.email
            }
        })
            .then((data) => {
                user = data
                bcrypt.compare(req.body.pass, data.pass)
                    .then((data) => {
                        if(data){
                            res.status(200).send({
                                success: true,
                                message: `Welcome ${user.fname}`,
                                data: user,
                                token: jwtSignUser(user.toJSON())
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