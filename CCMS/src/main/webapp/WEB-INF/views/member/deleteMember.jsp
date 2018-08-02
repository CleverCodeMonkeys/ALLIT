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
<title>회원탈퇴</title>
</head>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
}

.tab_font2{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
}

.sub_menu_padding{
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}

.h3_font{
	font-family: whiteCloud;
	font-size: 1.2em;
}

.btn{
	font-size: 15px;
	margin-left: 75%;

}

p{
	margin-left: 5%;
	margin-top : 10%;
}

.password{
	margin-left: 5%;
	width:34%;
}
</style>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8" />
	<div class="w3-white" style="height: 100px;"></div>
	<!-- Spare Space -->
	<div class ="w3-amber w3-center" style ="padding-top: 0.7%; padding-bottom: 0.7%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">회원 탈퇴</h1>
	</div>
	

	<div class="w3-row"
		style="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class="w3-col m2 w3-center tab_font w3-white">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8" />
		</div>
		
		<!-- <div class="w3-container">
		  <div id="delMem" class="w3-modal">
		    <div class="w3-modal-content">
		      <div class="w3-container">
		        <span onclick="document.getElementById('delMem').style.display='none'" class="w3-button w3-display-topright">&times;</span>
		        <p>회원 탈퇴하시겠습니까?</p>
		        <p>한 번 탈퇴하시면 모든 정보는 삭제되며 되돌릴 수 없습니다.</p>
		      </div>
		    </div>
		  </div>
		</div> -->
		
		<div class=" w3-row w3-col m10 w3-white" style="margin-top: 30px; font-family: penB;">
		
		<p>회원 탈퇴하시겠습니까?<br>
		      한 번 탈퇴하시면 모든 정보는 삭제되며 되돌릴 수 없습니다.</p>
		<form action="${pageContext.request.contextPath}/member/deleteMember.do" method="POST" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
			<div class="password">
		         <label><b>비밀번호</b></label>
		         <input class="w3-input w3-border w3-margin-bottom" type="password" placeholder="비밀번호를 입력해주세요" id= "pwd" name="password" required>
		    
		    	 <button class="btn w3-button w3-red" type ="submit">회원탈퇴</button></td>     
	        </div>
	     
	        
	 	  </form>
		</div>
	</div>


</body>
</html>