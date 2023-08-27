<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favor List</title>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!--  jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<style>
.heart {
width: 80px;
height: 80px;
background: url("https://cssanimation.rocks/images/posts/steps/heart.png")
no-repeat;
background-position: -2800px 0;
cursor: pointer;
transition: background-position 1s steps(28);
transition-duration: 0s;
}

.heart.is-active {
transition-duration: 1s;
background-position: 0 0;
}

</style>


<body>
<h1 style="text-align:center;">찜 목록</h1>

<div class="container" style="margin-top:100px">
 <div class="row">         
		<c:forEach items="${favor}" var="dto">		
			<%-- <c:set var="variety" value="${dto.variety}" /> --%>
				<div class="col-3"  style="margin-bottom:10px;">
					<div class="card" style="width:100%;height:100%">
						<img src="${dto.infoDTO.img}" style="width:100%;height:168px" alt="" />
					<div style="position: absolute; top: -20px; right: 0px">
				
					<form action="delete.do" method='get'>
					<input type="hidden" name="favor_seq" value="${dto.favor_seq}"/>
					<input type="hidden" name="info_seq" value="${dto.info_seq}"/>
						<div class="heart"></div>
		        	</form>	
					</div>
					
					<div class="card-body">
						<h5 class="card-title">${dto.infoDTO.loc_name}</h5>
						<p class="card-text" style="height:100px;padding:16px 0px;">${dto.infoDTO.address}</p>
						<a href="#" class="btn" style="background-color:olive;color:white;border-radius:10px;position:absolute;bottom:10px;">더 보기</a>
					</div>
					</div>
				</div>   
	
		</c:forEach>
	</div>
	</div>
 <script>
	$(document).ready(function(){	
		$('.heart').click(function() {
			
			 $(this).toggleClass("is-active");
			  var formData =$(this).parent().serialize();
			  
			$.ajax({
				type:'GET',
				url: 'delete.do',
				data:formData,
				success:function(){
					alert("찜 목록에서 삭제되었습니다.");
				}
			});
		});
		
	});
</script> 

</body>
</html>