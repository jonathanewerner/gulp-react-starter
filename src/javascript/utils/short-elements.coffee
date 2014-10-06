React = require('react')
typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'

build_tag = (tag) ->
  (options...) ->
    options.unshift {} unless typeof options[0] is 'object' and
                              not typeIsArray options[0]
    React.DOM[tag].apply @, options

DOM = (->
  object = {}
  for element in Object.keys(React.DOM)
    object[element] = build_tag element
  object
)()

module.exports = DOM
