
# this is a controller view

React = require 'react'
DOM = require '../../utils/short-elements'
{css} = require '../../utils/helpers'
{p,div} = DOM

TodoStore = require '../../stores/TodoStore'

Footer = require './Footer'
Header = require './Header'
MainSection = require './MainSection'

getTodoState = ->
  allTodos: TodoStore.getAll()
  areAllComplete: TodoStore.areAllComplete()

console.log(getTodoState().allTodos)

TodoApp = React.createClass
  getInitialState: -> getTodoState()
  componentDidMount: -> TodoStore.addChangeListener(@_onChange)
  componentWillUnmount: -> TodoStore.removeListener(@_onChange)
  _onChange: -> @setState(getTodoState()) 
  render: ->
    div [
      Header {}
      MainSection {allTodos: @state.allTodos, areAllComplete: @state.areAllComplete}
      Footer {allTodos: @state.allTodos}
    ]

module.exports = TodoApp




