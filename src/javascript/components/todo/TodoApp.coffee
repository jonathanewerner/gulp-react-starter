
# this is a controller view

React = require 'react'
Reflux = require 'reflux'
DOM = require '../../utils/short-elements'
{css} = require '../../utils/helpers'
{p,div,input} = DOM
{log} = require '../../utils/helpers'

TodoStore = require '../../stores'
Action = require '../../actions'

Footer = require './Footer'
Header = require './Header'
MainSection = require './MainSection'

TodoApp = React.createClass
  displayName: 'TodoApp'

  getInitialState: ->
    todos: TodoStore.getDefaultData()

  mixins: [Reflux.connect(TodoStore, 'todos')]

  render: ->
    div [
      Header {}
      MainSection {allTodos: @state.todos, areAllComplete: TodoStore.areAllComplete()}
      Footer {allTodos: @state.todos}
    ]


module.exports = TodoApp




