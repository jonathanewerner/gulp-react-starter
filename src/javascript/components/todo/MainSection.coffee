React = require('react')
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{ul, section, input, label,p,div} = DOM

TodoActions = require '../../actions/TodoActions'
TodoItem = require './TodoItem'

MainSection = React.createClass
  propTypes:
    allTodos: React.PropTypes.object.isRequired
    areAllComplete: React.PropTypes.bool.isRequired

  _onToggleCompleteAll: ->
    TodoActions.toggleCompleteAll()

  render: ->
  # this section should be hidden if there are no todos
    return null if Object.keys(@props.allTodos).length < 1

    allTodos = @props.allTodos
    todos = []

    for key of allTodos
      todos.push(TodoItem {key: key, todo: allTodos[key]})

    section {id: 'main'}, [
      input {id: 'toggle-all', type: 'checkbox', \
             onChange: @_onToggleCompleteAll, \
             checked: if @props.areAllComplete then 'checked' else ''}
      label {htmlFor: 'toggle-all'}, 'Mark all as complete'
      ul {id: 'todo-list'}, todos
    ]

module.exports = MainSection




