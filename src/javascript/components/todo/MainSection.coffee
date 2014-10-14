React = require('react')
_ = require 'lodash'
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{ul, section, input, label,p,div, button} = DOM

Actions = require '../../actions'
TodoItem = require './TodoItem'

MainSection = React.createClass
  displayName: 'MainSection'
  propTypes:
    allTodos: React.PropTypes.array.isRequired
    areAllComplete: React.PropTypes.bool.isRequired

  render: ->
  # this section should be hidden if there are no todos
    return null if Object.keys(@props.allTodos).length < 1

    allTodos = @props.allTodos

    todos = _.map allTodos, (todo) ->
      TodoItem {key: todo.key, todo: todo}

    section {id: 'main'}, [
      input {id: 'toggle-all', type: 'checkbox', \
             onChange: Actions.toggleAll, \
             checked: if @props.areAllComplete then 'checked' else ''}
      label {htmlFor: 'toggle-all'}, 'Mark all as complete'
      ul {id: 'todo-list'}, todos
    ]

module.exports = MainSection




