React = require('react')
RCSS = require('rcss')
DOM = require('./utils/short-elements')
{css, cascade} = require('./utils/helpers')
{div} = DOM

# Enable react chrome dev tools.
window.React = require('react')
window.keyMirror = require 'react/lib/keyMirror'

# Hello = require('./components/hello')
TodoApp = require('./components/todo/TodoApp')


RCSS.injectAll()

App = React.createClass
  render: -> div [
    TodoApp {}
    # Hello name: @props.name
  ]

React.renderComponent (App {}), document.body
