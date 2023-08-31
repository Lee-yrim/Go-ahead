<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<header>

	<div class="topMenu">
		<div class="logoArea">
			<a href="/myapp/camping.do"> <img src="resources/images/logo.png" class="img_logo" />
			</a>
		</div>

		<div class="gnb">
			<c:choose>
				<c:when test="${sessionScope.authInfo == null}">
					<a href="${pageContext.request.contextPath}/login.do" class="link_text">로그인</a>
					<a href="${pageContext.request.contextPath}/signup.do" class="link_text">회원가입</a>
				</c:when>
				<c:otherwise>
					<a class="link_text" href="${pageContext.request.contextPath}/logout.do"> ${sessionScope.authInfo.nickname}님
						로그아웃</a>
					<a class="link_text" href="${pageContext.request.contextPath}/mypage.do"> ${sessionScope.authInfo.nickname}님
						마이페이지</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<nav>
		<div class="nav_items">
			<ul>
				<li><a href="/myapp/camping.do">캠핑</a></li>
				<li><a href="/myapp/glamping.do">글램핑</a></li>
				<li><a href="/myapp/car.do">차박</a></li>
			</ul>
		</div>
	</nav>
</header>