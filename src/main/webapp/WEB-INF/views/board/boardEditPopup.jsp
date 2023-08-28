<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		console.log(typeof(${boardOne.boardNum}));	// number
		console.log(typeof('${boardOne.boardNum}'));	// string => 컨트롤러에서 int로 받아짐
		selectReplyByboardNum();
	})

	function selectReplyByboardNum(){
		var jsonData = {
			boardNum : '${boardOne.boardNum}'
		}
		doCommonAjax("selectReplyByboardNum", jsonData, "selectReplyByboardNumCallBack");
	}

	function selectReplyByboardNumCallBack(data){
		var addHTML = "";
		data.forEach((item) => {
			addHTML += "<tr>";
			addHTML += "<th>작성자 : " + item.writeId + "</th>";
			addHTML += "<th>내용 : " + item.content + "</th>";
			addHTML += "</tr>";
		})

		$("#reply_tb").html(addHTML);
	}

	function replySave(){
		var jsonData = {
			boardNum : '${boardOne.boardNum}'
			, writeId : sessUserId
			, content : $("#reply_content").val()
		}
		doCommonAjax("replySave", jsonData, "replySaveCallBack");
	}

	function replySaveCallBack(data){
		$("#reply_cnt_" + '${boardOne.boardNum}').text(
														Number($("#reply_cnt_" + '${boardOne.boardNum}').text()) + 1
													);
		selectReplyByboardNumCallBack(data);
	}

</script>


<h1>내용들</h1>

<table border="1">
	<tr>
		<th>유저 : ${boardOne.writeId}</th>
		<th>날짜 : ${boardOne.writeDate}</th>
	</tr>
	<tr>
		<th colspan="2">내용 : ${boardOne.content}</th>
	</tr>
</table>

<h3>댓글 작성</h3>
<textarea id="reply_content">
</textarea>
<button type="button" onclick="replySave()">작성</button>



<div>
	<h3>댓글</h3>
	<table border="1" id="reply_tb">
	</table>
</div>