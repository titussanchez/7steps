initialize = ->
  map_opts =
    center: new google.maps.LatLng(42.314915, -85.667602)
    zoom: 10
  map = new google.maps.Map(document.getElementById("map-canvas"), map_opts)

  $.each groups, (idx, group) ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng(group.lat, group.long)
      map: map
      title: group.name

  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      user_location = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
      map.setCenter(user_location)

google.maps.event.addDomListener(window, 'load', initialize)


class GroupView extends Backbone.View
  tagName: 'li'
  className: 'group-details'
  render: ->
    template = _.template("<h2><%= name %></h2><phone><%= phone %></phone><email><%= email %></email>")
    @$el.html(template(@model))

$(document).ready ->
  window.gv = new GroupView( model: groups[0] )
