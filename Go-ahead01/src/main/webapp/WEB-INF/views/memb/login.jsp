<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	$(document).ready(function() {
		let returnUrl = "${param.returnUrl}";
		if (returnUrl != "")
			alert(returnUrl + "요청한 페이지는 회원에게만 제공됩니다.");

		if ($.cookie("REMEMBER")) {
			$("#memb_id").val($.cookie("REMEMBER"));
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

<body>
	<div id="login-wrap">
		<div class="content">
			<div class="membForm mem-form col-3">
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
						<div class="mb-3 pd-top-20">
							<label for="pw" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="memb_pw" name="memb_pw" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="rememberId" name="rememberId">
							<label class="form-check-label" for="rememberId">아이디 기억하기</label>
						</div>
						<div class="btn-box">
							<button type="submit" class="btn btn-Olive">로그인</button>
							<a href="${pageContext.request.contextPath}/signup.do" type="button"
								class="btn btn-Olive">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>