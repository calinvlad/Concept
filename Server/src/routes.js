const checkAuth = require('./middleware/checkAuthentication')
const view = require('./middleware/views')

// Admin
const AdminCtrlRegister = require('./controller/admin/register')
const AdminCtrlLogin = require('./controller/admin/login')

// User
const AuthCtrlRegister = require('./controller/user/register')
const AuthCtrlLogin = require('./controller/user/login')

// Product
const ProductCtrlRead = require('./controller/product/read')
const ProductCtrlCreate = require('./controller/product/create')
const ProductCtrlUpdate = require('./controller/product/update')
const ProductCtrlDelete = require('./controller/product/delete')

// Category
const CategoryCtrlCreate = require('./controller/category/create')
const CategoryCtrlRead = require('./controller/category/read')
const CategoryCtrlUpdate = require('./controller/category/update')
const CategoryCtrlDelete = require('./controller/category/delete')

// Subcategory
const SubcategoryCtrlCreate = require('./controller/subcategory/create')
const SubcategoryCtrlRead = require('./controller/subcategory/read')
const SubcategoryCtrlUpdate = require('./controller/subcategory/update')
const SubcategoryCtrlDelete = require('./controller/subcategory/delete')

// Quantity
const QuantityCtrlCreate = require('./controller/quantity/create')
const QuantityCtrlUpdate = require('./controller/quantity/update')

// Image
const ImageCtrlCreate = require('./controller/image/create')
const ImageCtrlDelete = require('./controller/image/delete')

// Detail
const DetailCtrlCreate = require('./controller/detail/create')
const DetailCtrlUpdate = require('./controller/detail/update')

// Order
const OrdersCtrlCreate = require('./controller/order/create')
const OrdersCtrlRead = require('./controller/order/read')
const OrdersCtrlUpdate = require('./controller/order/update')
const OrdersCtrlDelete = require('./controller/order/delete')


const uploadImageService = require('./services/uploadImageService')


module.exports = (app) => {

    // Admin
    app.post('/auth/admin/register', AdminCtrlRegister.register)
    app.post('/auth/admin/login', AdminCtrlLogin.login)

    // User
    // ToDo: Forgot && Reset Password
    app.post('/auth/register', AuthCtrlRegister.register)
    app.post('/auth/login', AuthCtrlLogin.login)

    // Product
    app.post('/products/create', ProductCtrlCreate.create, QuantityCtrlCreate.create, DetailCtrlCreate.create)
    app.get('/products/list', ProductCtrlRead.list)
    app.get('/products/:productId', view.createViewProduct, view.listViewsProduct, ProductCtrlRead.listById)
    app.put('/products/update/:productId', ProductCtrlUpdate.update)
    app.delete('/products/delete/:productId', ProductCtrlDelete.imagesFromFileSystem, ProductCtrlDelete.delete)

    // Category
    app.post('/category', CategoryCtrlCreate.index)
    app.get('/category', CategoryCtrlRead.index)
    app.put('/category', CategoryCtrlUpdate.index)
    app.delete('/category', CategoryCtrlDelete.index)

    //Subcategory
    app.post('/subcategory', SubcategoryCtrlCreate.index)
    app.get('/subcategory', SubcategoryCtrlRead.index)
    app.put('/subcategory', SubcategoryCtrlUpdate.index)
    app.delete('/subcategory', SubcategoryCtrlDelete.index)

    // Quantity
    app.post('/products/quantity', QuantityCtrlCreate.create)
    app.put('/products/quantity', QuantityCtrlUpdate.update)

    // Image
    app.post('/products/images', uploadImageService.upload.array('image' , 5), ImageCtrlCreate.create)
    app.delete('/products/images', ImageCtrlDelete.delete)

    // Detail
    app.put('/products/details/:detailId', DetailCtrlUpdate.update)

    // Order
    app.post('/orders/create', OrdersCtrlCreate.create)
    app.get('/orders/list', OrdersCtrlRead.list)
    app.put('/orders/update/:orderId', OrdersCtrlUpdate.update)
    app.delete('/orders/delete/:orderId', OrdersCtrlDelete.delete)
}
