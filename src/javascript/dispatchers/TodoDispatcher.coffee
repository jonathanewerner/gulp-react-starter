# a singleton that operates as the central hub for application updates
Dispatcher = require 'flux/lib/Dispatcher'
copyProperties = require 'react/lib/copyProperties'

TodoDispatcher = copyProperties(new Dispatcher(),
  handleViewAction: (action) ->
    @dispatch(
      source: 'VIEW_ACTION'
      action: action
    )
)

module.exports = TodoDispatcher


