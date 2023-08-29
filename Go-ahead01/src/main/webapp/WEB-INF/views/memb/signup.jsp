<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<div class="content">
	     <div class="membForm">
	         <div class="title-txt">
	             <h1>회원가입</h1>
	         </div>
	         <form class = "balidation-form" method = "post" action = "signup.do">
	             <div class="mb-3">
	                 <label for="memb_Id" class="form-label">아이디</label>
	                 <input type="text" class="form-control" id="memb_id" name = "memb_id">
	             </div>
	             <div class="mb-3">
	                 <label for="pw" class="form-label">비밀번호</label>
	                 <input type="password" class="form-control" id="memb_pw" name = "memb_pw">
	             </div>
	             <div class="mb-3">
	                 <label for="nickname" class="form-label">닉네임</label>
	                 <input type="text" class="form-control" id="nickname" name = "nickname">
	             </div>
	             <div class="mb-3">
	                 <label for="sbirth" class="form-label">생년월일</label>
	                 <input type="date" class="form-control" id="sbirth" name = "sbirth">
	             </div>
	             <div class="btn-box">
	                 <button type="button" class="btn btn-Olive">취소</button>
	                 <button type="submit" class="btn btn-Olive">회원가입</button>
	             </div>
	         </form>
	     </div>
	</div>
     <script>
        document.getElementById('sbirth').value = new Date().toISOString().substring(0, 10);
    </script>
   </body>