<!-- 선생님이 해주신거 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>mypage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<!-- <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>

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

<style>
/* 폼이 footer와 겹쳐서 아래 formArea(원본)에 주석처리*/
.formArea {
	width: 80%;
	margin: 0 auto;
}


/* .formArea {
	width: 80%;
	margin: 0 auto;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
} */

.title-txt {
	margin: 60px 0;
}

.title-txt h1 {
	font-weight: 900;
	text-transform: uppercase;
}

.mem-form input::placeholder {
	color: #999;
}

.btn-box {
	text-align: center;
	padding-top: 40px;
}

.btn-box .btn {
	width: 100%;
	margin: 10px 0;
}

.idarea {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

.idarea>div {
	width: 80%
}
</style>
</head>

<body>
	<div id="warp">
		<div class="container-xxl">
			<div class="formArea mem-form col-3">
				<div class="container">
					<div class="title-txt">
						<h1>마이페이지</h1>
					</div>
					
					<form name="mypage" method="post" action="mypage.do" novalidate>
						<div class="mb-3" style="text-align: center">
							<img class="person_icon" src="resources/images/icon-person.png" alt="회원사진"
								style="width: 100px; height: 100px" />
							<p>${membDTO.nickname}</p>
						</div>
						<hr>
						
						<div class="mb-3">
							<label for="name">닉네임</label>
							<input type="text" name="nickname" style="width: 80%; margin-left: 30px%"
								value="${membDTO.nickname}">
						</div>

						<div class="mb-3 idarea">
							<div>
								<span class="form-label">아이디</span>
								<%-- <span>${membDTO.memb_id}</span> --%>
								<input id="id_change" type="text" style="width: 80%;" name="memb_id"
									value='${membDTO.memb_id}' required readonly="readonly">
							</div>

						</div>
						
						<div class="mb-3">
							<span class="form-label">비밀번호변경</span>
							<!-- <span style="border: 1px solid; width: 50%; display: inline-block"></span> -->
							<input type="text" name="memb_pw" style="width: 50%" class="form-label"
								placeholder="변경할 비밀번호 입력">
							<!-- <input type="password" style="width: 50%" type="text" class="form-label" placeholder="변경할 비밀번호와 같게 입력" /> -->
							<!-- <button type="button" onclick="test()">변경 확인</button> -->
						</div>

						<!-- <div class="mb-3" id="test_obj" style="display: none">
							<span class="form-label">변경확인 칸</span> <span
								style="border: 1px solid; width: 50%; display: inline-block">비번*****</span>
							<input style="width: 50%" type="text" class="form-label" placeholder="변경할 비밀번호와 같게 입력" />
						</div> -->

						<div class="mb-3">
							<button type="button"><a href="favor.do">찜목록</a></button>
						</div>

						<div class="btn-box">
							<input type="submit" value="수정제출">
						</div>
					</form>
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