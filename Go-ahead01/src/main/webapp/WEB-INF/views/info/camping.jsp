<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link rel="stylesheet" href="resources/kakaomap.css"/>
<script type="text/javascript" defer src="resources/kakaomap.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88c7bc6d3721b31759169b4c8277a4f9&libraries=services"></script>
</head>

<script>
	$(document).ready(function(){	
		$('.btnSave').click(function() {
			  var formData =$(this).parent().serialize();
			  
			$.ajax({
				type:'GET',
				url: 'memb/heart.do',
				data:formData,
				success:function(){
					alert("ok");
				}
			});
			
		});
	});
</script>

<style>
#map{
width:100%;
height:500px;
/* margin:0 auto;
overflow:hidden; */
}

#map_wrap {
/* position:relative; */
top:100px;
bottom:100px;
}

.heart {
width: 80px;
height: 80px;
background: url("https://cssanimation.rocks/images/posts/steps/heart.png")
no-repeat;
background-position: 0 0;
cursor: pointer;
transition: background-position 1s steps(28);
transition-duration: 0s;
}

.heart.is-active {
transition-duration: 1s;
background-position: -2800px 0;
}

#myTab>li>button {
color:olive; 
}
</style>

<body>


<ul class="nav justify-content-end" id="myTab" role="tablist">
 <li class="nav-item" role="presentation">
 	<button class="nav-link active" id="card-tab" data-bs-toggle="tab" data-bs-target="#card" type="button" role="tab" aria-controls="card" aria-selected="true">카드</button>
 </li>
 <li class="nav-item" role="presentation">
    <button class="nav-link" id="kakaomap-tab" data-bs-toggle="tab" data-bs-target="#kakakomap" type="button" role="tab" aria-controls="kakakomap" aria-selected="false" onClick="location.href='kakaomap.do'">지도</button>
 </li>
</ul>
<div class="tab-content" id="myTabContent">
 <div class="tab-pane fade show active" id="card" role="tabpanel" aria-labelledby="#card_tab" tabindex="0">
 <div class="container" style="margin-top:100px">
 <div class="row">         
		<c:forEach items="${camping}" var="dto">
			<c:set var="variety" value="${dto.variety}" />
			<c:if test ="${fn:contains(variety, '일반')}">
				<div class="col-3"  style="margin-bottom:10px;">
					<div class="card" style="width:100%;height:100%">
					<c:set var="thumnail" value="${dto.img}" />
					<c:choose>
						<c:when test="${empty thumnail}"> 
						<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDpYgKX6Na9EAfhKgjLD4iyPugeNE0wggdkw&usqp=CAU" style="width:100%;height:168px" alt="" />
						</c:when>
						<c:otherwise> 
						<img src="${dto.img}" style="width:100%;height:168px" alt="" />
						</c:otherwise> 		
					</c:choose>
					
					<div style="position: absolute; top: -20px; right: 0px">
						<div class="heart"></div>
		        	</div>

					<div class="card-body">
					<form action="heart.do" method='get'>
					<input type="hidden" name="info_seq" value="${dto.info_seq}"/>
					<input type="button" class="btnSave" value="하트" />
					</form>
					
						<h5 class="card-title">${dto.loc_name}</h5>
						<p class="card-text" style="height:100px;padding:16px 0px;">${dto.address}</p>
						<a href="#" class="btn" style="background-color:olive;color:white;border-radius:10px;position:absolute;bottom:10px;">더 보기</a>
					</div>
					</div>
				</div>   
			</c:if>
		</c:forEach>
	</div>
	</div>
	</div>         
	<!-- <div class="tab-pane fade" id="kakakomap" role="tabpanel" aria-labelledby="kakakomap-tab" tabindex="0">
		<div class="map_wrap">
			<div id="map"></div>
		</div>
	</div> -->
</div>

 <!--    <script>
      $(function () {
        $(".heart").on("click", function () {
          $(this).toggleClass("is-active");
        });
      });
    </script>
    
    <script>
	$(document).ready(function(){
		$('#btnSave').click(function() {
			$('#col-3').attr('action','favor.do').submit();
			
		});
	});
</script> -->


</body>
</html>