<!-- 선생님이 해주신거 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	function test() {
		if ($("#test_obj").css("display") == "block") {
			$("#test_obj").css("display", "none");
		} else {
			$("#test_obj").css("display", "block");
		}
	}

	function idchange() {
		if ($("#id_change").css("display") == "block") {
			$("#id_change").css("display", "none");
		} else {
			$("#id_change").css("display", "block");
		}
	}
</script>

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
									<img class="person_icon" src="resources/images/icon-person.png" alt="회원사진"/>
								</div>
								<p>${membDTO.nickname}</p>
							</div>
							<div class="user-info">
								<div class="mb-3">
									<label class="text-l">닉네임</label>
									<input type="text" name="nickname" class="text-r"
										value="${membDTO.nickname}">
								</div>
								<div class="mb-3 idarea">
									<span class="text-l">아이디</span>
									<input id="id_change" class="text-r" type="text" name="memb_id"
										value='${membDTO.memb_id}' required readonly="readonly">
								</div>
								<div class="mb-3 pw-area">
									<span class="text-l">비밀번호변경</span>
									<!-- <span style="border: 1px solid; width: 50%; display: inline-block"></span> -->
									<input type="text" name="memb_pw" class="text-r"  style="width: 70%" placeholder="변경할 비밀번호 입력">
									<!-- <input type="password" style="width: 50%" type="text" class="form-label" placeholder="변경할 비밀번호와 같게 입력" /> -->
									<!-- <button type="button" onclick="test()">변경 확인</button> -->
									
								</div>
								
								<div class="mb-3" style="padding-left:0;">
									<button type="submit" class="btn btn-Olive"  style="width: 100%;">수정제출</button>
								</div>
								<!-- <div class="mb-3" id="test_obj" style="display: none">
									<span class="form-label">변경확인 칸</span> <span
										style="border: 1px solid; width: 50%; display: inline-block">비번*****</span>
									<input style="width: 50%" type="text" class="form-label" placeholder="변경할 비밀번호와 같게 입력" />
								</div> -->
								<div class="mb-3">
									<a href="${pageContext.request.contextPath}/favor.do" class="text-l"> 찜목록  &gt;</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<!-- create table memtest(
memb_id varchar2(30),
memb_pw varchar2(30),
birth date,
nickname varchar2(30), 
favor_seq int

);

select * from memtest; -->