<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Correction</title>
</head>
<style>
#article {
	margin-left: 15px;
}

.layout-container {
	margin-left: 25%;
	margin-right: 25%;
}

.filter-name {
	list-style: none;
	float: left;
	margin: 5px;
}

.list-group {
	margin: 0px;
	paddign: 0px;
	width: 100%;
	list-style: none;
}

.list-group-item {
	list-style: none;
	width: 100%;
	margin: 0;
}

.list-summary-items-each {
	list-style: none;
	float: left;
}

.list-title-wrapper {
	float: left;
	width: 50%;
	margin-right: 10px;
}

.list-summary-wrapper {
	float: left;
	width: 30%
}

.list-summary-items {
	margin-top: 5px;
}

.panel {
	background-color: white;
	border: 1px solid transparent;
}

.panel-default {
	border-color: #ddd;
}

.panel-head {
	border-bottom: 1px solid #ddd;
	padding: 10px 15px;
}

.panel-title {
	padding: 10px 15px;
	border-bottom: 1px solid #ccc;
}

.panel-maintext {
	padding: 10px 15px;
}

.form-control {
	display: block;
	width: 100%;
	padding: 6px 12px;
	border: 1px solid #ccc;
	background-color: #fff;
}

#note {
	height: 500px;
	resize: none;
	overflow: auto;
}

.toolbar {
	display: block;
	width: 100%;
	border: 1px solid #ccc;
	background-color: #fff;
}

/* .review{
    	 border :  1px solid #ccc;
    } */
.review-head {
	border-bottom: 1px solid #ccc;
}

#contentForm {
	border: 0;
}

