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
        let errAddress, address
        let err, user
        const {address1, address2, city} = req.body
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
    },

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