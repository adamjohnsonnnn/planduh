function myMap(octopus) {
  console.log(octopus);
  // var event_location = {lat: 41.9298671, lng: -87.655268};
  // var restaurant_location = {lat: 41.881323483914, lng: -87.6245379144271};

  var mapProp= {
      center:new google.maps.LatLng(41.9298671,-87.655268),
      zoom:12,
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var locations = [
  ['EVENT', 41.9298671,-87.655268, 2],
  ['RESTAURANT', 41.881323483914,-87.6245379144271, 1]
];

//create empty LatLngBounds object
var bounds = new google.maps.LatLngBounds();
var infowindow = new google.maps.InfoWindow();

for (i = 0; i < locations.length; i++) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    map: map
  });

  //extend the bounds to include each marker's position
  bounds.extend(marker.position);

  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(locations[i][0]);
      infowindow.open(map, marker);
    }
  })(marker, i));
}

//now fit the map to the newly inclusive bounds
map.fitBounds(bounds);

//(optional) restore the zoom level after the map is done scaling
var listener = google.maps.event.addListener(map, "idle", function () {
    map.setZoom(12);
    google.maps.event.removeListener(listener);
});
}
