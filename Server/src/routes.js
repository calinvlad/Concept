const checkAuth = require('./middleware/checkAuthentication')
const AuthCtrl = require('./controller/AuthCtrl')
const ProductCtrl = require('./controller/ProductsCtrl')
const OrdersCtrl = require('./controller/OrdersCtrl')

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
    app.put('/products/update/:productId', ProductCtrl.update)
    app.delete('/products/delete/:productId', ProductCtrl.delete)

    /**
     * Orders Routes:
     * Create
     * Read
     * Update
     * Delete
     */

    app.post('/orders/create', OrdersCtrl.create)
    app.get('/orders/list', OrdersCtrl.list)
    app.put('/orders/update/:orderId', OrdersCtrl.update)
    app.delete('/orders/delete/:orderId', OrdersCtrl.delete)
}
