<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuBxvCl1OmWm8LBjlCLtR9Puj-TvZqaCA&callback=initMap&libraries=places,geometry"></script>
<script>
    var map;
    var infowindow = new google.maps.InfoWindow();
    var chooseMarker = new google.maps.Marker();
    var myCenter = {
        lat: 16.075240,
        lng: 108.224140
    };

    function initMap() {
        var charityMap = document.getElementById('charityMap');
        charityMap.style.display = 'block';
        map = new google.maps.Map(charityMap, {
            zoom: 12,
            center: myCenter,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        var yourLocation = document.getElementById("yourLocation");
        yourLocation.style.display = 'block';
        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(yourLocation);
        //----------------------------------
    }

    //-------------------------------------------------------------------
    function currentLocation(){
        //Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                myCenter = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var marker = new google.maps.Marker({
                    position: myCenter,
                    icon: '/template/web/img/icons/current.png'
                });
                infowindow.setContent('Your location');
                marker.setMap(map);
                infowindow.open(map, marker);
                map.setCenter(myCenter);
            });
        } else {
            // Browser doesn't support Geolocation
            alert('Please allow location access');
        }
    }
    //-------------------------------------------------------------------
    function chooseLocation(){
        if(map==null){
            initMap();
        }
        //clear chooseMarker
        chooseMarker.setMap(null);
        // Configure the click listener.
        map.setOptions({draggableCursor:'crosshair'});
        var chooseListerner = map.addListener('click', function(mapsMouseEvent) {
            var pos = {
                lat: mapsMouseEvent.latLng.lat(),
                lng: mapsMouseEvent.latLng.lng()
            }
            // Create a marker
            chooseMarker = new google.maps.Marker({
                map,
                position: pos
            });
            infowindow.setContent('Here');
            infowindow.open(map,chooseMarker);
            //get geo-place
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                'latLng': pos
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    const detailInfo = {
                        placeId: results[0].place_id
                    };
                    if (results[0]) {
                        document.getElementById("charity-address").value = results[0].formatted_address;
                        document.getElementById('charityLat').value = pos.lat;
                        document.getElementById('charityLng').value = pos.lng;
                    } else{
                        swal({
                            title: 'Cannot identify this place!',
                            text: 'Please re-input address or choose on the map.',
                            type: 'warning'
                        })
                    }
                }
            });
            //reset to default cursor
            map.setOptions({draggableCursor:''});
            //remove choose listener
            google.maps.event.removeListener(chooseListerner);
        });
    }
    //-------------------------------------------------------------------
    function enterLocation(){
        // Create the search box and link it to the UI element.
        var input = document.getElementById("charity-address");
        var searchBox = new google.maps.places.SearchBox(input);
        // Listen for the event fired when the user selects a prediction and retrieve more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();
            if (places.length == 0) {
                swal({
                    title: 'Cannot identify this place!',
                    text: 'Please re-input address or choose on the map.',
                    type: 'warning'
                })
                return;
            }
            if(map==null){
                initMap();
            }
            // For each place, get the icon, name and location.
            places.forEach(place => {
                //clear chooseMarker
                chooseMarker.setMap(null);
                if (!place.geometry) {
                    swal({
                        title: 'Cannot identify this place!',
                        text: 'Please re-input address or choose on the map.',
                        type: 'warning'
                    })
                    return;
                }
                var pos = {
                    lat: place.geometry.location.lat(),
                    lng: place.geometry.location.lng()
                }
                document.getElementById('charityLat').value = pos.lat;
                document.getElementById('charityLng').value = pos.lng;
                // Create a marker for place.
                chooseMarker = new google.maps.Marker({
                    map,
                    position: pos
                });
                infowindow.setContent('Here');
                infowindow.open(map,chooseMarker);
            });
        });
    }

    //-------------------------------------------------------------------
</script>
