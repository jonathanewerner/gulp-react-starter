React = require('react')
DOM = require('../utils/short-elements')
{h1,div} = DOM

module.exports = React.createClass
  render: ->
    div [
      h1 "hello " + @props.name
    ]

