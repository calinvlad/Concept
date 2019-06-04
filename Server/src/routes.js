const checkAuth = require('./middleware/checkAuthentication')
const AuthCtrl = require('./controller/AuthCtrl')
const ProductCtrl = require('./controller/ProductsCtrl')
const OrdersCtrl = require('./controller/OrdersCtrl')
const ImageCtrl = require('./controller/ImageCtrl')

const multer = require('multer')
const path = require('path')
const storage = multer.diskStorage({
    destination: function(req, file, callback) {
        callback(null, './uploads');
    },

    filename: function(req, file, callback) {
        var fname = file.fieldname + '-' + Date.now() + path.extname(file.originalname);

        callback(null, fname);

    }
});
const upload = multer({
    storage: storage
})


module.exports = (app) => {

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

    app.post('/products/create', ProductCtrl.create)
    app.get('/products/list', ProductCtrl.list)
    app.get('/products/:productId', ProductCtrl.listById)
    app.put('/products/update/:productId', ProductCtrl.update)
    app.delete('/products/delete/:productId', ProductCtrl.delete)

    /**
     * Images Routes
     */
    app.post('/products/images', upload.single('file'), ImageCtrl.create)
    app.delete('/products/images', ImageCtrl.delete)

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
