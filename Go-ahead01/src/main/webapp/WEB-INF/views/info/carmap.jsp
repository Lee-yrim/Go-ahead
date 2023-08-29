<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<link rel="stylesheet" href="resources/kakaomap.css"/>
<script type="text/javascript" defer src="resources/kakaomap.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88c7bc6d3721b31759169b4c8277a4f9&libraries=services"></script>


 
<body>
	<div class="content">
		<ul class="nav justify-content-end" id="myTab" role="tablist">
			 <li class="nav-item" role="presentation">
			 	<button class="nav-link active" id="card-tab" data-bs-toggle="tab" data-bs-target="#card" type="button" role="tab" aria-controls="card" aria-selected="true" onClick="location.href='car.do'">카드</button>
			 </li>
			 <li class="nav-item" role="presentation">
			    <button class="nav-link" id="kakaomap-tab" data-bs-toggle="tab" data-bs-target="#kakakomap" type="button" role="tab" aria-controls="kakakomap" aria-selected="false" onClick="location.href='carmap.do'">지도</button>
			 </li>
		</ul>
		
		<div class="container pd-top-20">
			<div class="map_wrap">
				<div id="map"></div>
			</div>
		</div>
	</div>
</body>
