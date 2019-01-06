var express = require('express');
var router = express.Router();

router.get('/imprint', function(req, res, next) {
    res.render('page/legal/imprint');
});

router.get('/privacy', function(req, res, next) {
    res.render('page/legal/privacy');
});

module.exports = router;
