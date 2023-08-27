<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<style>
/* 폼이 footer와 겹쳐서 아래 formArea(원본)에 주석처리*/
.formArea {
        width: 40%;
        margin: 0 auto;
    }

/*     .formArea {
        width: 20%;
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
    .btn-box {
        text-align: center;
        padding-top: 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .btn-box button {
        width: 48%;
    }
</style>
<body>
     <div class="formArea">
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
                 <button type="button" class="btn btn-primary">취소</button>
                 <button type="submit" class="btn btn-primary">회원가입</button>
             </div>
         </form>
     </div>
     <script>
        document.getElementById('sbirth').value = new Date().toISOString().substring(0, 10);
    </script>
   </body>