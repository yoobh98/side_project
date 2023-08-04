<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상단에 게시판, 회원정보 등을 두고, 옆 사이드에 해당 메뉴에따른 목록들   -->
<div class="header_div_nav">
	<nav class="header_nav_1">
		<span class="header_title">
			<a href ="/side/">YBH</a>
		</span>
	</nav>
	<c:choose>
		<c:when test="${loginForm == true}">
			<nav class="header_nav_2">
				<a href ="goLogin" id="login_a">로그인</a>
				<a href ="goRegister" id="register_a">회원가입</a>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="header_nav_3">

			</nav>
		</c:otherwise>
	</c:choose>
</div>