<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	// 세션 유저 이름
	var sessUserName = '<%=session.getAttribute("sessUserName")%>';
	// 세션 유저 아이디
	var sessUserId = '<%=session.getAttribute("sessUserId")%>';
	// 경로
	var path = document.location.pathname.split('/')[2]
	// 페이징
	var pageNum = "";

	function fnPopUp(title, url){
		$(".popup_title").text(title);
		$("#popup_mask").show();
		$(".popup_panel").load(url);
		$("#popup").show();
	}

	// 레이어 팝업 닫기
	function fnPopClose(){
		$("#popup_mask").hide();
		$("#popup").hide();
	}

	function boardChk(){
		if(path === 'goBoardList'){
			var addHTML = "";
			if(sessUserId){
				var like = "'" + "LIKE_LIST" + "'";
				var my = "'" + "MY_LIST" + "'";
				addHTML += "<a href ='javascript:void(0)' id='board_List_a' onclick='selectLikeList()'>모두 보기</a>";
				addHTML += '<a href ="javascript:void(0)" id="board_like_a" onclick="selectLikeList(' + like + ')">좋아요 보기</a>';
				addHTML += '<a href ="javascript:void(0)" id="board_my_a" onclick="selectLikeList(' + my + ')">내 글 보기</a>';
			}else{
				addHTML += "<a href='#' style='color : gray;'>모두 보기 </a>";
				addHTML += "<a href='#' style='color : gray;'>좋아요 보기 </a>";
				addHTML += "<a href='#' style='color : gray;'>내 글 보기 </a>";
			}
			$("#menu").html(addHTML);
		}
	}

	function doCommonAjax(url, param, successFc){
		$.ajax({
			type: "POST",
			url: url,
	        dataType : "json",
			contentType: "application/json",
	        data : JSON.stringify(param),
	        error: function(request, status, error) {
				console.log('Ajax 오류');
	        	console.log(request);
	        	console.log(status);
	        	console.log(error);
			},
			beforeSend: function() {
			},
			success: function(data) {
				eval(successFc+"("+JSON.stringify(data)+")");
			},
			complete: function() {
			}
		});
	}
	// 페이징 처리
    function paging(list, numberId, resultCntId, searchFunc){
    	if (numberId === undefined)
    		numberId = "page_number";
    	if (resultCntId === undefined)
    		resultCntId = "page_result_cnt";
    	if (searchFunc === undefined)
    		searchFunc = "doSearch";

    	let pageHtml = "";
        let startPage = "";
        let endPage = "";
        let allEndPage = Math.ceil(list.resultCnt / Number($("#"+resultCntId).val()));

        startPage = Math.floor((list.pageNum - 1) / 10) * 10 + 1;
        if ((startPage + 10 - 1) < allEndPage)
        	endPage = startPage + 10 - 1;
       	else
       		endPage = allEndPage;

      	pageHtml += "<a class='first'";
      	if (pageNum !== 1)
      		pageHtml += " onclick='"+searchFunc+"(1);'";
      	pageHtml += "><span class='icon'></span></a>";

      	pageHtml += "<a class='prev'";
      	if (startPage !== 1)
      		pageHtml += " onclick='"+searchFunc+"(" + (startPage - 1) + ");'";
      	pageHtml += "><span class='icon'></span></a>";

      	for(var i=startPage; i <= endPage; i++){
      		pageHtml += "<a ";
      		if (i == list.pageNum)
      			pageHtml += " class='active'";
      		pageHtml += " onclick='"+searchFunc+"(" + i + ");'>" + i + "</a>";
      	}

      	pageHtml += "<a class='next'";
      	if (endPage !== allEndPage)
      		pageHtml += " onclick='"+searchFunc+"(" + (startPage + 10) + ");'";
      	pageHtml += "><span class='icon'></span></a>";

      	pageHtml += "<a class='last'";
      	if (pageNum !== allEndPage)
      		pageHtml += " onclick='"+searchFunc+"(" + allEndPage + ");'";
      	pageHtml += "><span class='icon'></span></a>";

		$("#"+numberId).html(pageHtml);
    }



    // 스크롤시 페이징 처리
   	function scrollpaging(list, resultCntId, searchFunc){
    	let pageHtml = "";
        let startPage = "";
        let endPage = "";
        let allEndPage = Math.ceil(list.resultCnt / Number($("#"+resultCntId).val()));

        startPage = Math.floor((list.pageNum - 1) / 10) * 10 + 1;
        if ((startPage + 10 - 1) < allEndPage)
        	endPage = startPage + 10 - 1;
       	else
       		endPage = allEndPage;
    }
</script>