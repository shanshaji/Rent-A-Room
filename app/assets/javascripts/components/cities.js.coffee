@Cities = React.createClass
	getInitialState: ->
      cities: @props.data
    getDefaultProps: ->
      cities: []
    render: ->
      React.DOM.div
        className: 'cities'
        React.DOM.h2
          className: 'name'
          'Cities'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Name'
              React.DOM.th null, ''
              React.DOM.th null, ''
          React.DOM.tbody null,
            for city in @state.cities
              React.createElement City, key: city.id, city: city
