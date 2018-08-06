<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel ="stylesheet" href ="${pageContext.request.contextPath}/resources/common/css/w3.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href ="${pageContext.request.contextPath}/resources/common/css/header.css"/>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: relative;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    width: 200px;
}

.dropdown:hover .dropdown-content {
    display: block;
}

a{
text-decoration: none !important;
}
</style>
<div class="w3-top w3-white">
  <div class="w3-bar w3-card w3-left-align w3-large padding_line">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="${pageContext.request.contextPath}" class="w3-bar-item w3-button w3-padding-large w3-left w3-hover-white" style="font-family:timeMachine">ALL IT</a>
    <a href="${pageContext.request.contextPath}/recruit/recruit.rc" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">인재채용</a>
    <a href="${pageContext.request.contextPath}/resumeList/resumeList.resume" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">이력서</a>
    <a href="${pageContext.request.contextPath}/correction/correction.correct" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">이력서첨삭</a>
    <a href="${pageContext.request.contextPath}/community/community.comu" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">커뮤니티</a>
    <!-- <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">정보마당</a> -->
    <c:if test="${empty m}">
   		<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="document.getElementById('join').style.display='block'">회원가입</a>
    	<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="document.getElementById('login').style.display='block'">로그인</a>
    </c:if>
    
     <c:if test="${!empty m}">
     <div class ="dropdown" style ="float: right;">
     	<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="">${m.id}님</a>
     	<div class ="dropdown-content">
     		<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="myPage();">마이페이지</a> <br>
     		<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="logout();">로그아웃</a>
     	</div>
     </div>
     </c:if>
  </div>

  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large padding_line">
   <a href="${pageContext.request.contextPath}/recruit/recruit.rc" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">인재채용</a>
    <a href="${pageContext.request.contextPath}/resumeList/resumeList.resume" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">이력서</a>
    <a href="${pageContext.request.contextPath}/correction/correction.correct" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">이력서첨삭</a>
    <a href="${pageContext.request.contextPath}/community/community.comu" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">커뮤니티</a>
    <c:if test="${empty m}">
    	<a class="w3-bar-item w3-button w3-padding-large" onclick="document.getElementById('join').style.display='block'">회원가입</a>
    	<a class="w3-bar-item w3-button w3-padding-large" onclick="document.getElementById('login').style.display='block'">로그인</a>
    </c:if>
    
    <c:if test="${!empty m}">
    	<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white">${m.id}님</a>
     	<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="myPage();">마이페이지</a>
     	<a class="w3-bar-item w3-right w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="logout();">로그아웃</a>
    </c:if>
  </div>
</div>

	 <div id="join" class="w3-modal padding_line">
		<div class="w3-modal-content w3-animate-top" style ="width: 500px;">
		  <header class="w3-container w3-amber w3-center"> 
	        <span onclick="cancelJoin();" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2 style="font-family:vitamin">ALL IT</h2>
	      </header>
	      
	      <div class ="w3-bar w3-border-bottom w3-row" style="margin-bottom:15px;">
	      	<button class="tablink2 w3-bar-item w3-button w3-col m6 " onclick="openJoin(event, 'individualJoin')">개인회원</button>
	      	<button class="tablink2 w3-bar-item w3-button w3-col m6 " onclick="openJoin(event, 'companyJoin')">기업회원</button>
	      </div>
	      
	      <div id="individualJoin" class="w3-container memberjoin">
	      	<form class="w3-container" action="${pageContext.request.contextPath}/common/individual.join" method="POST" onsubmit="return validate();">
		        <div class="w3-section">
		          <label><b>아이디</b></label> &nbsp;  <span class="guide ok">이 아이디는 사용 가능합니다.</span>
						 								   <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
					 <input type="hidden" name="idDuplicateCheck"
						        id="idDuplicateCheck" value="0"/>
						        
			          <div class ="w3-row">
			          	<input class="w3-input w3-border w3-margin-bottom w3-col m12"
			          	type="text" placeholder="아이디를 입력해주세요" name="userId" id = "userId"  required> 
			          </div>
		          
		          <label><b>비밀번호</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="password" placeholder="비밀번호를 입력해주세요" name="password" id ="password" required>
		          
		          <label><b>비밀번호 확인</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="password" placeholder="비밀번호를 입력해주세요" name="cpsw" id="password2" required>
		   			
		   		  <label><b>이메일</b></label>
		   		  <div class ="w3-row">
		          	<input class="w3-input w3-border w3-margin-bottom w3-col m8" type="email" placeholder="이메일을 입력해주세요" name="email" id ="email" required>
		          	<button class = "w3-col m3 w3-button w3-red w3-margin-left w3-center" type="button" onclick="sendEmail();" id ="sendingBtn">인증전송</button>
		          	<button class = "w3-col m3 w3-button w3-light-green w3-margin-left w3-center" type="button" id ="okBtn" style ="display: none">인증 완료</button>
		          </div>
		          
		          <div id = "hideAuthorized" style ="display:none;">
			          <label><b>인증번호 확인</b></label>
			          <div class ="w3-row">
			          	<input class ="w3-input w3-border w3-margin-bottm w3-col m8" type ="number" placeholder="인증번호 입력해주세요" id ="confirm"/>
			          	<button class = "w3-col m3 w3-button w3-indigo w3-margin-left w3-center" type="button" onclick="confirmBtn();">확인</button>
			          </div>
		          </div>
		          
		          <button class="w3-button w3-block w3-pink w3-section w3-padding" type="submit">회원가입</button>
		        </div>
	      	</form>
	      </div>
	      
	      <div id="companyJoin" class="w3-container memberjoin">
	      	
	      </div>
	      
	      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
	        <span class="w3-right w3-padding w3-hide-small">이용약관 <a href="#">보기</a></span>
	      </div>
	      
		</div>
	</div> 


	<div id="login" class="w3-modal padding_line">
	    <div class="w3-modal-content w3-animate-top" style ="width: 500px;">
	      <header class="w3-container w3-amber w3-center"> 
	        <span onclick="document.getElementById('login').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2 style="font-family:vitamin">ALL IT</h2>
	      </header>
	      
	      <div class ="w3-bar w3-border-bottom w3-row" id="login_Btn" style="margin-bottom:15px;">
	      	<button class="tablink w3-bar-item w3-button w3-col m6 " onclick="openLogin(event, 'individual')">개인회원</button>
	      	<button class="tablink w3-bar-item w3-button w3-col m6 " onclick="openLogin(event, 'company')">기업회원</button>
	      </div>
	      
	      <div id="individual" class="w3-container member">
	      	<form class="w3-container" action="${pageContext.request.contextPath}/common/individual.login" method="POST">
		        <div class="w3-section">
		          <label><b>아이디</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요" 
		           name="userId"  required>
		          <label><b>비밀번호</b></label>
		          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요" name="password" required>
		          <button class="w3-button w3-block w3-pink w3-section w3-padding" type="submit">로그인</button>
		        </div>
	      	</form>
	      </div>
	      
	      <div id="company" class="w3-container member">
	        <form class="w3-container" action="/company.login" method="POST">
		        <div class="w3-section">
		          <label><b>기업 아이디</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요" name="usrname" required>
		          <label><b>비밀번호</b></label>
		          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력해주세요" name="psw" required>
		          <button class="w3-button w3-block w3-indigo w3-section w3-padding" type="submit">로그인</button>
		        </div>
	       </form>
	      </div>
	      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
	        <span class="w3-right w3-padding w3-hide-small">Forgot 
	        <button class="w3-button w3-small" onclick="findBtn()">ID? / Password?</button></span>
	      </div>   
    </div>
