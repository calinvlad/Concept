module.exports = {
    success(res, send) {
        res.status(200).send({success: true, message: send.message, data: send.data})
    },
    success200(res, data) {
        res.status(200).send({success: true, message: 'OK', data: data})
    },
    error(res, send) {
        res.status(send.status).send({success: false, message: send.message, data: send.data})
    },
    error404(res, err) {
        res.status(404).send({success: false, message: 'Not Found', data: err})
    },
    error500(res, err) {
        res.status(500).send({success: false, message: 'Internal Server Error', data: err})
    }
}