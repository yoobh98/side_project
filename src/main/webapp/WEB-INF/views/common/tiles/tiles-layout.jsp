<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>YBH</title>
	<!-- 	<link rel="icon" href="/resources/favicon.ico"> -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.bpopup.min.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/main.css">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/board.css">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/resources/css/popup.css">

	<script>
		$(function(){
			if(sessUserId === "null") {
				$(".header_nav_3").html("<a href ='goLogin'><img src='<%=request.getContextPath()%>/resources/images/로그인_아이콘.png' class='login_img'>로그인</a>");
			}else {
				$(".header_nav_3").html("<a href ='goLogout'><img src='<%=request.getContextPath()%>/resources/images/로그인_아이콘.png' class='login_img'>로그아웃</a>");
			}
			$(".header_nav_3").css(
				{
					"width" : "90%"
					, "text-align" : "right"
					, "padding-right" : "10px"
				}
			);
			//menu 생성
			boardChk();
		})
	</script>
</head>
<body>
	<div id="header"><tiles:insertAttribute name="header" /></div>

	<div id="left"><tiles:insertAttribute name="left" /></div>
	<div id="menu"><tiles:insertAttribute name="menu" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>

    <div id="footer"><tiles:insertAttribute name="footer" /></div>

	<!-- 팝업 -->
	<div id="popup_mask" class="popup_mask">
		<div class="popup_mask_in"></div>
		<div id="popup" class="popup_window640">
			<div class="popup_title_wrap">
				<p class="popup_title ellipsis"></p>
				<a class="popup_close" id="popup_close" href="javascript: fnPopClose();">
					<img alt="" src="<%=request.getContextPath()%>/resources/images/댓글아이콘.png">
				</a>
			</div>
			<div class="popup_panel">
			</div>
		</div>
	</div>
</body>
</html>