<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link rel="stylesheet" href="resources/kakaomap.css"/>
<script type="text/javascript" defer src="resources/kakaomap.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88c7bc6d3721b31759169b4c8277a4f9&libraries=services"></script>

<style>
#map{
width:100%;
height:600px;
margin:0 auto;
overflow:hidden;
}

#myTab>li>button {
color:olive; 
}
</style>

 
<body>
<ul class="nav justify-content-end" id="myTab" role="tablist">
 <li class="nav-item" role="presentation">
 	<button class="nav-link active" id="card-tab" data-bs-toggle="tab" data-bs-target="#card" type="button" role="tab" aria-controls="card" aria-selected="true" onClick="location.href='glamping.do'">카드</button>
 </li>
 <li class="nav-item" role="presentation">
    <button class="nav-link" id="kakaomap-tab" data-bs-toggle="tab" data-bs-target="#kakakomap" type="button" role="tab" aria-controls="kakakomap" aria-selected="false" onClick="location.href='glampingmap.do'">지도</button>
 </li>
</ul>


<div class="map_wrap" style="margin-top:100px;margin-bottom:200px;">
	<div id="map"></div>
</div>

</body>
