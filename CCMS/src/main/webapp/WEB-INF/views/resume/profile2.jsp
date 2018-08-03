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

/* Add New Content  */
.button-wrap {
  position: relative;
  text-align: center;
  top: 50%;
   margin-top: -1.5em; 
}

.button-label {
  display: inline-block;
  padding: 1em 2em;
  margin: 0.5em;
  cursor: pointer;
  color: #292929;
  border-radius: 0.25em;
  background: #efefef;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0 rgba(0, 0, 0, 0.22);
  transition: 0.3s;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.button-label h1 {
  font-size: 1em;
  font-family: "Lato", sans-serif;
}
.button-label:hover {
  background: #d6d6d6;
  color: #101010;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0 -3px 0 rgba(0, 0, 0, 0.32);
}
.button-label:active {
  -webkit-transform: translateY(2px);
          transform: translateY(2px);
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2), inset 0px -1px 0 rgba(0, 0, 0, 0.22);
}
@media (max-width: 40em) {
  .button-label {
    padding: 0em 1em 3px;
    margin: 0.25em;
  }
}

#yes-button:checked + .button-label {
  background: rgb(63, 81, 181);
  color: #efefef;
}
#yes-button:checked + .button-label:hover {
  background: rgb(63, 81, 181);
  color: #e2e2e2;
}

#no-button:checked + .button-label {
  background: #D91E18;
  color: #efefef;
}
#no-button:checked + .button-label:hover {
  background: #c21b15;
  color: #e2e2e2;
}

#maybe-button:checked + .button-label {
  background: #4183D7;
  color: #efefef;
}
#maybe-button:checked + .button-label:hover {
  background: #2c75d2;
  color: #e2e2e2;
}

.hidden {
  display: none;
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
	                <span class="label">생년월일[주민번호앞자리]</span>
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
	        <%-- <label class="inp">
	      		<input type="text" id="gender" 
	      		placeholder="&nbsp;" name = "gender" class="cInput" onkeydown="return genderKey(event);"
	      		onclick="openGender();"
	      		required="required" value ="${resume.resume.gender}">
	            <span class="label">성별</span>
	            <span class="border"></span>
	        </label> --%>
	        <div class="button-wrap">
	        
      		<input class="hidden radio-label" type="radio" name="gender" id="yes-button" checked="checked" value="남"/>
      		<label class="button-label" for="yes-button">
        			남자
      		</label>
      		<input class="hidden radio-label" type="radio" name="gender" id="no-button" value="여"/>
      		<label class="button-label" for="no-button">
        			여자
      		</label>
    		</div>
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
 
 // 성별 세팅 체크 박스
 $( document ).ready(function() {
	var gender = '${resume.resume.gender}';
	if(gender != ""){
		if(gender != $('#yes-button').val()){
			$('#no-button').attr('checked', true);
		}
	}
});
 
</script>