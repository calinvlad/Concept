const express = require('express')
const bodyParser = require('body-parser')
const {sequelize} = require('./db/models')
const cors = require('cors')
const morgan = require('morgan')
const passport = require('passport')
const config = require('./config')

const app = express()
app.use(cors())
app.use(bodyParser.json())
app.use(morgan('combined'))

require('./src/services/passport')
require('./src/routes')(app)



sequelize.sync({force: false})
.then(() => {
    app.listen(config.PORT, () => {console.log(`Server started on port ${config.PORT}`)})
})