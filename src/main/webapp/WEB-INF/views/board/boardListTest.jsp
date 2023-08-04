<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	var likeList;
	var listCart;
	var path;
	var updateTemp;
	window.addEventListener("scroll", infiniteScroll);
	let isUpdateList = true;

	$(function(){
		$("#board_List_a").addClass("main_menu_selected")
		$("#side_board_link").addClass("side_menu_selected")
		selectLikeList();
		console.log(window.innerHeight)
		console.log(window.scrollY)
		console.log(document.body.offsetHeight)
	})

	function infiniteScroll(){
	    if(window.innerHeight + window.scrollY >= document.body.offsetHeight ) {
			console.log('2끝');
		}
	}

	function selectLikeList(pathGubun) {

		var jsonData = {
			writeId : sessUserId
		}

		doCommonAjax("selectLikeList", jsonData, "selectLikeListCallBack");

		path = pathGubun;
	}

	function selectLikeListCallBack(list){
		likeList = list;
		selectAllBoardListTest();
	}

	function selectAllBoardListTest(movePageNum){
		if(movePageNum === undefined) pageNum =1;
		else pageNum = movePageNum;

		var jsonData = {
			sessUserId : sessUserId
			, likeMyGubun : path
			, pageNum : pageNum
			, pageResultCnt : $("#board_list_page_result_cnt").val()
		}

		doCommonAjax("selectAllBoardListTest", jsonData, "selectAllBoardListTestCallBack");

		if(jsonData.likeMyGubun === "LIKE_LIST"){
			$("#board_like_a").addClass("main_menu_selected");
			$("#board_my_a").removeClass("main_menu_selected");
			$("#board_List_a").removeClass("main_menu_selected");
		}else if(jsonData.likeMyGubun === "MY_LIST"){
			$("#board_my_a").addClass("main_menu_selected");
			$("#board_List_a").removeClass("main_menu_selected");
			$("#board_like_a").removeClass("main_menu_selected");
		}else{
			$("#board_List_a").addClass("main_menu_selected");
			$("#board_my_a").removeClass("main_menu_selected");
			$("#board_like_a").removeClass("main_menu_selected");
		}
	}


	function selectAllBoardListTestCallBack(data) {
		listCart = data;
		var addHTML = "";

		if(data.resultCnt === 0) {
			addHTML += "<h1>등록된 글이 없습니다.</h1>";
		}else {
			for([i,list] of data.result.entries()) {
			var content = list.content.replace(/(?:\r\n|\r|\n)/g, '<br />');
/* 1-s */	addHTML += "<li class = 'board_list'>";
	/* 2-s */	addHTML += "<div class = 'board_div'>";
		/* 3-s */	addHTML += "<div id = 'board_change_id_" + list.boardNum + "'>";

/* top-s */			addHTML += "<div class = 'board_div_top'>";
						addHTML += "<div class = 'board_div_top_one'>";
						addHTML += "<p class = 'board_p'>" + list.userName + "</p>";
						addHTML += "</div>";
						addHTML += "<div class = 'board_div_top_two'>";
						addHTML += "<p class = 'board_p'>" + list.writeDate + "</p>";

	/* 수정|삭제 */		addHTML += "<span id = 'dialog_" + list.boardNum + "' style='display:none;' class='span_border'>";
						addHTML +=  "<a href = 'javascript:void(0)' onclick='updateBoard(" + list.boardNum + ")'>수정</a> ";
						addHTML +=  "<a href = 'javascript:void(0)' onclick='deleteBoard(" + list.boardNum + ")'>삭제</a> ";
						addHTML += "<input type = 'hidden' id='hidden_dialog_" + list.boardNum + "' value='f'>";
	/* 수정|삭제 */		addHTML += "</span>";

						if(sessUserId === list.writeId){
							addHTML += "<a href='javascript:void(0)' onclick='dialog_show_hide(" + list.boardNum + ")'><img src='<%=request.getContextPath()%>/resources/images/three_dots.png' class='img_icon'></a>" ;
						}
						addHTML += "</div>";
/* top-e */			addHTML += "</div>";

					addHTML += "<p class='board_content'>" + content + "</p>";
					addHTML += "<hr style='color : gray; opacity : 0.5;'>";
/* Bottom-s */		addHTML += "<div class='list_bottom_div'>";
						addHTML += "<div class='like_div'>";
						addHTML += "<a href='javascript:void(0)' onclick = 'doLike(" + list.boardNum + ")'>";
						if(likeList.length === 0){
							addHTML += "<img src='<%=request.getContextPath()%>/resources/images/like_off.jpg' class='img_icon' id='like_num_" + list.boardNum + "'> <span id='like_span_" + list.boardNum + "'>" + list.likeCnt + "</span>";
						}else{
							var k = 0 ;
							for(var j = 0 ; j < likeList.length ; j++){
								if(list.boardNum === likeList[j].likeNum){
									k = 1;
									break;
								}
							}

							if(k === 1){
								addHTML += "<img src='<%=request.getContextPath()%>/resources/images/like_on.jpg' class='img_icon' id='like_num_" + list.boardNum + "'> <span id='like_span_" + list.boardNum + "'>" + list.likeCnt + "</span>";
							}else {
								addHTML += "<img src='<%=request.getContextPath()%>/resources/images/like_off.jpg' class='img_icon' id='like_num_" + list.boardNum + "'> <span id='like_span_" + list.boardNum + "'>" + list.likeCnt + "</span>";
							}
						}
						addHTML += "</a>";
						addHTML += "</div>";
						addHTML += "<div class='reply_div'>";
						addHTML += "<a href = 'javascript:void(0)' onclick = 'openReplyPopup()'>";
						addHTML += "<img src='<%=request.getContextPath()%>/resources/images/댓글아이콘.png' class='img_icon' onclick='openReplyPopup()'> " + list.replyCnt;
						addHTML += "</a>";
						addHTML += "</div>";
/* Bottom-e */		addHTML += "</div>";

		/* 3-e */	addHTML += "</div>";

/* hide-s */	addHTML += "<div id = 'board_update_form_id_" + list.boardNum + "' style='display : none'>";
	/* TOP-s */		addHTML += "<div class = 'board_div_top'>";
					addHTML += "<div class = 'board_div_top_one'>";
					addHTML += "<p class = 'board_p'>" + list.userName + "</p>";
					addHTML += "</div>";
					addHTML += "<div class = 'board_div_top_two'>";
					addHTML += "<p class = 'board_p'>" + list.writeDate + "</p>";
					addHTML += "</div>";
	/* TOP-e */		addHTML += "</div>";
				addHTML += "<textarea rows='10' cols='110%' class='board_textarea' id='board_update_form_content_" + list.boardNum + "'>" + list.content + "</textarea>";
				addHTML += "<hr style='color : gray; opacity : 0.5;'>";
	/* Bottom-s */	addHTML += "<div style='text-align : right;'>";
					addHTML += "<button onclick='updateBoardWrite(" + list.boardNum + ")'>완료</button>";
					addHTML += "<button onclick='updateBoard()'>취소</button> ";
	/* Bottom-e */	addHTML += "</div>";
/* hide-e */	addHTML += "</div>";

	/* 2-e */	addHTML += "</div>";
/* 1-e */	addHTML += "</div>";
			}//for-END
		}//else-END

		paging(list, "board_list_number", "board_list_page_result_cnt", "selectAllBoardListTest");
		$("#board_content_div").html(addHTML);
	}

	function writeSaveChk(){
		if($("#text_area_content").val().trim() !== ""){
			writeBoard();
		}else {
			alert('내용을 입력해주세요');
		}
	}

	function wrtieCancle(){
		$("#text_area_content").val("");
	}

	function writeBoard() {
		var jsonData = {
			content : $("#text_area_content").val().trim()
			, writeId : sessUserId
		}

		$.ajax({
			url : "insertBoard"
			, type : "post"
			, data : JSON.stringify(jsonData)
			, contentType : "application/json; charset=utf-8"
			, dataType : "json"
			, success : function(data) {
				writeBoardCallBack(data);
			}
			, error : function() {
				alert('ajax 오류');
			}
		})
	}

	function writeBoardCallBack(data) {
		if(data === 1){
			selectAllBoardListTest();
			wrtieCancle();
		}else{
			alert('오류 발생, 다시 시도해주세요.');
		}
	}

	//좋아요 제어
	function doLike(num){
		var jsonData = {
			boardNum : num
			, writeId : sessUserId
		}

		$.ajax({
			url : "updateLike"
			, type : "post"
			, data : JSON.stringify(jsonData)
			, contentType : "application/json; charset=utf-8"
			, dataType : "json"
			, success : function(data) {
				if(data === 0){
					alert('오류 발생, 다시 시도해주세요.');
				}else if(data === 1){
					$("#like_num_" + num).attr("src", "<%=request.getContextPath()%>/resources/images/like_on.jpg");
					$("#like_span_" + num).text(Number($("#like_span_" + num).text()) + 1);
				}else if(data === 2){
					$("#like_num_" + num).attr("src", "<%=request.getContextPath()%>/resources/images/like_off.jpg");
					$("#like_span_" + num).text(Number($("#like_span_" + num).text()) - 1);
				}
			}
			, error : function() {
				alert('ajax 오류');
			}
		})
	}

	// 수정 및 삭제 버튼 제어
	function dialog_show_hide(num){
		if($("#hidden_dialog_" + num).val() === 'f'){
			$("#dialog_" + num).show();
			$("#hidden_dialog_" + num).val('t');
		}else{
			$("#dialog_" + num).hide();
			$("#hidden_dialog_" + num).val('f');
		}
	}

	function openReplyPopup(){
		fnPopUp("Content", 'openBoardEditForm');
	}

	function deleteBoard(num){
		var result = confirm("삭제 하시겠습니까?");

		if(result){
			var jsonData = {
				boardNum : num
			}

			$.ajax({
				url : "deleteBoard"
				, type : "post"
				, data : JSON.stringify(jsonData)
				, contentType : "application/json; charset=utf-8"
				, dataType : "json"
				, success : function(){
					for(var i = 0 ; i < listCart.length ; i++){
						if(listCart[i].boardNum === num){
							listCart.splice(i, 1);
						}
					}
					selectAllBoardListTestCallBack(listCart);
					alert('삭제되었습니다.');
				}
				, error : function(){
					alert('ajax오류');
				}
			})
		}
	}

	function updateBoard(num){
		if(updateTemp !== undefined){
			$("#board_update_form_id_" + updateTemp).hide();
			$("#board_change_id_" + updateTemp).show()
		}
		updateTemp = num;

		$("#board_change_id_" + num).hide();
		$("#board_update_form_id_" + num).show();
	}

	function updateBoardWrite(num){
		var jsonData = {
			boardNum : num
			, content : $("#board_update_form_content_" + num).val()
		}

		$.ajax({
			url : "updateBoardWrite"
			, type : "post"
			, data : JSON.stringify(jsonData)
			, contentType : "application/json; charset=utf-8"
			, dataType : "json"
			, success : function(data){
				alert('수정 완료.')
				for(var i = 0 ; i < listCart.length ; i++){
					if(listCart[i].boardNum === num){
						listCart.splice(i, 1, data);
					}
				}
				selectAllBoardListTestCallBack(listCart);
			}
			, error : function(){
				alert('ajax오류');
			}
		})
	}


</script>

<div class="board_write">
	<div class="board_write_div">
		<span class="span_left">지금 여러분의 생각을 적어주세요.</span>
		<textarea rows="10" cols="110%" placeholder="내용을 입력해 주세요." class="board_textarea" id="text_area_content"></textarea>
		<hr style="color: gray; opacity: 0.5;">
		<div class="board_write_div_bottom">
			<a href="javascript:void(0)" onclick="writeSaveChk()">입력</a>
			<a href="javascript:void(0)" onclick="wrtieCancle()">취소</a>
		</div>
	</div>
</div>

<div id="board_content_div">
</div>
<input type="hidden" id="board_list_page_result_cnt" value="10">