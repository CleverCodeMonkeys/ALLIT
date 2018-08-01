<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
    	<div class ="w3-col m6 w3-center">
	        <label class="inp">
	            <input type="text" id="schoolName" placeholder="&nbsp;" name = "highSchoolName" class="cInput" required="required" 
	            value ="${resume.highSchool.schoolName}">
	            <span class="label">고등학교명</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "school_enroll_date" class="cInput" 
	            required="required" value="${resume.highSchool.enrollDate}">
	            <span class="label">입학일</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "school_gradu_date" 
	            class="cInput" required="required" value="${resume.highSchool.enrollDate}">
	            <span class="label">졸업일</span>
	            <span class="border"></span>
	        </label>
	    </div>
    </div>
    
    <script>
    	/*  고등학교 글자수 제한 */
	    var schoolMax = 15;       
	    $('#schoolName').keyup(function(){
	 		var value = $(this).val().length;
	 	 	if(value >  schoolMax)
	 	 		$(this).val($(this).val().substring(0,schoolMax));
	 	});
    </script>