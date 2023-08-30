<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
	<div id="mypage-wrap">
		<div class="content container">
			<div class="row">
				<div class="membForm mem-form col-3">
					<div class="container">
						<div class="title-txt">
							<h1>마이페이지</h1>
						</div>
						<form name="mypage" method="post" action="mypage.do" novalidate>
							<div class="mb-3 user-thumb-imgArea" style="text-align: center">
								<div class="user-img">
									<img class="person_icon" src="resources/images/icon-person.png" alt="회원사진" />
								</div>
								<p>${membDTO.nickname}</p>
							</div>
							<div class="user-info">
								<div class="mb-3">
									<label class="text-l">닉네임</label>
									<input type="text" name="nickname" class="text-r" value="${membDTO.nickname}">
								</div>
								<div class="mb-3 idarea">
									<span class="text-l">아이디</span>
									<input id="id_change" class="text-r" type="text" name="memb_id" value='${membDTO.memb_id}' required
										readonly="readonly">
								</div>
								<div class="mb-3 pw-area">
									<span class="text-l">비밀번호변경</span>
									<input type="password" name="memb_pw" class="text-r" style="width: 70%" placeholder="변경할 비밀번호 입력">
								</div>

								<div class="mb-3" style="padding-left: 0;">
									<button type="submit" class="btn btn-Olive" style="width: 100%;">수정제출</button>
								</div>
								<div class="mb-3">
									<a href="${pageContext.request.contextPath}/favor.do" class="text-l"> 찜목록 &gt;</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
