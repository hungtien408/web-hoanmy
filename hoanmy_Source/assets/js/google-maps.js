// Defining variables that need to be available to some functions
var map, infoWindow;
var rendererOptions = {
    draggable: true
};
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
//Thay dia chi web
var endAddress = "10.745383, 106.645022";
//Thay toa do
var lat = 10.745383, long = 106.645022; 
window.onload = function () {
    //init direction
    directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
    // Creating a map
    var options = {
        zoom: 17,
        center: new google.maps.LatLng(lat, long),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('map'), options);


    // Adding a marker
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat, long),
        map: map,
        title: 'Click me'
    });
    // Adding a marker


    google.maps.event.addListener(marker, 'click', function () {

        // Check to see if an InfoWindow already exists
        if (!infoWindow) {
            infoWindow = new google.maps.InfoWindow();
        }

        // Creating the content  
        var content = '<div class="box">' +
            '<h2>HOÀN MỸ</h2>' +
            '<div class="wrap-mapbox">' +
                '<p class="contact-1">Cơ sở kinh doanh Hòan Mỹ, 180/60 Phạm Phú Thứ, Phường 4, Quận 6, Tp.HCM</p>' +
                '<p class="contact-2">Tel: 08 38543138 / 0822 126 345</p>' +
                '<p class="contact-3"><a class="link-mail" href="mailto: cohoanmy@gmail.com"> cohoanmy@gmail.com</a></p>' +
            '</div>' +
        '</div>';

        // Setting the content of the InfoWindow
        infoWindow.setContent(content);

        // Opening the InfoWindow
        infoWindow.open(map, marker);

    });

//            //HUNG -- Cho điểm thứ 2
//            var marker2 = new google.maps.Marker({
//                position: new google.maps.LatLng(10.788813, 106.616269),
//                map: map,
//                title: 'Click me'
//            });

//            google.maps.event.addListener(marker2, 'click', function () {

//                 Check to see if an InfoWindow already exists
//                if (!infoWindow) {
//                    infoWindow = new google.maps.InfoWindow();
//                }

//                 Creating the content  
//                var content = '<div class="box">' +
//                '<h2>Thám Tử Nam Long (Cơ sở 1)</h2>' +
//                '<p><strong>Địa chỉ:</strong> 41 - 43 Trần Cao Vân - Phường 6 - Quận 3</p>' +
//                '<p><strong>Điện thoại :</strong>  0906 77075</p>' +
//                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
//                '</div>';

//                 Setting the content of the InfoWindow
//                infoWindow.setContent(content);

//                 Opening the InfoWindow
//                infoWindow.open(map, marker2);

//            });
//            //HUNG-END -- Cho điểm thứ 2

//            //HUNG -- Cho điểm thứ 3
//            var marker3 = new google.maps.Marker({
//                position: new google.maps.LatLng(10.788813, 106.616269),
//                map: map,
//                title: 'Click me'
//            });

//            google.maps.event.addListener(marker3, 'click', function () {

//                 Check to see if an InfoWindow already exists
//                if (!infoWindow) {
//                    infoWindow = new google.maps.InfoWindow();
//                }

//                 Creating the content  
//                var content = '<div class="box">' +
//                '<h2>Thám Tử Nam Long (Cơ sở 2)</h2>' +
//                '<p><strong>Địa chỉ:</strong> Số 9a đường số 13 - Phường Bình Hưng Hòa - Quận Bình Tân</p>' +
//                '<p><strong>Điện thoại :</strong>  0906 77075</p>' +
//                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
//                '</div>';

//                 Setting the content of the InfoWindow
//                infoWindow.setContent(content);

//                 Opening the InfoWindow
//                infoWindow.open(map, marker3);

//            });
//            //HUNG-END -- Cho điểm thứ 3

//                    //HUNG -- Cho điểm thứ 3
//            var marker4 = new google.maps.Marker({
//                position: new google.maps.LatLng(10.788813, 106.616269),
//                map: map,
//                title: 'Click me'
//            });

//            google.maps.event.addListener(marker4, 'click', function () {

//                 Check to see if an InfoWindow already exists
//                if (!infoWindow) {
//                    infoWindow = new google.maps.InfoWindow();
//                }

//                 Creating the content  
//                var content = '<div class="box">' +
//                '<h2>Thám Tử Nam Long (Cơ sở 3)</h2>' +
//                '<p><strong>Địa chỉ:</strong> 402 Kinh Dương Vương , Phường An Lạc - Quận Bình tân</p>' +
//                '<p><strong>Điện thoại :</strong>  0945214218</p>' +
//                '<p><strong>Email:</strong> <a href="mailto:info@gamil.com">info@gamil.com</a></p>' +
//                '</div>';

//                 Setting the content of the InfoWindow
//                infoWindow.setContent(content);

//                 Opening the InfoWindow
//                infoWindow.open(map, marker4);

//            });
//                    //HUNG-END -- Cho điểm thứ 3

    // Hiển thị thông tin
    google.maps.event.trigger(marker, 'click');

    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));
};

function calcRoute() {
    var start = document.getElementById("start").value;
    var end = endAddress;
    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.DirectionsTravelMode.WALKING
        //travelMode: google.maps.DirectionsTravelMode.BICYCLING
        //travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
}