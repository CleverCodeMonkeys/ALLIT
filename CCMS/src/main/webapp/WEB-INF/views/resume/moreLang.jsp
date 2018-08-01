<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same lang.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="certLangItem" items="${resume.certiLanguageList}" begin="1">
   <div id ='langIndexZ${certLangItem.langId}'>
   		<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 	type ='button' onclick='removeBtn(name)'  name='langIndexZ${certLangItem.langId}'>삭제</button></div>
	 	<div class = 'w3-container w3-white boxForm'>
	 		<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
				<div class ="w3-col m4 w3-center">
				        <label class="inp">
				            <input type="text"  placeholder="&nbsp;" 
				            name = "langName" class="cInput" value ="${certLangItem.languageName}">
				            <span class="label">외국어명</span>
				            <span class="border"></span>
				        </label>
				    </div>
				    
				    <div class ="w3-col m4 w3-center">
				        <label class="inp">
				            <input type="text" placeholder="&nbsp;" name = "testName" 
				            class="cInput" value ="${certLangItem.testName}">
				            <span class="label">공인시험</span>
				            <span class="border"></span>
				        </label>
				    </div>
				    
				    <div class ="w3-col m2 w3-center">
				        <label class="inp">
				            <input type="text" placeholder="&nbsp;" name = "langScore" 
				            class="cInput" value ="${certLangItem.score}">
				            <span class="label">급수</span>
				            <span class="border"></span>
				        </label>
				    </div>
				    
				    <div class ="w3-col m2 w3-center">
				        <label class="inp">
				            <input type="date" placeholder="&nbsp;" name = "getDate" 
				            class="cInput" value ="${certLangItem.getDate}">
				            <span class="label">취득일</span>
				            <span class="border"></span>
				        </label>
				    </div>
			</div>
	 	</div>
   </div>
</c:forEach>