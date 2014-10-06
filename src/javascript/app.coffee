React = require('react')
{div} = React.DOM

Hello = React.createClass
    render: ->
        (div {}, ['Hello ' + @props.name])

React.renderComponent (Hello {name: 'jona'}), document.body
