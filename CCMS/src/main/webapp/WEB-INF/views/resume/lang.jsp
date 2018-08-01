<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m4 w3-center">
	        <label class="inp">
	            <input type="text"  placeholder="&nbsp;" 
	            name = "langName" class="cInput" value ="${resume.certiLanguageList[0].languageName}">
	            <span class="label">외국어명</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m4 w3-center">
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "testName" 
	            class="cInput" value ="${resume.certiLanguageList[0].testName}">
	            <span class="label">공인시험</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m2 w3-center">
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "langScore" 
	            class="cInput" value ="${resume.certiLanguageList[0].score}">
	            <span class="label">급수</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m2 w3-center">
	        <label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "getDate" 
	            class="cInput" value ="${resume.certiLanguageList[0].getDate}">
	            <span class="label">취득일</span>
	            <span class="border"></span>
	        </label>
	    </div>
</div>