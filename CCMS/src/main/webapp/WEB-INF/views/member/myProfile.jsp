<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<style>
.tab_font {
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
}

.sub_menu_padding {
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}

.h3_font {
	font-family: whiteCloud;
	font-size: 1.2em;
}

.prof {
	margin-left: 30%;
	margin-top: 2%;
}

#saveBtn {
	margin-left: 34%;
	margin-top: 5%;
}

#updateBtn {
	margin-left: 34%;
	margin-top: 5%;
}
</style>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8" />
	<div class="w3-white" style="height: 100px;"></div>
	<!-- Spare Space -->

	<div class="w3-amber w3-center"
		style="padding-top: 0.7%; padding-bottom: 0.7%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id}님의공간</h1>
	</div>

	<div class="w3-row"
		style="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class="w3-col m2 w3-center tab_font w3-white">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8" />
		</div>

		<c:if test="${empty pro.id}">
			<form id="proForm">
				<div class="w3-col m10 w3-white"
					style="margin-top: 30px; font-family: penB;">


					<%-- <div class="w3-col m2 w3-display-container w3-center"
				style="margin-left: 20%; margin-top: 5%;">
				<img id="profileImg"
					src="${pageContext.request.contextPath}/resources/images/logo/test.jpg"
					onclick="photoModal();" style="width: 70%; height: 140px;">
				<input type="hidden" name="photo" value="test.jpg">

			</div>

			<div id="photoModal" class="w3-modal">
					<div class="w3-modal-content  w3-animate-top w3-card-4"
						style="width: 430px;">
						<header class="w3-container w3-amber">
							<span
								onclick="document.getElementById('photoModal').style.display='none'"
								class="w3-button w3-display-topright">&times;</span>
							<h2 style="font-family: whiteCloud">사진등록</h2>
						</header>
						<div class="w3-container"
							style="margin-top: 2%; margin-bottom: 2%;">
							<!-- 사진 등록하기 -->
							<div class="w3-row">
								<img id="modalPhoto" style="width: 400px; height: 400px;" />
							</div>
							<input type="file" id="input-file" />
						</div>
						<footer class="w3-teal" style="font-family: penB">
							<button type="button" class="w3-pink w3-btn w3-right"
								style="width: 50%; padding-top: 1%; padding-bottom: 1%;"
								onclick="cancelPhoto();">취소</button>
							<button type="button" class="w3-light-green w3-btn"
								style="width: 50%; padding-top: 1%; padding-bottom: 1%;"
								onclick="savePhoto();">등록</button>
						</footer>
					</div>
			</div> --%>


					<div class="w3-row prof">
						<label>이름 : </label><br /> <input type="text" id="name"
							placeholder="&nbsp;" name="name" class="cInput"
							required="required">

					</div>

					<div class="w3-row prof">
						<label>생년월일 : </label> <br /> <input type="text" id="birth"
							placeholder="&nbsp;" name="birth" class="cInput"
							required="required">
					</div>

					<div class="w3-row prof">
						<label>이메일 : </label><br /> <input type="email" id="pEmail"
							placeholder="&nbsp;" name="email" class="cInput">
					</div>

					<div class="w3-row prof">
						<label>성별 : </label>&nbsp;&nbsp; <input type="radio" id="gender"
							placeholder="&nbsp;" name="gender" value="M" class="cInput"
							required="required">남&nbsp;&nbsp; <input type="radio"
							id="gender" placeholder="&nbsp;" name="gender" value="F"
							class="cInput" required="required">여
					</div>

					<div class="w3-row prof">
						<label>전화번호 : </label><br /> <input type="tel" id="tel"
							placeholder="&nbsp;" name="tel" class="cInput"
							required="required">
					</div>

					<div class="w3-row prof">
						<label>주소 : </label><br /> <input type="text" id="address"
							placeholder="&nbsp;" name="address" class="cInput"
							required="required">
					</div>

					<button type="button" id="saveBtn" class="w3-button w3-blue"
						onclick="saveProfile();">등록하기</button>

				</div>

			</form>

		</c:if>

		<c:if test="${!empty pro.id}">
			<form id="proForm">
				<div class="w3-col m10 w3-white"
					style="margin-top: 30px; font-family: penB;">

					<div class="w3-row prof">
						<label>이름 : </label><br /> <input type="text" id="name"
							value="${pro.name}" name="name" class="cInput"
							required="required">

					</div>

					<div class="w3-row prof">
						<label>생년월일 : </label> <br /> <input type="text" id="birth"
							value="${pro.birth}" name="birth" class="cInput"
							required="required">
					</div>

					<div class="w3-row prof">
						<label>이메일 : </label><br /> <input type="email" id="pEmail"
							value="${pro.email }" name="email" class="cInput">
					</div>

					<div class="w3-row prof">
						<label>성별 : </label>&nbsp;&nbsp; <input type="radio" id="gender"
							name="gender" value="M" class="cInput" required="required">남&nbsp;&nbsp;
						<input type="radio" id="gender" name="gender" value="F"
							class="cInput" required="required">여
					</div>

					<div class="w3-row prof">
						<label>전화번호 : </label><br /> <input type="tel" id="tel"
							value="${pro.tel }" name="tel" class="cInput" required="required">
					</div>

					<div class="w3-row prof">
						<label>주소 : </label><br /> <input type="text" id="address"
							value="${pro.address }" name="address" class="cInput"
							required="required">
					</div>

					<button type="button" id="updateBtn" class="w3-button w3-pink"
						onclick="updateProfile();">수정하기</button>

				</div>
			</form>


		</c:if>
	</div>




	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />

	<script>
		function saveProfile() {
			$('#proForm').attr("action",
					"${pageContext.request.contextPath}/member/saveProfile.do");
			$('#proForm').attr("method", "post");
			$('#proForm').submit();
		}

		/* 	$('#input-file').on('change', function(ev) {

				if (window.FileReader) {
					if (!$(this)[0].files[0].type.match(/image\//)) {
						alert('이미지 파일만 가능합니다');
						$(this).val('');
						return false;
					} else {
						var reader = new FileReader();
						reader.onload = function(e) {
							var src = e.target.result;
							$('#modalPhoto').attr('src', src);
						}
						reader.readAsDataURL($(this)[0].files[0]);
						console.log('여기까지 왔습니다');
					}
				}
			}); 

			
		 */
		function updateProfile() {
			$('#proForm')
					.attr("action",
							"${pageContext.request.contextPath}/member/updateProfileEnd.do");
			$('#proForm').attr("method", "post");
			$('#proForm').submit();
		}

		$(
				"input:radio[name=gender][value="
						+ '<c:out value="${ pro.gender }"/>' + "]").attr(
				"checked", "checked");
	</script>
</body>
</html>