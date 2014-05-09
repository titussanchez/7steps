initialize = ->
  map_opts =
    center: new google.maps.LatLng(42.314915, -85.667602)
    zoom: 13
  map = new google.maps.Map(document.getElementById("map-canvas"), map_opts)
  marker = new google.maps.Marker
    position: new google.maps.LatLng(42.314915, -85.667602)
    map: map
    title: "Jordan's Group"
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
      map.setCenter(pos)

google.maps.event.addDomListener(window, 'load', initialize)
