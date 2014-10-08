RCSS = require('rcss')
exports.css = RCSS.registerClass
exports.cascade= (A,B) -> RCSS.registerClass(RCSS.cascade(A.style, B.style))



