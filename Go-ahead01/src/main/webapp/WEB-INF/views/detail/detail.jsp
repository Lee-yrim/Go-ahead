<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$(".heart").on(
				"click",
				function() {
					$(this).toggleClass("is-active");
					let params = $(this).parents('.desc-like').next()
							.children().first().serialize();

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
<body>
	<!-- content -->
	<div class="container pd-top-100">
		<c:forEach var="dto" items="${detailInfoList}">
			<c:url var="path" value="detail.do">
				<c:param name="info_seq" value="${dto.info_seq }" />
			</c:url>
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
						</div>
					</div>
					<div class="text-Area col-6">
						<table class="desc-table">
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
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
										</div>
									</td>
									<td class="td-r">
										<form>
											<input type="hidden" name="info_seq" value="${dto.info_seq}" />
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
					<main class="content">
						<div class="container">
							<h1 class="title">상세페이지</h1>
							<div class="thumb-img">
								<img src="/img/${dto.info_content }">
							</div>
						</div>
					</main>
					<!-- //상세페이지 -->
				</div>
				<div class="tab-pane fade" id="rew-tab-pane" role="tabpanel"
					aria-labelledby="rew-tab" tabindex="0">
					<!-- 후기 -->
					<main>
						<div class="content">
							<h6 class="subTitle">후 &nbsp;&nbsp; 기</h6>
							<div class="pd-top-60">
								<form class="rew-write-Area" action="${path }" method=post>
									<textarea name="review_content" id="review_content"
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
													<td>${rdto.nickname }</td>
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
		<main class="content">
			<div class="container">
				<div class="child">
					<h1 class="subTitle">같은 연령대의 회원들이 본 장소</h1>
				</div>

				<div class="swiper-Area pd-top-60">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:forEach var="adto" items="${algolist}">
								<c:url var="algopath" value="detail.do">
									<c:param name="info_seq" value="${adto.info_seq}" />
								</c:url>
								<div class="swiper-slide">
									<img src="${adto.img}" style="width: 100%; height: 168px" />
									<div class="swiper-text"><a href="${algopath}" class="btn"
										>${adto.loc_name}</a></div>
								</div>
							</c:forEach>
						</div>

					
					</div>
				</div>
			</div>
		</main>
		<!-- //slideArea -->
	</div>

</body>
