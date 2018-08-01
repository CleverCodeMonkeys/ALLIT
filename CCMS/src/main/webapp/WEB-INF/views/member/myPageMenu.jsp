<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
  
   	<a href="${pageContext.request.contextPath}/member/myPage.do" id="myPageBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">My Home</a> <br><br>
  	<a href="${pageContext.request.contextPath}/member/myResume.do" id="myResumeBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">내 이력서</a> <br><br>
  	<a href="${pageContext.request.contextPath}/member/myComm.do" id="myCommBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">나의 자유게시판</a> <br><br>
  	<a href="${pageContext.request.contextPath}/member/mySkill.do" id="mySkillBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">나의 기술게시판</a> <br><br>
  	<a href="#" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">내 사전</a> <br><br><br><br>
  

  	<a href="${pageContext.request.contextPath}/member/myProfile.do" id="myProfileBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">내 정보</a><br><br>
  	<a href="${pageContext.request.contextPath}/member/gotoDelete.do" id="delMemBtn" class="w3-bar-item w3-button w3-hover-text-amber w3-hover-white" style ="text-decoration: none;">회원탈퇴</a> <br><br>
  	

<script>

	$(function() {
		
		var page = "${page}";
		
		switch(page)
		{
		case 'home': $('#myPageBtn').css('color','orange');
					break;	
		case 'resume': $('#myResumeBtn').css('color','orange');
					break;	
		case 'community': $('#myCommBtn').css('color','orange');
					break;	
		case 'skill': $('#mySkillBtn').css('color','orange');
					break;	
		case 'profile': $('#myProfileBtn').css('color','orange');
					break;	
		case 'delete' : $('#delMemBtn').css('color','orange');
					break;
		}
		
	})
	
</script>  	
  	