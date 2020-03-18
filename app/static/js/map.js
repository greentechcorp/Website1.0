    function initMap() {

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: {lat: 48.30, lng: 10.27}
    });

    // Create an array of alphabetical characters used to label the markers.
    var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    // Add some markers to the map.
    // Note: The code uses the JavaScript Array.prototype.map() method to
    // create an array of markers based on a given "locations" array.
    // The map() method here has nothing to do with the Google Maps API.
    var markers = locations.map(function(location, i) {
      return new google.maps.Marker({
        position: location,
        label: labels[i % labels.length]
      });
    });

    // Add a marker clusterer to manage the markers.
    var markerCluster = new MarkerClusterer(map, markers,
        {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
  }
  var locations = [
    {lat: 55.951421, lng: -3.361956},
    {lat: 55.944586, lng: -3.187243},
    {lat: 55.956312, lng: -3.193510},
    {lat: 52.509858, lng: 13.403069},
    {lat: 52.393288, lng: 13.060251},
    {lat: 50.037464, lng: 8.562377},
    {lat: 52.554059, lng: 13.292831},
    {lat: 51.875867, lng: -0.371726},
    {lat: 51.469695, lng: -0.454424,},
    {lat: 40.497101, lng: -3.568757},
    {lat: 41.287974, lng: 2.072268},
    {lat: 49.009444, lng: 2.547764,},
    {lat: 48.837633, lng: 2.299502},
    {lat: 52.181210, lng: 20.961758}
  ]