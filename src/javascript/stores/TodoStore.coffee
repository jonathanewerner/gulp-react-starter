
TodoDispatcher = require '../dispatchers/TodoDispatcher'
EventEmitter = require('events').EventEmitter
TodoConstants = require '../constants/TodoConstants'
merge = require 'react/lib/merge'

CHANGE_EVENT = 'change'

_todos = {}

# Create a todo item
create = (text) ->
  id = Date.now()
  _todos[id] =
    id: id
    complete: false
    text: text

# Update a todo item
update = (id, updates) ->
  _todos[id] = merge(_todos[id], updates)

# Update all todos with the same object (used to mark all todos as completed
updateAll = (updates) ->
  for id of _todos
    update(id, updates)

destroy = (id) ->
  delete _todos[id]

destroyCompleted = ->
  for id of _todos
    destroy(id) if _todos[id].complete

TodoStore = merge(EventEmitter.prototype,
  areAllComplete: ->
    for id of _todos
      return false if not _todos[id].complete
    true

  getAll: -> _todos

  foo: -> console.log 'foo'
  emitChange: -> @emit(CHANGE_EVENT)
  addChangeListener: (cb) -> @on(CHANGE_EVENT, cb)
  removeChangeListener: (cb) -> @removeListener(CHANGE_EVENT, cb)
)
# register todo dispatcher to handle all updates
TodoDispatcher.register((payload) ->
  action = payload.action

  switch action.actionType
    when TodoConstants.TODO_CREATE
      text = action.text.trim()
      create(text) if text isnt ""

    when TodoConstants.TODO_TOGGLE_COMPLETE_ALL
      if TodoStore.areAllComplete
        updateAll complete: false
      else
        updateAll complete: true

    when TodoConstants.TODO_UNDO_COMPLETE
      update(action.id, complete: false)

    when TodoConstants.TODO_COMPLETE
      update(action.id, complete: true)

    when TodoConstants.TODO_UPDATE_TEXT
      text = action.text.trim()
      console.log text
      update(action.id, {text: text}) if text isnt ''

    when TodoConstants.TODO_DESTROY
      destroy(action.id)

    when TodoConstants.TODO_DESTROY_COMPLETED
      destroyCompleted()

    else
      true

  TodoStore.emitChange()

  # needed by promise in Dispatcher
  true
)
module.exports = TodoStore





