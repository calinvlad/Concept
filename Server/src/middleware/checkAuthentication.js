const passport = require('passport')

module.exports = function (req, res, next) {
    passport.authenticate('jwt', function (err, user) {
        if (err || !user) {
            res.status(403).send({
                success: false,
                message: 'You do not have access'
            })
        } else {
            req.user = user
            next()
        }
    })(req, res, next)
}
