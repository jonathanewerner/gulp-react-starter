RCSS = require('rcss')
exports.css = RCSS.registerClass
exports.cascade= (A,B) -> RCSS.registerClass(RCSS.cascade(A.style, B.style))

util = require 'util'
module.exports.log = (obj) -> console.log(util.inspect(obj, false, null))


