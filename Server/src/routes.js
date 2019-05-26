const AuthCtrl = require('./controller/AuthCtrl')

module.exports = (app) => {

    /**
     * Authentication Routes:
     * Register
     * Login
     * Forgot
     * Reset
     */

    app.post('/auth/register', AuthCtrl.register)

    /**
     * Login user, set token,
     * Check hashed password
     * Return User
     */

    app.post('/auth/login', AuthCtrl.login)

}