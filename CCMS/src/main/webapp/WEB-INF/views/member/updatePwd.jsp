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

.h2_font{
	font-family: whiteCloud;
	font-size: 1.5em;
}

</style>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	
	<div class ="w3-amber w3-center" style ="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id} 님의 공간</h1>
	</div>
	
	<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class ="w3-col m2 w3-center tab_font w3-white">
  			<c:import url ="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8"/>
		</div>
		
		<div class ="w3-col m10 w3-white w3-center" style="padding-top: 5%;">
			<div class="w3-container">
				<div class="w3-row" style="padding-bottom: 3%;">
					<div class="w3-col s4">
						<h3 class="h2_font">현재 비밀번호</h3>
					</div>
					<div class="w3-col s8">
						<input class="w3-input w3-border w3-hover-red" id="pPwd" name="pPwd" type="password">
					</div>
				</div>
				<div class="w3-row" style="padding-bottom: 3%;">
					<div class="w3-col s4">
						<h3 class="h2_font">새 비밀번호</h3>
					</div>
					<div class="w3-col s8">
						<input class="w3-input w3-border w3-hover-orange" id="nPwd" name="nPwd" type="password">
					</div>
				</div>
				<div class="w3-row" style="padding-bottom: 5%;">
					<div class="w3-col s4">
						<h3 class="h2_font">새 비밀번호 확인</h3>
					</div>
					<div class="w3-col s8">
						<input class="w3-input w3-border w3-hover-yellow" id="cnPwd" name="cnPwd" type="password">
					</div>
				</div>
			</div>
			<div class="w3-row">
				<button class="w3-button w3-large w3-green w3-right w3-hover-blue" type="button" onclick="pwdBtn();">확인</button>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	
	<script>
		function pwdBtn()
		{
			var pPwdValue = $('#pPwd').val();
			var nPwdValue = $('#nPwd').val();
			var cnPwdValue = $('#cnPwd').val();
			var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			
			if(pPwdValue == null) alert("현재 비밀번호를 입력해주세요.");
			else if(nPwdValue == null) alert("새 비밀번호를 입력해주세요.");
			else if(cnPwdValue == null) alert("새 비밀번호 확인을 입력해주세요.");
			else if(pPwdValue == nPwdValue) alert("현재 비밀번호와 새 비밀번호가 같습니다.");
			else if(!checkPwd(nPwdValue)) return false;
			else {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/updatePwd.join",
					data : {pPwd : pPwdValue,
							nPwd : nPwdValue,
							cnPwd : cnPwdValue},
					datatype : "json",
					success : function(data)
					{
						if(data.value == 'success')
						{
							alert("비밀번호가 변경되었습니다.");
							location.reload();
						
						} else if(data.value == 'pPwdError'){
							alert("현재 비밀번호가 다릅니다.");
						
						} else if(data.value == 'fail'){
							alert("비밀번호 변경 오류");
						}
					}
				});
			} 
		}
		
		function checkPwd(nPwdValue){
			if(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(password)){
				alert('비밀번호는 숫자와 영문자 특문 조합으로 8~15자리를 사용해야 합니다.');
				return false;
			}
			
			var checkNumber = nPwdValue.search(/[0-9]/g);

			var checkEnglish = nPwdValue.search(/[a-z]/ig);



			if(checkNumber <0 || checkEnglish <0){

			alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");

			return false;

			}

			if(/(\w)\1\1\1/.test(nPwdValue)){

			alert('비밀번호는 같은 문자를 4번 이상 사용하실 수 없습니다.');

			return false;

			}
			
			return true;
		}
	</script>
</body>
</html>