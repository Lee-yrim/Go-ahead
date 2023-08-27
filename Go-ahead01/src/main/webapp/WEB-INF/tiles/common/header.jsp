<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="head-Area">
	<div class="links">
		<a href="/" class="link_text">진행시켜</a>
	</div>
	<div class="topMenu">
		<div class="logoArea">
			<a href="/myapp/camping.do">
				<img src="https://cdn.pixabay.com/photo/2017/03/24/02/40/camping-2169976_640.png"
					class="img_logo" />
			</a>
		</div>
	
		<div class="gnb" style="height: 100px">
			<c:choose>
				<c:when test="${sessionScope.authInfo == null}">
					<a href="${pageContext.request.contextPath}/memb/login.do" class="link_text">로그인</a>
					<!-- <a href="" class="link_text">마이페이지</a> -->
					<a href="${pageContext.request.contextPath}/memb/signup.do" class="link_text">회원가입</a>
				</c:when>
				<c:otherwise>
					<a class="link_text" href="${pageContext.request.contextPath}/memb/logout.do">
						${sessionScope.authInfo.nickname}님 로그아웃</a>
					</li>
					<a class="link_text" href="${pageContext.request.contextPath}/memb/mypage.do">
						${sessionScope.authInfo.nickname}님 마이페이지</a>
						
					</li>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</header>

<nav>
	<div class="nav_items">
		<ul>
			<li><a href="/myapp/camping.do">캠핑</a></li>
			<li><a href="/myapp/glamping.do">글램핑</a></li>
			<li><a href="/myapp/car.do">차박</a></li>
		</ul>
	</div>
</nav>