<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m6 w3-center">
	        <label class="inp">
	            <input type="text"  placeholder="&nbsp;" name = "certName" 
	            class="cInput" value ="${resume.certificateList[0].certificateName}">
	            <span class="label">자격증명</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "certFrom" 
	            class="cInput" value = "${resume.certificateList[0].certificateFrom}">
	            <span class="label">기관</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="date" placeholder="&nbsp;" 
	            name = "certDate" class="cInput" value ="${resume.certificateList[0].certificateDate}">
	            <span class="label">취득일</span>
	            <span class="border"></span>
	        </label>
	    </div>
</div>