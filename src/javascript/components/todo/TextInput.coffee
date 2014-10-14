React = require('react')
DOM = require('../../utils/short-elements')
{css, cascade} = require('../../utils/helpers')
{input} = DOM
RCSS = require 'rcss'

ENTER_KEY_CODE = 13

newTodo = css
	padding: '16px 16px 16px 60px'
	border: 'none'
	background: 'rgba(0, 0, 0, 0.02)'
	zIndex: '2'
	boxShadow: 'none'

B = css
  fontSize: '24px'

# edit = cascade A, B
# edit = RCSS.registerClass(RCSS.cascade( A.style, {
#   fontSize: '24px'
# }))
styles =
  newTodo: newTodo

TextInput = React.createClass(
  displayName: 'TextInput'
  propTypes:
    className: React.PropTypes.string
    placeholder: React.PropTypes.string
    onSave: React.PropTypes.func.isRequired
    value: React.PropTypes.string

  getInitialState: ->
    value: @props.value or ''

  _save: ->
    @props.onSave(@state.value)
    @setState(value: '')

  _onChange: (e) ->
    @setState(value: e.target.value)

  _onKeyDown: (e) ->
    @_save() if e.keyCode is ENTER_KEY_CODE

  render: ->
    return (
      input {
        className: @props.className
        id: @props.id
        placeholder: @props.placeholder
        onBlur: @_save
        onChange: @_onChange
        onKeyDown: @_onKeyDown
        value: @state.value
        autoFocus: true
      }
    )
)

module.exports = TextInput





