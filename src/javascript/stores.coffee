Reflux = require 'reflux'
_ = require 'lodash'
actions = require './actions'

todoCounter = 0
localStorageKey = 'todos'

persistList = (list) ->
  localStorage.setItem localStorageKey, JSON.stringify(list)

loadList = ->
  loadedList = localStorage.getItem localStorageKey
  if not loadedList
    return [
      { key: todoCounter++, created: new Date(), isComplete: false, label: 'rule' } ]

  _.map JSON.parse(loadedList), (item) ->
    item.key = todoCounter++
    item

todoListStore = Reflux.createStore
  listenables: actions
  init: ->
    @list = loadList()
    #('toggle', 'toggleAll', 'add', 'remove', 'clearCompleted', 'edit')

  _itemForKey: (itemKey) ->
    _.find @list, (item) -> item.key == itemKey

  onEdit: (itemKey, newLabel) ->
    foundItem = @_itemForKey itemKey
    if not foundItem
      return
    foundItem.label = newLabel
    @trigger @list

  onAdd: (label) ->
    @list.push {
      key: todoCounter++
      created: new Date()
      isComplete: false
      label: label
    }
    @trigger @list

  onRemove: (item) ->
    console.log item
    console.log @list
    _.pull @list, item
    @trigger @list

  onToggle: (item) ->
    foundItem = @_itemForKey item.key
    if foundItem
      foundItem.isComplete = not foundItem.isComplete

    @trigger @list

  onToggleAll: ->
    @list = _.map @list, (item) ->
      item.isComplete = true
      item

    @trigger @list

  onClearCompleted: ->
    @list = _.filter @list, (item) -> not item.isComplete

  # onFoo: ->
  #   @trigger @list
  #   console.log 'foo store'

  getDefaultData: -> @list
  areAllComplete: ->
    result = _.all @list, (todo) -> todo.isComplete
    console.log 'from store'
    console.log @list
    console.log result
    result


todoListStore.listen (todoList) -> persistList todoList

module.exports = todoListStore




