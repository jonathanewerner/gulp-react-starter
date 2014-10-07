React = require('react')
RCSS = require('rcss')
DOM = require('./utils/short-elements')
{div} = DOM

# Enable react chrome dev tools.
window.React = require('react')
window.keyMirror = require 'react/lib/keyMirror'

Hello = require('./components/hello')

RCSS.injectAll()
App = React.createClass
  render: -> div [
    Hello name: @props.name
    Hello name: @props.name
  ]

React.renderComponent (App name: "jona"), document.body
