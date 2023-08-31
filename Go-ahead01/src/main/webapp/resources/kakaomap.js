$(function() {
	$.getJSON("resources/data/camping2.json", function(data) {
		for (var i = 0; i < data.length; i++) {
			var lat = data[i]['mapY'];
			var lng = data[i]['mapX'];
			var name = data[i]['name'];
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png';
			var imageSize = new kakao.maps.Size(25, 35);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			var latlng = new kakao.maps.LatLng(lat, lng);
			var marker = new kakao.maps.Marker({
				map : map,
				position : latlng,
				image : markerImage
			})
		}
});

var mapContainer = document.getElementById("map");
var mapOption = {
	center : new kakao.maps.LatLng(37.55667866460624,126.91952714001684),
	level : 7
}
var map = new kakao.maps.Map(mapContainer, mapOption);

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;font-size:16px;">사용자 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
   
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    

});