</div>

<c:import url="/WEB-INF/views/common/find.jsp" charEncoding="UTF-8"/>
	      
<script src="${pageContext.request.contextPath}/resources/common/js/header.js"></script>
<script>

function logout(){
	var answer = confirm("로그아웃 하시겠습니까?");
	
	if(answer){
		location.href='${pageContext.request.contextPath}/member/memberLogout.do';
	}
}

function myPage()
{
	location.href='${pageContext.request.contextPath}/member/myPage.do';
}

function confirmBtn()
{
	var confirm = $('#confirm').val();
	if(confirm == "")
	{
		alert("인증번호를 적어주세요.");
	}
	else{
		$.ajax({
			url : "${pageContext.request.contextPath}/member/confirm.join",
			data : {confirm : confirm},
			dataType: "json",
			success : function(data){
				if(data.value == 'ok'){
					$('#hideAuthorized').css('display', 'none');
					$('#email').val(data.email);
					$('#email').prop('disabled', true);
					$('#sendingBtn').css('display', 'none');
					$('#okBtn').css('display', 'block');
					confirmEmail = true;				
					alert('인증번호 승인 완료');
				}else if(data.value =="no"){
					alert("인증번호가 틀립니다. 다시 확인해 주세요");
				}else if(data.value =="error"){
					alert("error 메시지 경고 잘못된 경로 접근");
				}
			}, error: function(data){
				alert("error 메시지 경고 잘못된 경로 접근");
			}
		});
	}
}

function sendEmail()
{
	var emailValue = $('#email').val();
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	if(emailValue.match(regExp) != null)
	{
		$.ajax({
			url : "${pageContext.request.contextPath}/member/mail.join",
			data : {email : emailValue},
			dataType: "json",
			success : function(data){
				if(data.value == 'success'){
					alert("인증번호가 전송되었습니다. 확인해주세요");
					$('#hideAuthorized').css('display', 'block');
				}else if(data.value == 'fail'){
					alert("이메일 전송에 실패했습니다.");
				}else if(data.value ="dup"){
					alert("이미 가입된 이메일 입니다. 확인해 주세요");
				}
				else{
					alert("이메일 전송중 오류가 발생했습니다.");
				}
			},
			error : function(data){
				alert("이메일 전송 실패");			
			}
		});	
	}else
	{
		if(emailValue.length == 0) alert("이메일을 입력해주세요");
		else alert("잘못된 이메일 형식입니다.");
	}
	
}


//Get the modal
var modal = document.getElementById('login');
/* var modal2 = document.getElementById('join'); */
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    
    /* if (event.target == modal2) {
        modal2.style.display = "none";
    } */
}


/* 아이디 중복 검사 스크립트 */
$('#userId').on('keyup', function(){
	var userId = $(this).val().trim();
	
	$.ajax({	
		url : "${pageContext.request.contextPath}/member/checkIdDup.do",
		data : {userId : userId},
		dataType : "json",
		success : function(data){
			if(data.isUsable == true){ // viewName을 활용한 방식
				$(".guide.error").hide();
				$(".guide.ok").show();
				$("#idDuplicateCheck").val(1);
			} else {
				$(".guide.error").show();
				$(".guide.ok").hide();
				$("#idDuplicateCheck").val(0);
			}
			
		}, error : function(error, msg){
			alert("error : " + error + " msg : " + msg);
		}
		
	});
});
</script>
