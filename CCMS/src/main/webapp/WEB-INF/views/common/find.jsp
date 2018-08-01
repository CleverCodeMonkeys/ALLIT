<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="find" class="w3-modal padding_line">
	    <div class="w3-modal-content w3-animate-top" style ="width: 500px;">
	      <header class="w3-container w3-amber w3-center"> 
	        <span onclick="document.getElementById('find').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2 style="font-family:vitamin">ALL IT</h2>
	      </header>
	      
	      <div class ="w3-bar w3-border-bottom w3-row" style="margin-bottom:15px;">
	      	<button class="tablink3 w3-bar-item w3-button w3-col m6 " onclick="findLogin(event, 'ID')">ID 찾기</button>
	      	<button class="tablink3 w3-bar-item w3-button w3-col m6 " onclick="findLogin(event, 'Password')">Password 찾기</button>
	      </div>
	      
	      <div id="ID" class="w3-container find">
		        <div class="w3-section">
		          <label><b>이메일</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="이메일을 입력해주세요" required>
		          <button class="w3-button w3-block w3-pink w3-section w3-padding" type="button" id="find_id" onclick="find_id(this);">찾기</button>
		        </div>
	      </div>
	      
	      <div id="Password" class="w3-container find">
		        <div class="w3-section">
		          <label><b>아이디</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력해주세요" name="userId" required>
		          <label><b>이메일</b></label>
		          <input class="w3-input w3-border" type="email" placeholder="이메일을 입력해주세요" name="email" required>
		          <button class="w3-button w3-block w3-indigo w3-section w3-padding" type="button" id="find_pass" onclick="find_pass(this);">찾기</button>
		        </div>
	      </div>   
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/common/js/header.js"></script>
<script>
document.getElementsByClassName("tablink3")[0].click();

function findBtn(){
	$('#login').css('display','none');
	$('#find').css('display', 'block');
}

function findLogin(event, find){
var i, x, tablinks;
  x = document.getElementsByClassName("find");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink3");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-cyan");
  }
  document.getElementById(find).style.display = "block";
  event.currentTarget.classList.add("w3-cyan");
}

function find_id(obj){
	
	var emailValue = $(obj).prev('input').val();
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	
	if(emailValue.match(regExp) != null)
	{
		alert("데이터를 전송 중입니다. 잠시만 기다려주세요.");
		alert("조금만 더 기다려주세요.");
		$('#find_id').css('display', 'none');
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/findId.join",
			data : {email : emailValue},
			dataType: "json",
			success : function(data){
				if(data.value == 'success'){
					alert("이메일로 아이디가 전송되었습니다.");
					location.reload();
					
				}else if(data.value == 'fail'){
					alert("이메일 전송에 실패했습니다.");
					$('#find_id').css('display', 'block');
					
				}else if(data.value == 'checkF'){
					alert("가입된 이메일이 아닙니다.");
					$('#find_id').css('display', 'block');
				}
				else{
					alert("이메일 전송중 오류가 발생했습니다.");
					$('#find_id').css('display', 'block');
				}
			},
			error : function(data){
				alert("이메일 전송 실패");	
				$('#find_id').css('display', 'block');
			}
		});	
	}else
	{
		if(emailValue.length == 0) alert("이메일을 입력해주세요");
		else alert("잘못된 이메일 형식입니다.");
	}
}

function find_pass(obj){
	var idValue = $(obj).prev().prev().prev('input').val();
	var emailValue = $(obj).prev('input').val();
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	
	if(idValue != 0 && emailValue.match(regExp) != null)
	{
		alert("데이터를 전송 중입니다. 잠시만 기다려주세요.");
		alert("조금만 더 기다려주세요.");
		$('#find_pass').css('display', 'none');
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/findPass.join",
			data : {id : idValue, email : emailValue},
			dataType: "json",
			success : function(data){
				if(data.value == 'success'){
					alert("이메일로 비밀번호가 전송되었습니다.");
					location.reload();
					
				}else if(data.value == 'fail'){
					alert("이메일 전송에 실패했습니다.");
					$('#find_pass').css('display', 'block');
					
				}else if(data.value == 'checkF'){
					alert("가입된 아이디나 이메일이 아닙니다.");
					$('#find_pass').css('display', 'block');
					
				}
				else{
					alert("이메일 전송중 오류가 발생했습니다.");
					$('#find_pass').css('display', 'block');
					
				}
			},
			error : function(data){
				alert("이메일 전송 실패");
				$('#find_pass').css('display', 'block');
				
			}
		});	
	}else
	{
		if(idValue.length == 0) alert("아이디를 입력해주세요.");
		else if(emailValue.length == 0) alert("이메일을 입력해주세요");
		else alert("잘못된 이메일 형식입니다.");
	}
}

</script>
























