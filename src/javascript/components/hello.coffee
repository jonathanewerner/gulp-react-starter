React = require('react')
DOM = require('../utils/short-elements')
{css} = require('../utils/helpers')
{h1,div} = DOM

style = css
  color: 'blue'
  padding: '100px'

module.exports = React.createClass
  render: ->
    div [
      h1 style: style, 'hello ' + @props.name
    ]

