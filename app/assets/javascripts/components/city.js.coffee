 @City = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.city.name
        React.DOM.td null,citiesURL
        React.DOM.td null, @props.city.data('url')