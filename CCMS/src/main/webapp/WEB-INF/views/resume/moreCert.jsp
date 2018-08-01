<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same cert.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="certItem" items="${resume.certificateList}" begin="1"> 
	<div id ='certIndexZ${certItem.certificateId}'>
		<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 type ='button' onclick='removeBtn(name)'  name='certIndexZ${certItem.certificateId}'>삭제</button></div>
	 <div class = 'w3-container w3-white boxForm'>
	 	<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
			<div class ="w3-col m6 w3-center">
			        <label class="inp">
			            <input type="text"  placeholder="&nbsp;" name = "certName" 
			            class="cInput" value ="${certItem.certificateName}">
			            <span class="label">자격증명</span>
			            <span class="border"></span>
			        </label>
			    </div>
			    
			    <div class ="w3-col m3 w3-center">
			        <label class="inp">
			            <input type="text" placeholder="&nbsp;" name = "certFrom" 
			            class="cInput" value = "${certItem.certificateFrom}">
			            <span class="label">기관</span>
			            <span class="border"></span>
			        </label>
			    </div>
			    
			    <div class ="w3-col m3 w3-center">
			        <label class="inp">
			            <input type="date" placeholder="&nbsp;" 
			            name = "certDate" class="cInput" value ="${certItem.certificateDate}">
			            <span class="label">취득일</span>
			            <span class="border"></span>
			        </label>
			    </div>
			</div>
		</div>
	</div>
</c:forEach>