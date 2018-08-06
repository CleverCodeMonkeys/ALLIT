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

.table{
	margin-left: 30%;
	
}

#saveBtn{
	margin-left: 34%;
	margin-top: 2%;
}
</style>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8" />
	<div class="w3-white" style="height: 100px;"></div>
	<!-- Spare Space -->

	<div class="w3-amber w3-center"
		style="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id}님의 프로필 저장</h1>
	</div>

	<div class="w3-row"
		style="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class="w3-col m2 w3-center tab_font w3-white">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp"
				charEncoding="UTF-8" />
		</div>

		<div class="w3-col m10 w3-white" style="margin-top: 100px; font-family: penB;">
		
			
			<table class="table" id="tbl-profile">
			<tr>
				<th scope="col">이름</th>
				<td>${pro.name}</td>
			</tr>
			<tr>
				<th scope="col">나이</th>
				<td>${pro.birth}</td>
			</tr>
			<tr>
				<th scope="col">이메일</th>
				<td>${pro.email}</td>
			</tr>
			<tr>
				<th scope="col">성별</th>
				<td>${pro.gender=="M"?"남":"여"}</td>
			</tr>
			<tr>
				<th scope="col">전화번호</th>
				<td>${pro.tel}</td>
			</tr>
			<tr>
				<th scope="col">주소</th>
				<td>${pro.address}</td>
			</tr>
			<%-- <tr>
				<th scope="col">개발언어</th>
				<td>
					<c:forEach items="${pro.lang}" var="lang" varStatus="vs">
					${vs.index!=0?",":""} ${lang}
					</c:forEach>
				</td> 
			</tr> --%>
		</table>
			
			
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />

	<script>
		function saveProfile(){
			$('#proForm').attr("action","${pageContext.request.contextPath}/member/saveProfile.do");
			$('#proForm').attr("method","post");
			$('#proForm').submit();
		}
	</script>
</body>
</html>