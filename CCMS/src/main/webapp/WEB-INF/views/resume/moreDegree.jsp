<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same degree.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="degreeItem" items="${resume.degreeList}" begin="1">    
	<div id ='degreeIndexZ${degreeItem.degreeId}'>
		 <div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 type ='button' onclick='removeBtn(name)'  name='degreeIndexZ${degreeItem.degreeId}'>삭제</button></div>	 
	 <div class = 'w3-container w3-white boxForm'>
	 		<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
				<div class ="w3-col m2 w3-center">
					<%-- <label class="inp">
				           <input type="text" placeholder="&nbsp;" name = "schoolType"
				            class="cInput" value ="${degreeItem.schoolType}">
				           <span class="label">학교타입</span>
				           <span class="border"></span>
				    </label>  --%>
				    <c:set var ="check" value = "${degreeItem.schoolType}"/>
				    <span class="dropdown-el"> 
			  			<input type="radio" name="schoolType" value="default" checked="checked" class="sort-relevance"><label for="sort-relevance">학교타입</label>
			  			<c:choose>
			  				<c:when test="${check eq '대학교(4년) 졸업'}">
			  					<input type="radio" name="schoolType" value="대학교(4년) 졸업" checked="checked" class="sort-best"><label for="sort-best">대학교(4년) 졸업</label>
			  				</c:when>
			  				
			  				<c:otherwise>
			  					<input type="radio" name="schoolType" value="대학교(4년) 졸업" class="sort-best"><label for="sort-best">대학교(4년) 졸업</label>
			  				</c:otherwise>
			  			</c:choose>
			  			
			  			<c:choose>
			  				<c:when test="${check eq '대학(2,3년) 졸업'}">			  			
			  					<input type="radio" name="schoolType" value="대학(2,3년) 졸업" checked="checked" class="sort-low"><label for="sort-low">대학(2,3년) 졸업</label>
			  				</c:when>
			  				
			  				<c:otherwise>
			  					<input type="radio" name="schoolType" value="대학(2,3년) 졸업" class="sort-low"><label for="sort-low">대학(2,3년) 졸업</label>
			  				</c:otherwise>
			  			</c:choose>
			  			
			  			<c:choose>
			  				<c:when test="${check eq '대학원 졸업'}">
			  					<input type="radio" name="schoolType" value="대학원 졸업" class="sort-high" checked="checked"><label for="sort-high">대학원 졸업</label>
			  				</c:when>
			  				
			  				<c:otherwise>
			  					<input type="radio" name="schoolType" value="대학원 졸업" class="sort-high"><label for="sort-high">대학원 졸업</label>
			  				</c:otherwise>
			  			</c:choose>
			  			
			  			<c:choose>
			  				<c:when test="${check eq '고등학교 졸업'}">
			  					<input type="radio" name="schoolType" value="고등학교 졸업" checked="checked" class="sort-brand"><label for="sort-brand">고등학교 졸업</label>
			  				</c:when>
			  				
			  				<c:otherwise>
			  					<input type="radio" name="schoolType" value="고등학교 졸업" class="sort-brand"><label for="sort-brand">고등학교 졸업</label>
			  				</c:otherwise>
			  			</c:choose>
					</span>
				</div>
				
				<div class ="w3-col m4 w3-center">
					<label class="inp">
				           <input type="text" placeholder="&nbsp;" name = "universityName" 
				           class="cInput" value = "${degreeItem.schoolName}">
				           <span class="label">학교명</span>
				           <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m3 w3-center">
					<label class="inp">
				            <input type="date" placeholder="&nbsp;" 
				            name = "enrollDate" class="cInput" value ="${degreeItem.enrollDate}">
				            <span class="label">입학일</span>
				            <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m3 w3-center">
					<label class="inp">
				            <input type="date" placeholder="&nbsp;" name = "graduDate" 
				            class="cInput" value ="${degreeItem.graduDate}">
				            <span class="label">졸업일</span>
				            <span class="border"></span>
				    </label>
				</div>	
			</div>
			
			<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
				<div class ="w3-col m6 w3-center">
					<label class="inp">
				           <input type="text" placeholder="&nbsp;" name = "major" 
				           class="cInput" value ="${degreeItem.major}">
				           <span class="label">전공명</span>
				           <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m3 w3-center">
					<label class="inp">
				            <input type="number" placeholder="&nbsp;" name = "score" 
				            class="cInput" value ="${degreeItem.score}">
				            <span class="label">학점</span>
				            <span class="border"></span>
				    </label>
				</div>	
				
				<div class ="w3-col m3 w3-center">
					<label class="inp">
				            <input type="number" placeholder="&nbsp;" name = "totalScore" 
				            class="cInput" value ="${degreeItem.totalScore}">
				            <span class="label">총점</span>
				            <span class="border"></span>
				    </label>
				</div>	
			</div>
	 </div>	 
	</div>
</c:forEach>