#mainContent {
	word-wrap:break-word; 
	word-break:break-all;
}
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8" />
	<div class="w3-white" style="height: 100px;"></div>
	<!-- Spare Space -->

	<!-- 전체를 감싸는 div -->
	<div class="layout-container w3-row">
		<div class="main">
			<!-- 메인 부분을 감싸는 div -->
			<div id="article" class="content all-list w3-col m12" role="main">
				<form action="${pageContext.request.contextPath}/correction/correctionModify.correct" method="POST">
					<input type="text" name="title" style="display: none;" value="${correction.correctionTitle}"/> 
					<input type="text" name="cId" style="display: none;" value="${correction.correctionId}"/>
					<textarea name="content" style="display: none;">${correction.correctionContent}</textarea>
					<textarea name="see" style="display: none;">${correction.correctionSee}</textarea> 
					<div class="content-header" style ="margin-bottom: 1%;">
						<h3 style="display: inline; font-family: vitamin;">첨삭 이력서</h3>
						&nbsp; &nbsp;
						<c:if test="${correction.correctionUserId eq m.id}">
							<input type="submit" style="font-family: penB;" value="글수정" class="w3-btn w3-indigo" />
							<input type="button" style="font-family: penB;" onclick="deleteCorrection('${correction.correctionId}','${m.id}');" value="글삭제" class="w3-btn w3-pink" />
						</c:if>
					</div>
					<div class="panel panel-default">
						<div class="panel-head">
							<div class="panel-userId"  style="display: inline; font-family: penB;">
								${correction.correctionUserId}</div>
							<div class="viewCount" style="display: inline;">
								<i class="fa fa-eye">&nbsp;</i>${correction.correctionSee}
							</div>
							<div class="write-date pull-right" style="display: inline; font-family: penB;">
								${correction.correctionDate}</div>
						</div>
						<div class="panel-title" style="font-family: penB">${correction.correctionTitle}</div>
						<div id="mainContent" style="font-family: penB" class="panel-maintext">
						
								${correction.correctionContent}
						
						</div>
					</div>
				</form>
				<c:if test="${!empty commentList}">
					<div class="review">
						<ul class="list-group">
							<li class="list-group-item">
								<h5 class="review-title" style="display: inline; font-family: vitamin;">댓글</h5> 
								<span class="review-count" style="font-family: vitamin;">${commentCount}</span>
							</li>


							<c:forEach items="${commentList}" var="commentList">

								<li class="list-group-item">
									<form action="#" method="get" class="review-update-form" style="font-family: penB;">
										<div>
											<div class="panel-userId" style="display: inline;">
												${commentList.commentUserId} <input type="hidden"
													name="commentId" value="${commentList.commentId}" /> <input
													type="hidden" name="correctionId"
													value="${commentList.correctionId}" />
												${commentList.commentDate}
											</div>
											<div id="writeDate" class="write-date"
												style="display: inline;">

												<c:if test="${m.id eq commentList.commentUserId}">
													<input type="button" value="수정"
														onclick="modifyComment(this);">
													<input type="button"
														onclick="commentDelete('${commentList.commentId}', '${commentList.correctionId}');"
														value="삭제" />

													<input type="button" value="확인" id="confrim"
														style="display: none"
														onclick="commentConfrim(this, '${commentList.commentId}', '${commentList.correctionId}');">
													<input type="button" value="취소" id="cancle"
														style="display: none" onclick="commentCancle();" />
												</c:if>
											</div>

											<fieldset id="contentForm" class="form" style="overflow:hidden; word-wrap:break-word;">
												<article id="contentFormContent"
													class="review-update-content" id="${commentList.commentId}">
													${commentList.commentContent}</article>
											</fieldset>
										</div>
									</form>
								</li>
							</c:forEach>
							<li class="list-group-item">
								<form
									action="${pageContext.request.contextPath}/correction/correctionCommentWrite.correct"
									method="get" class="review-write-form">
									<div>
										<div class="panel-userId" style="display: inline; font-family: penB;">${m.id }</div>
										<input type="hidden" id="review-userId" name="review-userId" value="${m.id }" /> 
										<input class="w3-btn w3-indigo"  type="button" id="commentContent" onclick="commentWrite();" style="font-family: penB;" value="등록" />
										<fieldset id="contentForm" class="form" style="border: 0;">
											<input type="hidden" id="correctionId" name="correctionId"
												value="${correction.correctionId}" />
											<textarea id="review-content" class="form-control col-sm-5"
												name="review-content" rows="5" placeholder="댓글쓰기" required></textarea>
										</fieldset>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${empty commentList}">
					<div class="review">
						<ul class="list-group">
							<li class="list-group-item">
								<form
									action="${pageContext.request.contextPath}/correction/correctionCommentWrite.correct"
									method="get" class="review-update-form">
									<div>
										<div class="panel-userId" style="display: inline;">${m.id }</div>
										<input type="hidden" id="review-userId" name="review-userId"
											value="${m.id }" /> <input type="button" id="commentContent"
											onclick="commentWrite();" value="등록" class="w3-btn w3-indigo" />
										<fieldset class="form" style="border: 0;">
											<input type="hidden" id="correctionId" name="correctionId"
												value="${correction.correctionId}" />
											<textarea id="review-content" name="review-content"
												class="form-control col-sm-5" rows="5" placeholder="댓글쓰기"
												required></textarea>
										</fieldset>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />
	<script>


		//댓글 등록
		function commentWrite() {
			var content = $('#review-content').val();
			var userId = $('#review-userId').val();
			var coId = $('#correctionId').val();

			content = content.trim();
			/* content.replace(/'/g,"&#39;").replace(/\"/g, "&#34;"); */

			if (content == null || content.length == 0) {
				alert("공백은 등록되지 않습니다.");
			} else {
				$.ajax({
							url : "${pageContext.request.contextPath}/correction/correctionCommentWrite.correct",
							type : "GET",
							data : {
								reviewUserId : userId,
								reviewContent : content,
								correctionId : coId
							},

							success : function() {
								alert("성공");
								location.reload();
							},
							error : function() {
								alert("에러발생");
							}

						});
			}
		}

		//댓글 수정버튼
		function modifyComment(id) {

			/* if(content.match(['"]){
			   
			} */

			var content = $(id).parent().parent()
					.find('.review-update-content').text().trim();

			$(id).parent('div').children().css("display", "none");
			$(id).siblings('#confrim').css('display', 'inline');
			$(id).siblings('#cancle').css('display', 'inline');
			$(id).parent('div').siblings('#contentForm').children().css(
					"display", "none");
			$(id).parent('div').siblings('#contentForm').append(
					"<textarea id='updateContent' class='form-control col-sm-5' rows='5' required>"
							+ content + "</textarea>");
		}

		//댓글 수정 확인
		function commentConfrim(id, cId, crId) {
			//댓글 cid를 통해 content값만 바꾸자

			var commentId = cId;
			var correctionId = crId;
			console.log(commentId);
			var updateContent = $(id).parent('div').next().children(
					'#updateContent').val().trim();

			/*  var content = $(id).siblings('#updateContent').text().trim(); */

			if (updateContent == null || updateContent.length == 0) {
				alert("공백은 등록되지 않습니다.");
			} else {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/correction/correctionCommentUpdate.correct",
							type : "GET",
							data : {
								commentId : commentId,
								updateContent : updateContent,
								correctionId : correctionId
							},

							success : function(data) {
								alert("성공");
								location.reload();
							},
							error : function(data) {
								alert("에러발생");
							}
						});

			}
		}

		//댓글 수정 취소 
		function commentCancle() {
			var commentCancle = confirm("정말로 취소하시겠습니까?");
			if (commentCancle == true)
				location.reload();
			else {
			}
		}

		//댓글 삭제
		function commentDelete(cId, crId) {
			var commentId = cId;
			var correctionId = crId;

			var commentDelete = confirm("정말로 삭제 하시겠습니까?");
			if (commentDelete == true) {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/correction/correctionCommentDelete.correct",
							type : "POST",
							data : {
								commentId : commentId,
								correctionId : correctionId
							},
							success : function() {
								alert("성공");
								location.reload();
							},
							error : function() {
								alert("에러발생");
							}
						})

			}

			else {
			}

		}

		

		//글 삭제 
		function deleteCorrection(cId, userId) {
			var deleteCorrection = confirm("정말로 삭제하시겠습니까?");
			var cId = cId;
			var userId = userId;

			if (deleteCorrection == true) {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/correction/correctionDelete.correct",
							type : "POST",
							data : {
								cUserId : userId,
								cId : cId
							},
							success : function() {
								alert("삭제 성공");
								location.href = '${pageContext.request.contextPath}/correction/correction.correct';
							},
							error : function() {
								alert("삭제 오류");
								location.href = '${pageContext.request.contextPath}/correction/correction.correct';
							}
						});
			} else
				return false;

		}
	</script>
</body>
</html>