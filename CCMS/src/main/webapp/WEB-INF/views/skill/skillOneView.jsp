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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.1em;
}

.sub_menu_padding{
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}
</style>
</head>
<body style ="font-family: penB">
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
<div class="w3-container" style="padding-left: 15%; padding-right: 15%; padding-top: 4%;">
	<div class="w3-row">
		<div class ="w3-col m2 w3-center w3-white tab_font">
       		<div class="w3-col">
        		<button class="w3-button w3-white" type="button" onclick="freeboard();">자유게시판</button><br /><br />
        		<button class="w3-button w3-white w3-text-blue" type="button" onclick="skillboard();">기술게시판</button>
       		</div>
       	</div>
       	<div class="w3-col m10 w3-white" style="padding-left:2%; border-left: 5px solid orange;">
			<button class="w3-button w3-right w3-black" onclick="comuList();">목록으로</button>
			<table class="w3-table-all">
				<colgroup>
					<col width="8%">
					<col width="7%">
					<col width>
					<col width="10%">
					<col width="8%">
					<col width="8%">
					<col width="15%">
				</colgroup>
				<tr class="w3-red">
					<th scope="col" class="w3-small w3-center">글 번호</th>
					<th scope="col" class="w3-small w3-center">TYPE</th>
				    <th scope="col" class="w3-small">제목</th>
				    <th scope="col" class="w3-small w3-center">글쓴이</th>
				    <th scope="col" class="w3-small w3-center">조회 수</th>
				    <th scope="col" class="w3-small w3-center">댓글 수</th>
				    <th scope="col" class="w3-small w3-center">날짜</th>
				</tr>
				<tr class="w3-white">
					<th scope="col" class="w3-center">${skill.board_id}<input type="hidden" name="comment_id" value="${comment.comment_id}"/></th>
					<th scope="col" class="w3-center">${skill.type}</th>
					<th scope="col">${skill.title}</th>
					<th scope="col" class="w3-center">${skill.writer}</th>
					<th scope="col" class="w3-center">${skill.see}</th>
					<th scope="col" class="w3-center">${comment_count}</th>
					<th scope="col" class="w3-center">${skill.writer_date}</th>
				</tr>
			</table>
			<c:if test="${m.id eq skill.writer }">
				<div class="w3-bar">
					<button class="w3-button w3-right w3-pink" type="button" id="deleteComu" name="deleteComu">삭제하기</button>
					<button class="w3-button w3-right w3-teal" type="button" id="updateForm" name="updateForm">수정하기</button>
				</div>
			</c:if>
			<div class="w3-container" style="padding-top: 1%; padding-bottom: 5%;" id="content">${skill.content}</div>
			<div class="w3-container" style="padding-top: 20%; padding-bottom: 10%;">
				<div class="w3-row" id="${commentS.board_id}">
					<c:forEach items="${list}" var="comment">
						<div class="w3-col" style ="padding-top: 1%; border-top: 2px dashed gray;">
							<c:if test="${ !empty list }">
								<div class="w3-col m2">
									${comment.writer_id}
								</div>
								<div class="w3-col m2 w3-center">
									${comment.writer_date}
								</div>
							</c:if>
							<c:if test="${ comment.writer_id eq m.id }">
								<div class="w3-col m8 w3-left">
					         		<button class="w3-teal w3-border" type="button" onclick="updateComBtn(this)" style ="cursor: pointer;">수정</button>
					         		<button class="w3-pink w3-border" type="button" onclick="deleteComment(${comment.comment_id}, ${skill.board_id})" style ="cursor: pointer;">삭제</button>
								</div>
							</c:if>
							<div class="w3-col"><p style="word-break:break-all;">${comment.comment_content}</p></div>
							<input type="hidden" name="comment_id" value="${comment.comment_id}"/>
							<textarea cols="105" rows="10" name="comment_content" style="display: none;">${comment.comment_content}</textarea>
							<button class="w3-button w3-hover-red w3-right" type="button" style="display: none;" onclick="updateComment(this);">확인</button>
						</div>
					</c:forEach>
					<form action="${pageContext.request.contextPath}/skill/commentSInsert.comm">	
						<div class="w3-bordered w3-row-padding" id="insertCom" style="margin-bottom:5%; padding-top:5%;">
				     		<div class="w3-center w3-col m2" style="margin-top:12px;">${m.id}</div>
				     		<input type="hidden" name="board_id" value="${skill.board_id}"/>
				     		<div class="w3-col m8">
				     			<input class="w3-input w3-border w3-large" type="text" id="comment_content" name="comment_content" required>
				     		</div>
				     		<div class="w3-center w3-col m2">
				     			<button class="w3-button w3-teal" type="submit">저장</button>
				     		</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>      
</div>
	<script>
		function freeboard(){
			location.href="${pageContext.request.contextPath}/community/community.comu";	
		}
	
		function skillboard(){
			location.href="${pageContext.request.contextPath}/skill/skill.ski";
		}
		function comuList(){
			location.href="${pageContext.request.contextPath}/skill/skill.ski";
		}
		
		$("#updateForm").on("click",function(){
			var board_id = ${skill.board_id};
			location.href = "${pageContext.request.contextPath}/skill/skillUpdateForm.ski?no="+board_id;
		});
		
		$("#deleteComu").on("click",function(){
			var board_id = ${skill.board_id};
			var answer = confirm('게시글을 삭제하시겠습니까?');
			
			if(answer){
				location.href = "${pageContext.request.contextPath}/skill/skillDelete.ski?no=" + board_id;
			}
		});
		
		function updateComBtn(obj){
			$("#insertCom").css('display', 'none');
			$(obj).css('display', 'none');
			$(obj).parent().next('div').children('p').css('display', 'none');
			$(obj).parent().siblings('textarea').css('display', 'block');
			$(obj).parent().siblings('button').css('display', 'block');
		}
		
		function updateComment(obj){
			
			var bo = $(obj).prev().prev('input').val();
			
			var co = $(obj).prev('textarea').val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/skill/commentSUpdat.comm',
				data : {
					bo : bo,
					co : co
				},
				success : function(data){
					alert("수정성공");
					location.reload();
				}
			});
		}
		
		function deleteComment(no, bo){
			var answer = confirm('댓글을 삭제하시겠습니까?');
			
			if(answer){
				location.href = "${pageContext.request.contextPath}/skill/commentSDelete.comm?no=" + no + "&bo=" + bo;
			}
		}	
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>


























