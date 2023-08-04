<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		$("#login_a").addClass("login_menu_selected")
	})

	function loginChk() {
		var jsonData = {
			userId : $("#user_id").val().trim()
			, userPw : $("#user_pw").val().trim()
		}

		$.ajax({
			url : "loginChk"
			, type : "post"
			, data : JSON.stringify(jsonData)
			, contentType : "application/json; charset=utf-8"
			, dataType : "json"
			, success : function(data){
				if(data.errMessage !== ""){
					alert(data.errMessage);
				}else{
					location.href = "/side/";
				}
			}
			, error : function() {
				alert('ajax 오류')
			}
		})
	}

</script>

<div class="box_login_div">
	<input type="text" placeholder="아이디" class="box_login_input_text" id="user_id"><br>
	<input type="text" placeholder="비밀번호" class="box_login_input_text" id="user_pw"><br>
	<div>
		<button onclick="loginChk()" class="login_btn">로그인</button>
	</div>
</div>