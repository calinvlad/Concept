const checkAuth = require('./middleware/checkAuthentication')
const view = require('./middleware/views')

const AdminCtrl = require('./controller/AdminCtrl')
const AuthCtrl = require('./controller/AuthCtrl')
const ProductCtrl = require('./controller/ProductsCtrl')
const OrdersCtrl = require('./controller/OrdersCtrl')
const ImageCtrl = require('./controller/ImageCtrl')
const SpecsCtrl = require('./controller/SpecsCtrl')
const DetailCtrl = require('./controller/DetailCtrl')
const Quantity = require('./controller/QuantityCtrl')
const uploadImageService = require('./services/uploadImageService')


module.exports = (app) => {

    /**
     * Admin Routes:
     * Register
     * Login
     */

    app.post('/auth/admin/register', AdminCtrl.register)
    app.post('/auth/admin/login', AdminCtrl.login)

    /**
     * Authentication Routes:
     * Register
     * Login
     * Forgot
     * Reset
     */
    //ToDo: Forgot && Reset Password
    app.post('/auth/register', AuthCtrl.register)
    app.post('/auth/login', AuthCtrl.login)

    /**
     * Products Routes:
     * Create
     * Read
     * Update
     * Delete
     */

    app.post('/products/create', ProductCtrl.create, Quantity.create)
    app.get('/products/list', ProductCtrl.list)
    app.get('/products/:productId', view.createViewProduct, view.listViewsProduct, ProductCtrl.listById)
    app.put('/products/update/:productId', ProductCtrl.update)
    app.delete('/products/delete/:productId', ProductCtrl.delete)

    /**
     * Images Routes
     * Create
     * Delete
     */
    app.post('/products/images', uploadImageService.upload.array('image' , 5), ImageCtrl.create)
    app.delete('/products/images', ImageCtrl.delete)

    /**
     * Specs Routes
     * Create
     * Update
     * Delete
     */

    app.post('/products/specs', uploadImageService.upload.none(), SpecsCtrl.create)

    /**
     * Details Routes
     * Create
     * Update
     * Delete
     */

    app.post('/products/details', uploadImageService.upload.none(), DetailCtrl.create)
    app.delete('/products/details', DetailCtrl.delete)

    /**
     * Quantity Routes
     * Create
     * Update
     */

    app.post('/products/quantity', Quantity.create)
    app.put('/products/quantity', Quantity.update)

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
