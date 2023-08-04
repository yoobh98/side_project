<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(function(){
		$("#register_a").addClass("login_menu_selected")
	})

	function regFormChk(){
		if($("#user_name").val().trim() === "") {
			alert('이름을 입력해주세요.')
			$("#user_name").focus()
		}else if($("#user_id").val().trim() === "") {
			alert('아이디를 입력해주세요.')
			$("#user_id").focus()
		}else if($("#user_pw").val().trim() === "") {
			alert('비밀번호를 입력해주세요.')
			$("#user_pw").focus()
		}else if($("#user_pw_chk").val().trim() === "") {
			alert('비밀번호확인을 입력해주세요.')
			$("#user_pw_chk").focus()
		}else{
			if($("#user_pw").val().trim() === $("#user_pw_chk").val().trim()) {
				registerChk()
			}else {
				alert('비밀번호가 일치하지 않습니다.')
			}
		}
	}

	function registerChk(){
		var jsonData = {
			userId : $("#user_id").val().trim()
			, userPw : $("#user_pw").val().trim()
			, userName : $("#user_name").val().trim()
		}

		$.ajax({
			url : "registerChk", type : "post",
			data : JSON.stringify(jsonData),
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data){
				if(data === 2) {
					alert('이미 존재하는 아이디입니다')
				}else {
					alert('회원가입 완료.')
					location.href = "goLogin"
				}
			}, error : function(){
				alert('회원가입중 오류가 발생했습니다. 다시 시도해 주세요.')
				location.reload()
			}
		})
	}

</script>

<div class="box_login_div">
	<input type="text" placeholder="이름" class="box_login_input_text" id="user_name"><br>
	<input type="text" placeholder="아이디" class="box_login_input_text" id="user_id"><br>
	<input type="text" placeholder="비밀번호" class="box_login_input_text" id="user_pw"><br>
	<input type="text" placeholder="비밀번호확인" class="box_login_input_text" id="user_pw_chk"><br>
	<div>
		<button onclick="regFormChk()" class="login_btn">회원가입</button>
	</div>
</div>