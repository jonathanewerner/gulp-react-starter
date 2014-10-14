React = require('react')
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{p,div, li, input, label, button} = DOM
Actions = require '../../actions'
  # 'toggle', 'toggleAll', 'add', 'remove', 'clearCompleted', 'edit'
TextInput = require './TextInput'

cx = require 'react/lib/cx'

TodoItem = React.createClass
  displayName: 'TodoItem'
  propTypes:
    todo: React.PropTypes.object.isRequired

  getInitialState: ->
    isEditing: false

  _onToggleComplete: ->
    Actions.toggle @props.todo

  _onDoubleClick: ->
    @setState isEditing: true

  _onSave: (text) ->
    Actions.edit @props.todo.key, text
    @setState isEditing: false

  _onDestroyClick: ->
    Actions.remove @props.todo

  render: ->
    todo = @props.todo

    if @state.isEditing
      textInput =
        TextInput {className: 'edit', onSave: @_onSave, value: @props.todo.label}

    foo = cx('completed': todo.isComplete, 'editing': @state.isEditing)
    li {className: foo}, [
      div {className: 'view'}, [
        input
          className: 'toggle'
          type: 'checkbox'
          checked: todo.isComplete
          onChange: @_onToggleComplete
        label onDoubleClick: @_onDoubleClick, todo.label
        button className: 'destroy', onClick: @_onDestroyClick
      ]
      textInput
    ]

module.exports = TodoItem















