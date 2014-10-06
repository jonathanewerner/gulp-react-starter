React = require('react')
DOM = require('./utils/short-elements')
{div} = DOM

Hello = require('./components/hello')

App = React.createClass
  render: -> div [
    Hello name: @props.name
    Hello name: @props.name
  ]

React.renderComponent (App name: "jona"), document.body
