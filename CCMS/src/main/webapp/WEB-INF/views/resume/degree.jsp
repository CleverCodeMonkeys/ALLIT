<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m3 w3-center">
		<%-- <label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "schoolType"
	            class="cInput" value ="${resume.degreeList[0].schoolType}">
	           <span class="label">학교타입</span>
	           <span class="border"></span>
	    </label>  --%>
	    <div include="form-input-select()">
		    <select name="schoolType" class ="selectType">
			    <option value="">학교타입</option>
			
			    <!-- normal options -->
			    <option value="대학교(4년) 졸업" ${resume.degreeList[0].schoolType == '대학교(4년) 졸업' ? 'selected="selected"' : ''}>대학교(4년) 졸업</option>
			    <option value="대학(2,3년) 졸업" ${resume.degreeList[0].schoolType == '대학(2,3년) 졸업' ? 'selected="selected"' : ''}>대학(2,3년) 졸업</option>
			    <option value="대학원 졸업" ${resume.degreeList[0].schoolType == '대학원 졸업' ? 'selected="selected"' : ''}>대학원 졸업</option>	
	  		</select>
  		</div>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "universityName" 
	           class="cInput" value = "${resume.degreeList[0].schoolName}">
	           <span class="label">학교명</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="date" placeholder="&nbsp;" 
	            name = "enrollDate" class="cInput" value ="${resume.degreeList[0].enrollDate}">
	            <span class="label">입학일</span>
	            <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "graduDate" 
	            class="cInput" value ="${resume.degreeList[0].graduDate}">
	            <span class="label">졸업일</span>
	            <span class="border"></span>
	    </label>
	</div>	
</div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m6 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "major" 
	           class="cInput" value ="${resume.degreeList[0].major}">
	           <span class="label">전공명</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="number" placeholder="&nbsp;" name = "score" 
	            class="cInput" value ="${resume.degreeList[0].score}">
	            <span class="label">학점</span>
	            <span class="border"></span>
	    </label>
	</div>	
	
	<div class ="w3-col m3 w3-center">
		<label class="inp">
	            <input type="number" placeholder="&nbsp;" name = "totalScore" 
	            class="cInput" value ="${resume.degreeList[0].totalScore}">
	            <span class="label">총점</span>
	            <span class="border"></span>
	    </label>
	</div>	
</div>

<script>
	
</script>