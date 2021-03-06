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

	<%-- <div class="w3-amber w3-center"
		style="padding-top: 0.7%; padding-bottom: 0.7%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id}님의 기본 프로필</h1>
	</div> --%>
	
	<c:import url="mypageBanner.jsp" charEncoding="UTF-8"/>

	<div class="w3-row"
		style="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class="w3-col m2 w3-center tab_font w3-white">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8" />
		</div>

		<c:if test="${empty pro.id}">
			<form id="proForm" onsubmit="return validate();">
				<div class="w3-col m10 w3-white"
					style="margin-top: 80px; font-family: penB;">


					<div class="w3-row prof">
						<label>이름 : </label><br /> <input type="text" id="name"
							placeholder="&nbsp;" name="name" class="cInput"
							required>

					</div>

					<div class="w3-row prof">
						<label>생년월일 : </label> <br /> <input type="text" id="birth"
							placeholder="주민번호 앞자리 6자리" name="birth" class="cInput" required>
					</div>

					<div class="w3-row prof">
						<label>이메일 : </label><br /> <input type="email" id="pEmail"
							placeholder="&nbsp;" name="email" class="cInput" required>
					</div>

					<div class="w3-row prof">
						<label>성별 : </label>&nbsp;&nbsp; <input type="radio" id="gender"
							placeholder="&nbsp;" name="gender" value="M" class="cInput"
							required checked="checked">남&nbsp;&nbsp; <input type="radio"
							id="gender" placeholder="&nbsp;" name="gender" value="F"
							class="cInput" required>여
					</div>

					<div class="w3-row prof">
						<label>전화번호 : </label><br /> <input type="tel" id="tel"
							placeholder="&nbsp;" name="tel" class="cInput"
							required>
					</div>

					<div class="w3-row prof">
						<label>주소 : </label><br /> <input type="text" id="address"
							placeholder="&nbsp;" name="address" class="cInput"
							required>
					</div>

					<button  id="saveBtn" class="w3-button w3-blue"
						>등록하기</button>

				</div>

			</form>

		</c:if>

		<c:if test="${!empty pro.id}">
			<form id="proForm">
				<div class="w3-col m10 w3-white"
					style="margin-top: 80px; font-family: penB;">

					<div class="w3-row prof">
						<label>이름 : </label><br /> <input type="text" id="name"
							value="${pro.name}" name="name" class="cInput"
							required>

					</div>

					<div class="w3-row prof">
						<label>생년월일 : </label> <br /> <input type="text" id="birth"
							value="${pro.birth}" name="birth" class="cInput"
							required>
					</div>

					<div class="w3-row prof">
						<label>이메일 : </label><br /> <input type="email" id="pEmail"
							value="${pro.email }" name="email" class="cInput"  required>
					</div>

					<div class="w3-row prof">
						<label>성별 : </label>&nbsp;&nbsp; <input type="radio" id="gender"
							name="gender" value="M" class="cInput" required="required" checked="checked">남&nbsp;&nbsp;
						<input type="radio" id="gender" name="gender" value="F"
							class="cInput" required>여
					</div>

					<div class="w3-row prof">
						<label>전화번호 : </label><br /> <input type="tel" id="tel"
							value="${pro.tel }" name="tel" class="cInput" required>
					</div>

					<div class="w3-row prof">
						<label>주소 : </label><br /> <input type="text" id="address"
							value="${pro.address }" name="address" class="cInput"
							required>
					</div>

					<button type="button" id="updateBtn" class="w3-button w3-pink"
						onclick="updateProfile();">수정하기</button>

				</div>
			</form>


		</c:if>
	</div>




	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />

	<script>
		
		$(function() {
			
			$("input:radio[name=gender][value="
					+ '<c:out value="${ pro.gender }"/>' + "]").attr(
			"checked", "checked");
			
		});
		
	
		function saveProfile() {
			$('#proForm').attr("action",
					"${pageContext.request.contextPath}/member/saveProfile.do");
			$('#proForm').attr("method", "post");
			$('#proForm').submit();
		}

		
		function updateProfile() {
			$('#proForm')
					.attr("action",
							"${pageContext.request.contextPath}/member/updateProfileEnd.do");
			$('#proForm').attr("method", "post");
			$('#proForm').submit();
		}

		
		 var nameChk = false;
		var birthChk = false;
		var emailChk = false;
		var genderChk = false;
		var telChk = false;
		var addressChk = false;
		
		 function validate() {
			
			var issue = '';
			if($('#name').val().trim() != '' || $('#name').val().trim().length < 11) {
				nameChk = true;
				issue = '이름';
			}
			if($('#birth').val().trim() != '' || $('#birth').val().trim().length < 15) {
				birthChk = true;
				issue = '생일';
			}
			if($('#email').val().trim() != '' || $('#email').val().trim().length < 30) {
				emailChk = true;
				issue = '이메일';
			}
			
			if($('#tel').val().trim() != '' || $('#tel').val().trim().length < 15) {
				telChk = true;
				issue = '번호';
			}
			if($('#address').val().trim() != '' || $('#address').val().trim().length < 100) {
				addressChk = true;
				issue = '주소';
			}
			
			if(nameChk&&birthChk&&emailChk&&telChk&&addressChk) {
				saveProfile();
			}else {
				alert(issue + '값을 확인해주세요');
			}
			
			return !addressChk;
		} 		
		 
	</script>
</body>
</html>













