<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- //bootstrap css -->

<!-- <link rel="stylesheet" href="resources/css/reset.css"> -->
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/main.css">
<!-- <link rel="stylesheet" href="/cssdemo/popup.css" /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<!-- bootstrap js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<!-- //bootstrap css -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script type="text/javascript" defer src="/jsdemo/main.js"></script>
<!-- <script type="text/javascript" src="/jsdemo/popop.js"></script> -->


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script>
	$(function() {
		$(".heart").on("click", function() {
			$(this).toggleClass("is-active");			
			let params = $(this).parents('.desc-like').next().children().first().serialize();	

			$.ajax({
				type : 'GET',
				url : 'memb/heart.do',
				data : params,
				success : function() {
					alert("ok");
				}
			});
		});
	});
</script>

</head>
<body>
	<!-- content -->
	<div class="container">
		<c:choose>
			<c:when test="${sessionScope.authInfo == null}">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/memb/login.do">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/memb/signup.do">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/memb/logout.do">
						${sessionScope.authInfo.nickname}님 로그아웃</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/detail.do">상세페이지</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="dto" items="${detailInfoList}">
			<main class="desc-Area">

				<div class="titleArea">
					<h1 class="title">${dto.loc_name }</h1>
				</div>
				<div class="flex">
					<div class="thumb-Area col-6">
						<div class="card">
							<div class="imgArea">
								<img src="${dto.img }" alt="" />
							</div>
							<!-- <div class="heartArea">
								<div class="stage">
									<div class="heart"></div>
								</div>
							</div> -->
						</div>
					</div>
					<div class="text-Area col-6">
						<table class="desc-table">
							<%-- <colgroup>
							<col width="10%">
							<col width="90%">
						</colgroup> --%>
							<tbody>
								<tr>
									<td scope="col" class="td-l">주소</td>
									<td scope="col" class="td-r">${dto.address }</td>
								</tr>
								<tr>
									<td scope="col" class="td-l col-2">전화번호</td>
									<td class="td-r">${dto.tel }</td>
								</tr>
								<tr>
									<td scope="col" class="td-l">펫</td>
									<td class="td-r">${dto.pet }</td>
								</tr>
								<tr>
									<td scope="col" class="td-l">자연환경</td>
									<td class="td-r">${dto.nature }</td>
								</tr>
								<tr>
									<td scope="col" class="td-l">홈페이지</td>
									<td class="td-r"><a href="${dto.route }" target="_blank">${dto.route }</a>
									</td>
								</tr>

								<tr>
									<td scope="col" class="desc-like td-l col-2">
									
									<div class="heartArea">
												<div class="stage">
													<div class="heart"></div>
												</div>
											</div></td>											
									<td class="td-r">
									<form> 									
									<input
										type="hidden" name="info_seq" value="${dto.info_seq}" />
									<input type="text" name="favor_why" id="favor_why"
										placeholder="찜하는 이유를 적어보세요!" />
							     	</form>
							  	</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</main>
			<!-- // thumb Area -->
			<!-- detail -->
			<div class="tab-Area pd-top-60">
				<ul class="nav nav-fill" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="detail-tab"
							data-bs-toggle="tab" data-bs-target="#detail-tab-pane"
							type="button" role="tab" aria-controls="detail-tab-pane"
							aria-selected="true">상세정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="rew-tab" data-bs-toggle="tab"
							data-bs-target="#rew-tab-pane" type="button" role="tab"
							aria-controls="rew-tab-pane" aria-selected="false">후기</button>
					</li>
				</ul>
			</div>

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="detail-tab-pane"
					role="tabpanel" aria-labelledby="detail-tab" tabindex="0">
					<!-- 상세페이지 -->
					<main>
						<div class="container">
							<h1 class="title">상세페이지</h1>
							<img src="/img/${dto.info_content }">
						</div>
					</main>
					<!-- //상세페이지 -->
				</div>
				<div class="tab-pane fade" id="rew-tab-pane" role="tabpanel"
					aria-labelledby="rew-tab" tabindex="0">
					<!-- 후기 -->
					<main>
						<div class="container">
							<h6 class="subTitle">후 &nbsp;&nbsp; 기</h6>
							<div class="pd-top-60">
								<form class="rew-write-Area" action="detail.do" method="get">
									<textarea name="contentText" id="contentText"
										placeholder="생생한 후기 작성을 해주세요!"></textarea>
									<button type="submit" class="rew-btn">리뷰작성</button>
								</form>
							</div>
							<div class="rew-list pd-top-60">
								<div class="table-Area">
									<table>
										<colgroup>
											<col width="10%">
											<col width="50%">
											<col width="10%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<td>번호</td>
												<td>내용</td>
												<td>작성자</td>
												<td>작성일</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="rdto" items="${reviewlist}">
												<tr>
													<td>${rdto.rev_seq }</td>
													<td class="rew-list-desc">
														<p>${rdto.review_content }</p>
													</td>
													<td>김쟈쟈</td>
													<td>${rdto.write_date }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</main>
					<!-- // 후기 -->
				</div>
			</div>
		</c:forEach>
		<!-- slideArea -->
		<main>
			<div class="container">
				<div class="child">
					<h1 class="subTitle">같은 연령대의 회원들이 본 장소</h1>
				</div>
				<div class="swiper-Area pd-top-60">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
							<div class="swiper-slide">
								<img src="resources/images/camp1.jpg">
								<div class="swiper-text">노을 캠핑장</div>
							</div>
						</div>

						<!-- 네비게이션 -->
						<div class="swiper-button-next"></div>
						<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
						<div class="swiper-button-prev"></div>
						<!-- 이전 버튼 -->

						<!-- 페이징 -->
						<div class="swiper-pagination"></div>
					</div>
				</div>

			</div>
		</main>
		<!-- //slideArea -->
	</div>

</body>
</html>