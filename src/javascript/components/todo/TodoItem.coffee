React = require('react')
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{p,div, li, input, label, button} = DOM
TodoActions = require '../../actions/TodoActions'
TextInput = require './TextInput'

cx = require 'react/lib/cx'

TodoItem = React.createClass
  propTypes:
    todo: React.PropTypes.object.isRequired

  getInitialState: ->
    isEditing: false

  _onToggleComplete: ->
    TodoActions.toggleComplete(@props.todo)

  _onDoubleClick: ->
    @setState isEditing: true

  _onSave: (text) ->
    TodoActions.updateText(@props.todo.id, text)
    @setState isEditing: false

  _onDestroyClick: ->
    TodoActions.destroy(@props.todo.id)

  render: ->
    todo = @props.todo
    if @state.isEditing
      textInput = TextInput {className: 'edit', onSave: @_onSave, value: @props.todo.text}

    foo = cx('completed': todo.complete, 'editing': @state.isEditing)
    li {className: foo, key: todo.id}, [
      div {className: 'view'}, [
        input
          className: 'toggle'
          type: 'checkbox'
          checked: todo.complete
          onChange: @_onToggleComplete
        label onDoubleClick: @_onDoubleClick, todo.text
        button className: 'destroy', onClick: @_onDestroyClick
      ]
      textInput
    ]

module.exports = TodoItem















