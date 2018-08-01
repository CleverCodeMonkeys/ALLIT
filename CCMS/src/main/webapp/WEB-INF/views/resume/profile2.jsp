<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.inp {
  position: relative;
  margin: auto;
  width: 100%;

  display:grid;
  padding-left: 2%;
  padding-right: 2%;
}

.label {
  position: absolute;
  top: 16px;
  left: 0;
  font-size: 16px;
  color: #9098a9;
  font-weight: 500;
  transform-origin: 0 0;
  transition: all 0.2s ease;
}
.border {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 2px;
  width: 100%;
  background: #07f;
  transform: scaleX(0);
  transform-origin: 0 0;
  transition: all 0.15s ease;
}

.cInput {
  -webkit-appearance: none;
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 12px 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  border-bottom: 2px solid #c8ccd4;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}
.cInput:hover {
  background: rgba(34,50,84,0.03);
}
.cInput:not(:placeholder-shown) + span {
  color: #5a667f;
  transform: translateY(-26px) scale(0.75);
}
.cInput:focus {
  background: none;
  outline: none;
}
.cInput:focus + span {
  color: #07f;
  transform: translateY(-26px) scale(0.75);
}
.cInput:focus + span + .border {
  transform: scaleX(1);
}

</style>

	<div class = "w3-row" style="margin-top: 30px; font-family: penB;">
	    <div class ="w3-col m4 w3-center">
	        <label class="inp">
	            <input type="text" id="name" placeholder="&nbsp;" name = "userName" 
	            class="cInput" required="required" value="${resume.resume.name}">
	            <span class="label">이름</span>
	            <span class="border"></span>
	        </label>
	    </div>
	
	    <div class ="w3-col m4 w3-center">
	        <label class="inp">
	                <input type="text" id="birth" placeholder="&nbsp;" name = "birth" class="cInput" 
	                required="required" value ="${resume.resume.birthday}">
	                <span class="label">생년월일</span>
	                <span class="border"></span>
	        </label>
	    </div>
	
	   	<div class ="w3-col m4 w3-center">
	         <label class="inp">
	                  <input type="email" id ="pEmail" placeholder="&nbsp;" 
	                  name ="email" class="cInput" required="required" value="${resume.resume.email}">
	                  <span class="label">이메일</span>
	                  <span class="border"></span>
	         </label>
	    </div>
	</div>
	
	<div class = "w3-row" style="margin-top: 50px; font-family: penB; padding-bottom: 5%;">
	    <div class ="w3-col m4 w3-center">
	        <label class="inp">
	      		<input type="text" id="gender" 
	      		placeholder="&nbsp;" name = "gender" class="cInput" readonly="readonly"
	      		required="required" value ="${resume.resume.gender}">
	            <span class="label">성별</span>
	            <span class="border"></span>
	        </label>
	    </div>
	
	    <div class ="w3-col m4 w3-center">
	        <label class="inp">
	                <input type="tel" id="tel" placeholder="&nbsp;" name = "tel" 
	                class="cInput" required="required" value="${resume.resume.tel}">
	                <span class="label">전화번호</span>
	                <span class="border"></span>
	        </label>
	    </div>
	
	   	<div class ="w3-col m4 w3-center">
	         <label class="inp">
	                  <input type="text" id="address" placeholder="&nbsp;" 
	                  name ="address" class="cInput" required="required" 
	                  value="${resume.resume.address}">
	                  <span class="label">주소</span>
	                  <span class="border"></span>
	         </label>
	    </div>
	</div>
	
<script>

 var nameMax = 15;
 var emailMax = 20;
 var birthMax = 6;
 var tetlMax  = 15;
 var addressMax = 30;
 
 $('#name').keyup(function(event){
 	var value = $(this).val().length;
 	if(value >  nameMax)
 		$(this).val($(this).val().substring(0,nameMax));
 });
 
 $('#email').keyup(function(event){
	 	var value = $(this).val().length;
	 	if(value >  emailMax)
	 		$(this).val($(this).val().substring(0,emailMax));
 });
 
 $('#birth').keyup(function(event){
	 	var value = $(this).val().length;
	 	if(value >  birthMax)
	 		$(this).val($(this).val().substring(0,birthMax));
 });
 
 $('#tel').keyup(function(event){
	 	var value = $(this).val().length;
	 	if(value >  tetlMax)
	 		$(this).val($(this).val().substring(0,tetlMax));
 });
 
 $('#address').keyup(function(event){
	 	var value = $(this).val().length;
	 	if(value >  addressMax)
	 		$(this).val($(this).val().substring(0,addressMax));
 });
</script>