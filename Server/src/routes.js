const AuthCtrl = require('./controller/AuthCtrl')
const checkAuth = require('./middleware/checkAuthentication')
const passport = require('passport')

module.exports = (app) => {

    /**
     * Authentication Routes:
     * Register
     * Login
     * Forgot
     * Reset
     */

    app.post('/auth/register', AuthCtrl.register)

    app.post('/auth/login', AuthCtrl.login)

    /**
     * Passport test isLoggedIn
     */

    app.get('/test', passport.authenticate('jwt', {session:false}), (req, res) => {
        res.status(200).send({success: true, message: 'Hello Stranger'})
    })

}