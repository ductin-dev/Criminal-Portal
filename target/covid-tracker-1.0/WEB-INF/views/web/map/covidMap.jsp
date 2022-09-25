
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuBxvCl1OmWm8LBjlCLtR9Puj-TvZqaCA&callback=initMap&libraries=places,geometry"></script>
<script>
    //check if user enter advanced search first time -> show guide
    <c:set var="notShow" value="${notShow+1}" scope="session" />
    var map, places;
    var infowindow = new google.maps.InfoWindow();
    var markersArray = [];
    var placeMarkers = [];
    var myCenter = {
        lat: 16.075240,
        lng: 108.224140
    };
    function initMap() {
        var googleMap = document.getElementById('googleMap');
        googleMap.style.display = 'block';
        map = new google.maps.Map(googleMap, {
            zoom: 12,
            center: myCenter,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        var noteMap = document.getElementById('noteMap');
        noteMap.style.display = 'block';
        map.controls[google.maps.ControlPosition.RIGHT_TOP].push(noteMap);
        var varLocation = document.getElementById('yourLocation');
        varLocation.style.display = 'block';
        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(varLocation);
        //----------------------------------
        //yourLocation();
        eventEnter();
        searchBox();
        patients('all');
        blockAreas();
        charityPlaces();
        showGuide();
    }
    function showGuide(){
        var notShow = ${notShow};
        if(notShow<2){
            swal.mixin({
                confirmButtonText: 'Next &rarr;',
                showCancelButton: true,
                allowOutsidelick: false,
                progressSteps: ['1', '2', '3','4']
            }).queue([
                {
                    title: 'Show advanced search!',
                    width: 1200,
                    imageUrl: 'template/web/img/guide1.png',
                    imageWidth: 1142,
                    imageHeight: 458,
                    showCancelButton: false
                },
                {
                    title: 'Enter location!',
                    width: 900,
                    imageUrl: 'template/web/img/guide2.png',
                    imageWidth: 840,
                    imageHeight: 439,
                    showCancelButton: false
                },
                {
                    title: 'Choose location!',
                    width: 900,
                    imageUrl: 'template/web/img/guide3.png',
                    imageWidth: 809,
                    imageHeight: 427,
                    showCancelButton: false
                },
                {
                    title: 'Find charity places!',
                    width: 900,
                    imageUrl: 'template/web/img/guide4.png',
                    imageWidth: 812,
                    imageHeight: 438,
                    showCancelButton: false
                }
            ]).then( () => {
                swal.fire(
                    'All done!',
                    'Thank you',
                    'success'
                )
            })
            notShow++;

        }
    }
    //-------------------------------------------------------------------
    function searchBox(){
        // Create the search box and link it to the UI element.
        var searchBoxForm = document.getElementById("search-box-form");
        searchBoxForm.style.display = 'block';
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(searchBoxForm);
        var input = document.getElementById("search-box");
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.LEFT_TOP].push(document.getElementById("listing"));
        // // Listen for the event fired when the user selects a prediction and retrieve
        // // more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();
            if (places.length == 0) {
                swal.fire(
                    'Oops~',
                    'Please input valid address!',
                    'error'
                )
                return;
            }
            clearPlaceMarkers();
            clearPlaceResults();
            // For each place, get the icon, name and location.
            const bounds = new google.maps.LatLngBounds();
            places.forEach(place => {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    swal.fire(
                        'Oops~',
                        'Please input valid address!',
                        'error'
                    )
                    return;
                }
                const icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };
                // Create a marker for each place.
                var marker = new google.maps.Marker({
                    map,
                    icon,
                    title: place.name,
                    position: place.geometry.location
                })
                placeMarkers.push(marker);
                //Calculate min distance
                var minDistance = determineWarning(marker);
                //auto open infowindow
                infowindow.setContent(buildInfoWindow(place, minDistance));
                infowindow.open(map,marker);
                //add event for marker
                google.maps.event.addListener(marker, "click", () => {
                    infowindow.open(map,marker);
                });
                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });
    }
    //-------------------------------------------------------------------
    function clearPlaceMarkers(){
        // Clear out the old markers.
        placeMarkers.forEach(marker => {
            marker.setMap(null);
        });
        placeMarkers = [];
    }
    //-------------------------------------------------------------------
    function clearPlaceResults(){
        //Clear list result
        var results = document.getElementById('results');
        while (results.childNodes[0]) {
            results.removeChild(results.childNodes[0]);
        }
    }
    //-------------------------------------------------------------------
    function determineWarning(marker){
        var pPlaces = pString.split('<SPLIT_MARK> ');
        var min = 9999999;
        for(i=0; i<pPlaces.length; i++){
            var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(pPlaces[i], pPlaces[i+1]),
                new google.maps.LatLng(marker.getPosition().lat(),marker.getPosition().lng()));
            if(distance<min) {
                min = distance;
            }
        }
        var bPlaces = bString.split('<SPLIT_MARK> ');
        for(i=0; i<bPlaces.length; i++){
            var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(bPlaces[i], bPlaces[i+1]),
                new google.maps.LatLng(marker.getPosition().lat(),marker.getPosition().lng()));
            if(distance<min) {
                min = distance;
            }
        }
        return min;
    }
    //-------------------------------------------------------------------
    function sortedCharityList(pos){
        var places = cString.split('<SPLIT_MARK> ');
        var listCharity = [];
        for(i=0; i<places.length-1; i=i+5){
            var charityVar = {
                lat: places[i],
                lng: places[i+1],
                name: places[i+2],
                address: places[i+3],
                content: places[i+4],
                distance: google.maps.geometry.spherical.computeDistanceBetween(
                    new google.maps.LatLng(pos.lat,pos.lng), new google.maps.LatLng(places[i],places[i+1]))
            };
            listCharity.push(charityVar);
        }
        listCharity.sort((a,b) => (a.distance>b.distance)?1:-1 );
        return listCharity;
    }
    //-------------------------------------------------------------------
    function placeSearch(pos){
        if(pos=='yourLocation'){
            pos=myCenter;
        }
        clearPlaceMarkers();
        clearPlaceResults();
        var keyword = document.getElementById('search-box').value;
        if(keyword.includes('charity') || keyword.includes('tu thien') || keyword.includes('từ thiện')){
            nearbyCharity(pos);
            return;
        }
        const searchInfo = {
            location: pos,
            query: keyword
        };
        var service = new google.maps.places.PlacesService(map);
        service.textSearch(searchInfo, (results, status) => {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                for (let i = 0; i < results.length; i++) {
                    const detailInfo = {
                        placeId: results[i].place_id
                    };
                    service.getDetails(detailInfo, (place, status) => {
                        if (status === google.maps.places.PlacesServiceStatus.OK){
                            addResult(results[i],place,pos);
                        } else{
                            // swal.fire(
                            //     'Oops~',
                            //     'Can not find this place!',
                            // )
                        }
                    });
                }
                map.setCenter(results[0].geometry.location);
                openListResult();
            } else{
                swal.fire(
                    'Oops~',
                    'Please input valid keyword.',
                    'error'
                )
            }
        });

    }
    //find nearby charity places
    function nearbyCharity(pos){
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        var listCharity = sortedCharityList(pos);
        openListResult();
        for(i=0; i<listCharity.length; i++){
            var latLong = new google.maps.LatLng(listCharity[i].lat, listCharity[i].lng);
            cMarker = new google.maps.Marker({
                map,
                position: latLong,
                icon: 'template/web/img/icons/charity.png'
            });
            placeMarkers.push(cMarker);
            google.maps.event.addListener(cMarker, 'click', (function (marker,  name, address, content) {
                return function () {
                    infowindow.setContent(
                        '	<div id="info-content">																		                    ' +
                        '        <table>                                                                                                    ' +
                        '            <tr class="iw_table_row">                                                                              ' +
                        '                <td class="iw_table_icon"><img class="placeIcon" src="template/web/img/icons/charity.png"/></td>   ' +
                        '                <td style="color:green"><b>' + name + '</b></td>                                                     ' +
                        '            </tr>                                                                                                  ' +
                        '            <tr class="iw_table_row">                                                                              ' +
                        '                <td class="iw_attribute_name">Address:</td>                                                        ' +
                        '                <td>' + address + '</td>                                                                           ' +
                        '            </tr>                                                                                                  ' +
                        '            <tr class="iw_table_row">                                                                              ' +
                        '                <td class="iw_attribute_name">Content:</td>                                                        ' +
                        '                <td>' + content + '</td>                                                                           ' +
                        '            </tr>                                                                                                  ' +
                        '        </table>                                                                                                   ' +
                        '	</div>											                                                                '
                    );
                    infowindow.open(map, marker);
                };
            })(cMarker, listCharity[i].name, listCharity[i].address, listCharity[i].content));
            var div = document.createElement('div');
            div.onclick = function(cMarker) {
                return function(){
                    google.maps.event.trigger(cMarker, 'click');
                    map.setCenter(new google.maps.LatLng(cMarker.getPosition().lat(),cMarker.getPosition().lng()));
                }
            }(cMarker);
            //Display place name
            var nameTr = document.createElement('tr');
            nameTr.appendChild(document.createTextNode(listCharity[i].name));
            nameTr.setAttribute("class", "nameTr");
            nameTr.style.color = 'green';
            div.appendChild(nameTr);
            //Display  address
            var addressTr = document.createElement('tr');
            addressTr.appendChild(document.createTextNode(listCharity[i].address));
            div.appendChild(addressTr);
            //Display distance
            var distanceTr = document.createElement('tr');
            var distanceSpan = document.createElement('span');
            distanceSpan.setAttribute("class", "distanceSpan");
            distanceSpan.appendChild(document.createTextNode(parseInt(listCharity[i].distance)+'m'));
            distanceTr.appendChild(distanceSpan);
            div.appendChild(distanceTr);
            results.appendChild(div);
        }
        //Pan to nearest charity
        map.panTo(placeMarkers[0].getPosition());
        map.setZoom(12);
    }
    //-------------------------------------------------------------------
    function addResult(result, place, pos) {
        const icon = {
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(25, 25)
        };
        //Create marker
        const marker = new google.maps.Marker({
            map,
            icon,
            position: result.geometry.location
        });
        placeMarkers.push(marker);
        //Calculate min distance
        var minDistance = determineWarning(marker);
        //add event for marker
        google.maps.event.addListener(marker, "click", () => {
            infowindow.setContent(buildInfoWindow(place, minDistance));
            infowindow.open(map,marker);
        });
        var div = document.createElement('div');
        div.onclick = function() {
            google.maps.event.trigger(marker, 'click');
            map.setCenter(new google.maps.LatLng(marker.getPosition().lat(),marker.getPosition().lng()));
        };
        //Display warning
        var warningTr = document.createElement('tr');
        var warningIcon = document.createElement('i');
        if(minDistance<=30){
            warningIcon.setAttribute("class","zmdi zmdi-alert-polygon");
            warningIcon.appendChild(document.createTextNode(" Dangerous Area"));
        } else if(minDistance<=100){
            warningIcon.setAttribute("class","zmdi zmdi-alert-triangle");
            warningIcon.appendChild(document.createTextNode(" Warning Area"));
        } else{
            warningIcon.setAttribute("class","zmdi zmdi-shield-check");
            warningIcon.appendChild(document.createTextNode(" Safe Area"));
        }
        warningTr.appendChild(warningIcon);
        div.appendChild(warningTr);
        //Display place name
        var nameTr = document.createElement('tr');
        nameTr.appendChild(document.createTextNode(place.name));
        nameTr.setAttribute("class", "nameTr");
        div.appendChild(nameTr);
        var ratingTr = document.createElement('tr');
        //Display rating
        if(place.rating){
            //Display rating number
            var rating = document.createElement('span');
            rating.appendChild(document.createTextNode(place.rating+' '));
            ratingTr.appendChild(rating);
            //Display rating stars
            var star;
            for(i=0; i<5; i++){
                star = document.createElement('span');
                var ratingNumber = parseFloat(place.rating)-0.5;
                if(parseFloat(i)<ratingNumber){
                    star.setAttribute("class", "fa fa-star star-checked");
                } else{
                    star.setAttribute("class", "fa fa-star");
                }
                ratingTr.appendChild(star);
            }
            //Display rating turns
            var turn = document.createElement('span');
            turn.appendChild(document.createTextNode(' ('+place.user_ratings_total+')'));
            ratingTr.appendChild(turn);
            div.appendChild(ratingTr);
        }
        //Display short address
        var addressTr = document.createElement('tr');
        addressTr.appendChild(document.createTextNode(place.vicinity));
        div.appendChild(addressTr);
        //Display open/close
        var openTime = 'Closed';
        try{
            if(place.opening_hours.open_now){
                openTime = 'Openning';
            }
        } catch(err) {
            console.log('Can not load open time');
        }
        var openTr = document.createElement('tr');
        var openSpan = document.createElement('span');
        openSpan.appendChild(document.createTextNode(openTime));
        openTr.appendChild(openSpan);
        //Display distance
        console.log(pos.lat+'@@'+pos.lng);
        var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(pos.lat,pos.lng),
            new google.maps.LatLng(marker.getPosition().lat(),marker.getPosition().lng()));
        var distanceSpan = document.createElement('span');
        distanceSpan.setAttribute("class", "distanceSpan");
        distanceSpan.appendChild(document.createTextNode(parseInt(distance)+'m'));
        openTr.appendChild(distanceSpan);
        div.appendChild(openTr);
        results.appendChild(div);
    }

    // Load the place information into the HTML elements used by the info window.
    function buildInfoWindow(place, minDistance) {
        var warningIcon = 'zmdi zmdi-shield-check';
        var warningText = 'Safe Area'
        if(minDistance<=30){
            warningIcon = 'zmdi zmdi-alert-polygon';
            warningText = 'Dangerous Area';
        } else if(minDistance<=100){
            warningIcon = 'zmdi zmdi-alert-triangle';
            warningText = 'Warning Area';
        }
        var address;
        if(place.vicinity){
            address = place.vicinity;
        } else {
            address = place.formatted_address;
        }
        var phoneNumber = 'unknown';
        if(place.formatted_phone_number){
            phoneNumber = place.formatted_phone_number;
        }
        //Display rating
        var ratingHtml = '';
        if(place.rating){
            for(i=0; i<5; i++){
                var ratingNumber = parseFloat(place.rating)-0.5;
                if(parseFloat(i)<ratingNumber){
                    ratingHtml += '<span class="fa fa-star star-checked"></span>';
                } else{
                    ratingHtml += '<span class="fa fa-star"></span>';
                }
            }
        } else{
            ratingHtml='unknown'
        }
        var info =
            '	<div id="info-content">																		   '+
            '        <table>                                                                                   ' +
            '            <tr class="iw_table_row">                                                             ' +
            '                <td class="iw_attribute_icon"><i class="' + warningIcon + '"></i></td>            ' +
            '                <td>' + warningText + '</td>                                                      ' +
            '            </tr>                                                                                 ' +
            '            <tr class="iw_table_row">                                                             ' +
            '                <td class="iw_table_icon"><img class="placeIcon" src="' + place.icon + '"/></td>  ' +
            '                <td><b><a href="' + place.url + '">' + place.name + '</a></b></td>                ' +
            '            </tr>                                                                                 ' +
            '            <tr class="iw_table_row">                                                             ' +
            '                <td class="iw_attribute_name">Address:</td>                                       ' +
            '                <td>' + address + '</td>                                                          ' +
            '            </tr>                                                                                 ' +
            '            <tr class="iw_table_row">                                                             ' +
            '                <td class="iw_attribute_name">Telephone:</td>                                     ' +
            '                <td>' + phoneNumber + '</td>                                                      ' +
            '            </tr>                                                                                 ' +
            '            <tr class="iw_table_row">                                                             ' +
            '                <td class="iw_attribute_name">Rating:</td>                                        ' +
            '                <td>' + ratingHtml + '</td>                                                       ' +
            '            </tr>                                                                                 ' +
            '        </table>                                                                                  ' +
            '	</div>											                                               '
        return info;
    }

    //Set enter event for button Search
    function eventEnter(){
        var input = document.getElementById("search-box");
        input.addEventListener("keyup", function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("buttonSearch").click();
            }
        });
    }

    function hideListResult(){
        document.getElementById('listing').style.display = 'none';
        //clear chooseMarker
        chooseMarker.setMap(null);
        clearPlaceMarkers();
        clearPlaceResults();
        yourLocation();
    }

    function openListResult(){
        document.getElementById('listing').style.display = 'block';
    }
    //-------------------------------------------------------------------
    function yourLocation(){
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                myCenter = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var marker = new google.maps.Marker({
                    position: myCenter,
                    icon: 'template/web/img/icons/current.png'
                });
                infowindow.setContent('Your location');
                marker.setMap(map);
                infowindow.open(map, marker);
                map.setCenter(myCenter);
            });
        } else{
            swal.fire(
                'Location Error!',
                'Please enable location permission to continue.',
                 'error'
            )
        }
    }
    //-------------------------------------------------------------------
    var chooseMarker = new google.maps.Marker();
    function chooseLocation(){
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
            infowindow.setContent('Search here');
            infowindow.open(map,chooseMarker);
            placeSearch(pos);
            //reset to default cursor
            map.setOptions({draggableCursor:''});
            //remove choose listener
            google.maps.event.removeListener(chooseListerner);
        });
    }
    //-------------------------------------------------------------------
    function enterLocation(){
        // Create the search box and link it to the UI element.
        var input = document.getElementById("advanced-search-box");
        var searchBox = new google.maps.places.SearchBox(input);
        // // Listen for the event fired when the user selects a prediction and retrieve
        // // more details for that place.
        searchBox.addListener("places_changed", () => {
            const places = searchBox.getPlaces();
            if (places.length == 0) {
                swal.fire(
                    'Oops~',
                    'Please input valid address!',
                    'error'
                )
                return;
            }
            // For each place, get the icon, name and location.
            const bounds = new google.maps.LatLngBounds();
            places.forEach(place => {
                //clear chooseMarker
                chooseMarker.setMap(null);
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    swal.fire(
                        'Oops~',
                        'Please input valid address!',
                        'error'
                    )
                    return;
                }

                var pos = {
                    lat: place.geometry.location.lat(),
                    lng: place.geometry.location.lng()
                }
                // Create a marker for place.
                chooseMarker = new google.maps.Marker({
                    map,
                    position: pos
                });
                infowindow.setContent('Search here');
                infowindow.open(map,chooseMarker);
                placeSearch(pos);

            });
        });
    }
    //-------------------------------------------------------------------
    var pString = "${stringPatients}";
    var pMarker = new google.maps.Marker();

    function patients(bnStatus) {
        var places = pString.split('<SPLIT_MARK> ');
        for (i = 0; i < places.length; i = i + 6) {
            if (bnStatus != 'all') {
                if (bnStatus != places[i + 4]) {
                    continue;
                }
            }
            var latLong = new google.maps.LatLng(places[i], places[i + 1]);
            pMarker = new google.maps.Marker({
                position: latLong,
                icon: 'template/web/img/icons/cure.png'
            });
            if (places[i + 4] == 1) {
                pMarker.setIcon('template/web/img/icons/well.png');
            } else if (places[i + 4] == -1) {
                pMarker.setIcon('template/web/img/icons/death.png');
            }
            markersArray.push(pMarker);
            pMarker.setMap(map);
            google.maps.event.addListener(pMarker, 'click', (function (marker, content, address) {
                return function () {
                    infowindow.setContent(
                        "   <div class='dialog-ovelay'>                                                                  " +
                        "      <div class='dialog'>                                                                      " +
                        "          <header></header>                                                                     " +
                        "              <div class='dialog-msg'> \n\                                                      " +
                        "                   <h2><b>Patient's house</b></h2>                                              " +
                        "                   <span class='patient-content'>" + content + "</span>                          " +
                        "                   <h4 style = 'font-family: Arial, sans-serif'>" + address + "</h4> </div>     " +
                        "               <footer>   </footer>                                                             " +
                        "  </div></div>																		             "
                    );
                    infowindow.open(map, marker);
                };
            })(pMarker, places[i + 2], places[i + 3]));
        }
    }

    //-------------------------------------------------------------------
    var bString = "${stringAreas}";
    var bMarker = new google.maps.Marker();

    function blockAreas() {
        var places = bString.split('<SPLIT_MARK> ');
        for (i = 0; i < places.length; i = i + 4) {
            var latLong = new google.maps.LatLng(places[i], places[i + 1]);
            bMarker = new google.maps.Marker({
                position: latLong,
                icon: 'template/web/img/icons/block.png'
            });
            markersArray.push(bMarker);
            bMarker.setMap(map);
            google.maps.event.addListener(bMarker, 'click', (function (marker, address, detail) {
                return function () {
                    infowindow.setContent(
                        "   <div class='dialog-ovelay'>                                                                 " +
                        "      <div class='dialog'>                                                                     " +
                        "          <header> <i class='far fa-window-close'></i>  </header>                              " +
                        "              <div class='dialog-msg'>                                                         " +
                        "                   <h2><b>Blocked Area</b></h2>                                                " +
                        "                   <h4 style = 'font-family: Arial, sans-serif'>" + address + "</h4>           " +
                        "                   <p>" + detail + "</p> </div>                                                " +
                        "               <footer></footer>                                                               " +
                        "  </div></div>                                                                                 "
                    );
                    infowindow.open(map, marker);
                };
            })(bMarker, places[i + 2], places[i + 3]));
        }
    }
    //-------------------------------------------------------------------
    var cString = "${stringCharity}";
    var cMarker = new google.maps.Marker();

    function charityPlaces() {
        var places = cString.split('<SPLIT_MARK> ');
        for (i = 0; i < places.length; i = i + 5) {
            var latLong = new google.maps.LatLng(places[i], places[i + 1]);
            cMarker = new google.maps.Marker({
                position: latLong,
                icon: 'template/web/img/icons/charity.png'
            });
            markersArray.push(cMarker);
            cMarker.setMap(map);
            google.maps.event.addListener(cMarker, 'click', (function (marker, name, address, content) {
                return function () {
                    infowindow.setContent(
                        "   <div class='dialog-ovelay'>                                                                 " +
                        "      <div class='dialog'>                                                                     " +
                        "          <header> <i class='far fa-window-close'></i>  </header>                              " +
                        "              <div class='dialog-msg'>                                                         " +
                        "                   <h2><b>Charity Places</b></h2>                                              " +
                        "                   <h4 class='charity-name'>" + name + "</h4>                                  " +
                        "                   <h5>Address: " + address + "</h5>                                           " +
                        "                   <p>Content: " + content + "</p> </div>                                      " +
                        "               <footer></footer>                                                               " +
                        "  </div></div>                                                                                 "
                    );
                    infowindow.open(map, marker);
                };
            })(cMarker, places[i + 2], places[i + 3], places[i + 4]));
        }
    }

    //-------------------------------------------------------------------
    function blockOnly() {
        var buttons = document.getElementsByClassName('button-note');
        for (i = 0; i < buttons.length; i++) {
            buttons[i].style.backgroundColor = '#f5f5f5';
        }
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        blockAreas();
        var x = document.getElementById('blockedAreas');
        if (x.value == 'deactive') {
            x.style.backgroundColor = "lightBlue";
            x.value = 'active';
        } else {
            patients('all');
            charityPlaces();
            x.value = 'deactive';
        }
    }

    //-------------------------------------------------------------------
    function cureOnly() {
        var buttons = document.getElementsByClassName('button-note');
        for (i = 0; i < buttons.length; i++) {
            buttons[i].style.backgroundColor = '#f5f5f5';
        }
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        var x = document.getElementById('curePatients');
        if (x.value == 'deactive') {
            x.style.backgroundColor = "lightBlue";
            x.value = 'active';
            patients('0');
        } else {
            blockAreas();
            patients('all');
            charityPlaces();
            x.value = 'deactive';
        }
    }

    //-------------------------------------------------------------------
    function wellOnly() {
        var buttons = document.getElementsByClassName('button-note');
        for (i = 0; i < buttons.length; i++) {
            buttons[i].style.backgroundColor = '#f5f5f5';
        }
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        var x = document.getElementById('wellPatients');
        if (x.value == 'deactive') {
            x.style.backgroundColor = "lightBlue";
            x.value = 'active';
            patients('1');
        } else {
            blockAreas();
            patients('all');
            charityPlaces();
            x.value = 'deactive';
        }
    }

    //-------------------------------------------------------------------
    function deathOnly() {
        var buttons = document.getElementsByClassName('button-note');
        for (i = 0; i < buttons.length; i++) {
            buttons[i].style.backgroundColor = '#f5f5f5';
        }
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        var x = document.getElementById('deathPatients');
        if (x.value == 'deactive') {
            x.style.backgroundColor = "lightBlue";
            x.value = 'active';
            patients('-1');
        } else {
            patients('all');
            blockAreas();
            charityPlaces();
            x.value = 'deactive';
        }
    }
    //--------------------------------  -----------------------------------
    function charityOnly() {
        var buttons = document.getElementsByClassName('button-note');
        for (i = 0; i < buttons.length; i++) {
            buttons[i].style.backgroundColor = '#f5f5f5';
        }
        for (i = 0; i < markersArray.length; i++) {
            markersArray[i].setMap(null);
        }
        markersArray = new Array();
        charityPlaces();
        var x = document.getElementById('charityPlaces');
        if (x.value == 'deactive') {
            x.style.backgroundColor = "lightBlue";
            x.value = 'active';
        } else {
            patients('all');
            blockAreas();
            x.value = 'deactive';
        }
    }
    //-------------------------------------------------------------------
    function showAdvancedSearch(){
        var x = document.getElementById('advanced-search');
        if(x.style.display=='none'){
            x.style.display = 'block';
            enterLocation();
        } else{
            x.style.display = 'none';
            hideListResult();
        }
    }-
    //-------------------------------------------------------------------
    google.maps.event.addDomListener(window, 'load', initMap);
</script>