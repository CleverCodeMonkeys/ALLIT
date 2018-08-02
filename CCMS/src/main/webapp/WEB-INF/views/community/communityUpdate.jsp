<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validate1(){
	var title = $("[name=TITLE]").val();
	var content = $("[name=CONTENT]").val();
	
	if(title.trim().length == 0){
		alert("제목을 입력하세요.");
		return false;
		
	} else if(content.trim().length==0){
		alert("내용을 입력하세요");
	    return false;
	}
	
	return true;
}

function backList() 
{
	var answer = confirm('목록으로 돌아가시겠습니까?');
	if(answer){
		location.href = "${pageContext.request.contextPath}/community/community.comu";		
	}
}

$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                 // set focus to editable area after initializing summernote
            lang : 'ko-KR'
    });
});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
<div class="w3-container" style="padding-left: 15%; padding-right: 15%; padding-top: 5%;">
	<form action="${pageContext.request.contextPath}/community/communityUpdateEnd.comu" method="post" onsubmit="return validate1();">
		<div class="w3-row-padding">
			<div class="w3-col s1 w3-center">
				<input type="hidden" name="board_id" value="${community.board_id}"/>
			</div>
			<div class="w3-col s2 w3-center">
				<div class="w3-col"><h5>제목</h5></div>
	        </div>
	        <div class="w3-col s10 w3-center">
	            <input class="w3-input w3-border w3-hover-border-red" type="text" id="title" name="title" value="${community.title}">
	        </div>
	        <div class="w3-col s10" style="padding-top: 1%;">
	            <div class="w3-tiny">
	                                           ※ 저작권에 위배되는 게시물 작성시 운영 원칙 및 관련 법령에 따라 처벌 될 수 있습니다. <br>
	                                           ※ 이미지를 무단으로 사용 할 경우 법적인 처벌을 받을 수 있습니다.                            
	            </div>
	        </div>
	        <div class="w3-row" style="padding-top: 12%;">
	        	<textarea class="form-control" id="summernote" name="content" style="width: 100%; height: 400px;" required>${community.content}</textarea>
	        </div>
	        <div class="w3-bar w3-center" style="padding-top:7%; padding-bottom: 10%;">
	        	<button class="w3-button w3-black" type="submit">수정하기</button>
	        	<button class="w3-button w3-red" type="button" onclick="backList();">목록으로</button>
	        </div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>














