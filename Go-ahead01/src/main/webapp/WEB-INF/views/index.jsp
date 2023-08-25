<%-- 
===========주석해서 오류 안나면 삭제=====================
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>home</h1>
	<div>
      <ul class="navbar-nav mr-auto">
        <c:choose>
          <c:when test="${sessionScope.authInfo == null}">
           <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memb/login.do">로그인</a></li>
           <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memb/signup.do">회원가입</a></li>
           <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memb/mypage.do">마이페이지</a></li>
           </c:when>
           <c:otherwise>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memb/logout.do"> ${sessionScope.authInfo.nickname}님 로그아웃</a> </li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memb/mypage.do"> ${sessionScope.authInfo.nickname}님 마이페이지</a> </li>
           </c:otherwise>
        </c:choose>
      </ul>
  </div>  --%>