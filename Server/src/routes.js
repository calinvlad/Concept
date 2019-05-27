const AuthCtrl = require('./controller/AuthCtrl')
const checkAuth = require('./middleware/checkAuthentication')
const passport = require('passport')

const ProductCtrl = require('./controller/ProductsCtrl')

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
     * Products Routes:
     * Create
     * Read
     * Update
     * Delete
     */

    //ToDo: Check relation user has many products

    app.post('/products/create', ProductCtrl.create)
    app.get('/products/list', ProductCtrl.list)
    app.put('/products/edit/:productId', ProductCtrl.update)
    app.delete('/products/delete/:productId', ProductCtrl.delete)
}