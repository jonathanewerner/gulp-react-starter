React = require('react')
DOM = require('../../utils/short-elements')
{css} = require('../../utils/helpers')
{strong, button, footer, span, p,div} = DOM

React = require 'react'
ReactPropTypes = React.PropTypes
Actions = require '../../actions'

Footer = React.createClass(
  displayName: 'Footer'
  propTypes:
    allTodos: ReactPropTypes.array.isRequired

  render: ->
    allTodos = @props.allTodos
    total = Object.keys(allTodos).length

    return null if total is 0

    completed = 0
    for key of allTodos
      completed++ if allTodos[key].complete

    itemsLeft = total - completed
    itemsLeftPhrase = if itemsLeft is 1 then ' item ' else ' items '
    itemsLeftPhrase += 'left'

    # Undefined and thus not rendered if no completed items are left.
    if completed
      clearCompletedButton =
        button { id: "clear-completed", onClick: Actions.destroyCompleted()},
          'Clear completed ' + completed

    return (
      footer { id: 'footer' }, [
        span { id: 'todo-count' }, [strong itemsLeft, itemsLeftPhrase]
        clearCompletedButton
      ]
    )
)

module.exports = Footer
