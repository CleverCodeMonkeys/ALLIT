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
<meta charset="UTF-8">
<title>My Page</title>
</head>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
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

</style>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	
	<div class ="w3-black w3-center" style ="padding-top: 0.7%; padding-bottom: 0.7%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id} 님의 공간</h1>
	</div>
	
	<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class ="w3-col m2 w3-center tab_font w3-white">
  			<c:import url ="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8"/>
		</div>
		
		<div class ="w3-col m10 w3-white w3-center">
			<div class ="w3-row">
				<div class ="w3-col m4 w3-blue sub_menu_padding">
					<h3 class="h3_font">내 이력서 현황</h3>
					<h1>${ totalResume }</h1>
					<button class="w3-btn w3-brown" id = "cntResume" onclick="goResume();">자세히 보기</button>
				</div>
				
				<div class ="w3-col m4 w3-gray sub_menu_font sub_menu_padding">
					<h3 class = "h3_font">내 커뮤니티 현황</h3>
					<h1>${ totalComm }</h1>
					<button class="w3-btn w3-brown" onclick="goComm();">자세히 보기</button>
				</div>
				
				<div class ="w3-col m4 w3-pink sub_menu_font sub_menu_padding">
					<h3 class ="h3_font">내 사전 현황</h3>
					<h1>0</h1>
					<button class="w3-btn w3-brown">자세히 보기</button>
				</div>
			</div>
			
			<div class ="w3-row" style ="margin-top: 2%;">
				<div class ="w3-col m4 w3-light-green sub_menu_font sub_menu_padding">
					<h3 class ="h3_font">내 기술 커뮤니티</h3>
					<h1>${totalSkill}</h1>
					<button class="w3-btn w3-brown" onclick="goSkill();">자세히 보기</button>
				</div>
				
				<div class ="w3-col m4 w3-indigo sub_menu_font sub_menu_padding">
					<h3 class ="h3_font">내 이력서 첨삭</h3>
					<h1>0</h1>
					<button class="w3-btn w3-brown">자세히 보기</button>
				</div>
				
				<div class ="w3-col m4 w3-amber sub_menu_font sub_menu_padding">
					<h3 class ="h3_font">찜 목록</h3>
					<h1>0</h1>
					<button class="w3-btn w3-brown">자세히 보기</button>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	
	<script>
		 function goResume(){
			location.href = "${pageContext.request.contextPath}/member/myResume.do";
		}
		 
		 function goComm(){
				location.href = "${pageContext.request.contextPath}/member/myComm.do";
			}
		 
		 function goSkill(){
				location.href = "${pageContext.request.contextPath}/member/mySkill.do";
			}
		function gotoMyPage(){
			$('#myPageBtn').css('color','red');
		}
		
	</script>
</body>
</html>