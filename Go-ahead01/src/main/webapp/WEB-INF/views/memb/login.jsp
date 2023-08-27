<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>
<script>
	$(document).ready(function() {
		let returnUrl = "${param.returnUrl}";
		if (returnUrl != "")
			alert(returnUrl + "요청한 페이지는 회원에게만 제공됩니다.");

		if ($.cookie("REMEMBER")) {
			$("#memb_Id").val($.cookie("REMEMBER"));
			$("#rememberId").prop('checked', true);

			$('#rememberId').click(function() {
				let chk = $(this).is(":checked");
				console.log(chk);
				if (!chk) {
					$.removeCookie('REMEMBER', {
						path : '/'
					});
				}
			});
		}
	});
</script>
</head>
<style>
/* 폼이 footer와 겹쳐서 formArea에서 주석처리 */

.formArea {
	/* width: 40%; */
	width: 40%;
	margin: 0 auto;
	
	/* position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%); */
}

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
@media
</style>
<body>
	<div id="warp">
		<div class="container-xxl">
			<div class="formArea mem-form col-3">
				<div class="container">
					<div class="title-txt">
						<h1>로그인</h1>
					</div>
					<form name="login" method="post" action="login.do">
						<div class="mb-3">
							<label for="memb_Id" class="form-label">아이디</label>
							<input type="text" class="form-control" id="memb_id" name="memb_id" placeholder="아이디를 입력하세요"
								required="required">
						</div>
						<div class="mb-3">
							<label for="pw" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memb_pw" name="memb_pw" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="rememberId" name="rememberId">
							<label class="form-check-label" for="rememberId">아이디 기억하기</label>
						</div>
						<div class="btn-box">
							<button type="submit" class="btn btn-primary">로그인</button>
							<a href="${pageContext.request.contextPath}/memb/signup.do" type="button"
								class="btn btn-primary">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>