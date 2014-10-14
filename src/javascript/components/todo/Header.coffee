React = require('react')
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{h1,header, p,div} = DOM

Actions = require '../../actions'
TextInput = require './TextInput'

style = css
  paddingTop: '15px'
  borderRadius: 'inherit'

Header = React.createClass
  displayName: 'Header'
  _onSave: (text) ->
    Actions.add text if text.trim()

  render: ->
    header {style: style}, [
      h1 'todos'
      TextInput
        id: 'new-todo'
        placeholder: 'What needs to be done?'
        onSave: @_onSave
    ]


module.exports = Header




