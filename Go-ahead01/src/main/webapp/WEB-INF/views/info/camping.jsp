<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<body>
	<div class="content">
		<ul class="nav justify-content-end" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="card-tab" data-bs-toggle="tab" data-bs-target="#card" type="button" role="tab" aria-controls="card"
					aria-selected="true">카드</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="kakaomap-tab" data-bs-toggle="tab" data-bs-target="#kakakomap" type="button" role="tab" aria-controls="kakakomap"
					aria-selected="false" onClick="location.href='kakaomap.do'">지도</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="card" role="tabpanel" aria-labelledby="#card_tab" tabindex="0">
				<div class="container pd-top-20">
					<div class="row">
						<c:forEach items="${camping}" var="dto">
							<c:url var="path" value="detail.do">
								<c:param name="info_seq" value="${dto.info_seq }" />
							</c:url>
							<c:set var="variety" value="${dto.variety}" />
							<c:if test="${fn:contains(variety, '일반')}">
								<div class="col-3 list-item">
									<div class="card" style="width: 100%; height: 100%">
										<c:set var="thumnail" value="${dto.img}" />
										<c:choose>
											<c:when test="${empty thumnail}">
												<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDpYgKX6Na9EAfhKgjLD4iyPugeNE0wggdkw&usqp=CAU"
													style="width: 100%; height: 168px" alt="" />
											</c:when>
											<c:otherwise>
												<img src="${dto.img}" style="width: 100%; height: 168px" alt="" />
											</c:otherwise>
										</c:choose>
	
										<div style="position: absolute; top: -20px; right: 0px">
											<form action="heart.do" method='get'>
												<input type="hidden" name="info_seq" value="${dto.info_seq}" />
												<input type="hidden" name="favor_why" id="favor_why" value="" />
	
												<div class="heart"></div>
	
	
	
											</form>
										</div>
	
										<div class="card-body">
											<h5 class="card-title">${dto.loc_name}</h5>
											<p class="card-text" style="height: 100px; padding: 16px 0px;">${dto.address}</p>
											<a href="${path }" class="btn" style="background-color: olive; color: white; border-radius: 10px; position: absolute; bottom: 10px;">더
												보기</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	
		   <!-- popup -->
        <div id="popup_layer">
            <div class="popup_box">
                <!--팝업 컨텐츠 영역-->
                <div class="popup_cont">
                    <h2>진행시켜 팀</h2>
                    <p>
                        EZEN ACADEMY 1차 프로젝트 <br/>
                        Let's Camp
                    </p>
                </div>
                <!--팝업 버튼 영역-->
                <div class="popup_btn">
                    <!--하루동안 보지않기-->
                    <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for a day</a>
                    <!--7일간 보지않기-->
                    <!-- <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for 7 days</a>-->
                    <a href="javascript:closePop();">Close</a>
                </div>
            </div>
        </div>
    <!-- // popup -->
	
	<script>
		$(function() {
			$(".heart").on("click", function() {
				$(this).toggleClass("is-active");
				var formData = $(this).parent().serialize();

				$.ajax({
					type : 'GET',
					url : 'memb/heart.do',
					data : formData,
					success : function() {
						alert("ok");
					}
				});
			});
		});
	</script>



</body>