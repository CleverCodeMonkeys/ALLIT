<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class = "w3-row" style="margin-top: 30px; font-family: penB; width: 100%;">
	<div class ="w3-col m12 w3-center" >
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "hopeJob" 
	            class="cInput" required="required" value ="${resume.hopeCondition.job}">
	            <span class="label">직무 산업 키워드</span>
	            <span class="border"></span>
	        </label>
    </div>
</div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	    
    <div class ="w3-col m9 w3-center">
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "location" class="cInput"
	             required="required" value ="${resume.hopeCondition.location}">
	            <span class="label">희망 근무지</span>
	            <span class="border"></span>
	        </label>
    </div>
    
    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="number" placeholder="&nbsp;" name = "salary" class="cInput" id ="salary"
	            required="required" value ="${resume.hopeCondition.salary}">
	            <span class="label">희망연봉[단위:만원]</span>
	            <span class="border"></span>
	        </label>
    </div>
</div>
		<script>
 			var salaryMax = 5;       
		    $('#salary').keyup(function(){
		 		var value = $(this).val().length;
		 	 	if(value >  salaryMax)
		 	 		$(this).val($(this).val().substring(0,salaryMax));
		 	});
	 	</script>