const express = require('express')
const bodyParser = require('body-parser')
const {sequelize} = require('./db/models')
const cors = require('cors')
const config = require('./config')

const app = express()
app.use(bodyParser.json())
app.use(cors())


require('./src/routes')(app)



sequelize.sync({force: false})
.then(() => {
    app.listen(config.PORT, () => {console.log(`Server started on port ${config.PORT}`)})
})