
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
  getInitialState: -> {
    allTodos: TodoStore.getDefaultData()
    areAllComplete: TodoStore.areAllComplete()
  }
  mixins: [Reflux.connect(TodoStore, 'allTodos')]
  # mixins: [Reflux.listenTo(TodoStore, @onStatusChange)]

  onStatusChange: (data) ->
    @setState data

  render: ->
    console.log 'render todoapp'
    console.log @state.areAllComplete

    div [
      Header {}
      MainSection {allTodos: @state.allTodos, areAllComplete: @state.areAllComplete}
      Footer {allTodos: @state.allTodos}
      # input {type: 'button', onClick: Action.foo}, 'click'
    ]


module.exports = TodoApp




