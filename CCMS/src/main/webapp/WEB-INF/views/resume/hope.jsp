<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  [include*="form-input-select()"] {
  display: block;
  padding: 0;
  position: relative;
  /* Set options to normal weight */
  /* ------------------------------------  */
  /* START OF UGLY BROWSER-SPECIFIC HACKS */
  /* ----------------------------------  */
  /* FIREFOX won't let us hide the native select arrow, so we have to make it wider than needed and clip it via overflow on the parent container.
     The percentage width is a fallback since FF 4+ supports calc() so we can just add a fixed amount of extra width to push the native arrow out of view. We're applying this hack across all FF versions because all the previous hacks were too fragile and complex.
     You might want to consider not using this hack and using the native select arrow in FF. Note this makes the menus wider than the select button because they display at the specified width and aren't clipped. Targeting hack via http://browserhacks.com/#hack-758bff81c5c32351b02e10480b5ed48e */
  /* Show only the native arrow */
  /* color: #005BA6; */
  display: block;
  border-radius: 0;
  box-shadow: none;
  font-size: 16px;
  margin-bottom: 15px;
  width: 90%;
  
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
  content: '';
  display: block;
  position: absolute;
  pointer-events: none;
  z-index: 2;
}
[include*="form-input-select()"] select {
  -webkit-appearance: none;
  -moz-appearance: none;
       appearance: none;
  background: none;
  box-sizing: border-box;
  width: 100%;
  margin: 0;
  border: 1px solid transparent;
  font-size: 16px;
  outline: none;
  /* Focus style */
}
[include*="form-input-select()"] select:focus {
  background-color: transparent;
  outline: none;
}
[include*="form-input-select()"] option {
  font-weight: normal;
}
[include*="form-input-select()"] x:-o-prefocus, [include*="form-input-select()"]::after {
  display: none;
}
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
  [include*="form-input-select()"] select::-ms-expand {
    display: none;
  }
  [include*="form-input-select()"] select:focus::-ms-value {
    background: transparent;
    color: #000;
  }
}
@-moz-document url-prefix() {
  [include*="form-input-select()"] {
    overflow: hidden;
  }
  [include*="form-input-select()"] select {
    width: 120%;
    width: calc(100% + 3em);
    /* Firefox focus has odd artifacts around the text, this kills that. See https://developer.mozilla.org/en-US/docs/Web/CSS/:-moz-focusring */
  }
  @supports (-moz-appearance: none) {
    [include*="form-input-select()"] select {
      width: 100%;
    }
  }
  [include*="form-input-select()"] select:-moz-focusring {
    color: transparent;
    text-shadow: 0 0 0 #000;
  }
}
@supports (-moz-appearance: none) {
  [include*="form-input-select()"] {
    width: 100%;
  }
}
[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
  content: '';
  display: block;
  position: absolute;
  pointer-events: none;
  border: 1px solid transparent;
  width: 0;
  height: 0;
  right: 16px;
}
[include*="form-input-select()"]::before {
  bottom: 55%;
  border-width: 0 6.5px 8px 6.5px;
  border-bottom-color: #D6D6D6;
}
[include*="form-input-select()"]::after {
  border-width: 8px 6.5px 0 6.5px;
  border-top-color: #D6D6D6;
  top: 55%;
}
@-moz-document url-prefix() {
  [include*="form-input-select()"] {
    border-right: 3px solid #E6E6E6;
  }
  [include*="form-input-select()"]:hover {
    border-right: 3px solid #005BA6;
  }
}
[include*="form-input-select()"]:hover select {
  box-shadow: 0 2px 3px rgba(0, 91, 166, 0.1) inset;
  border-color: #005BA6;
}
[include*="form-input-select()"]:hover select:focus {
  outline-color: transparent;
}
[include*="form-input-select()"]:hover::before {
  border-bottom-color: #005BA6;
}
[include*="form-input-select()"]:hover::after {
  border-top-color: #005BA6;
}
[include*="form-input-select()"] select {
  border: 3px solid #E6E6E6;
  border-radius: 0;
  font-weight: 400;
  color: inherit;
  padding: 11px 15px;
  line-height: normal;
  transition: border-color 0.2s ease, outline 0.2s ease;
}
[include*="form-input-select()"] select:focus {
  box-shadow: 0 3px 4px rgba(0, 91, 166, 0.3) inset;
  outline: 3px solid #005BA6;
  outline-offset: -3px;
}
[include*="form-input-select()"] select[disabled], [include*="form-input-select()"] select:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}
[include*="form-input-select()"] select:invalid {
  color: #C7C7C7;
}
</style>
   
<div class = "w3-row" style="margin-top: 30px; font-family: penB; width: 100%;  padding-bottom: 5%;">
	<div class ="w3-col m6 w3-center" >
	       <%--  <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "hopeJob" 
	            class="cInput" required="required" value ="${resume.hopeCondition.job}">
	            <span class="label">직무 산업 키워드</span>
	            <span class="border"></span>
	        </label> --%>
	        <div include="form-input-select()">
	        <select name="hopeJob" class ="selectType" required="required" id ="hopeJob">
			    <option value="" hidden="">직무 산업 키워드</option>
				<option value = "웹프로그래머">웹프로그래머</option>
				<option value = "응용프로그래머">응용프로그래머</option>
				<option value = "시스템프로그래머">시스템프로그래머</option>
				<option value ="DBA·데이터베이스">DBA·데이터베이스</option>
				<option value ="네트워크·서버·보안">네트워크·서버·보안</option>
				<option value ="웹기획·PM">웹기획·PM</option>
				<option value = "웹마케팅">웹마케팅</option>
				<option value = "컨텐츠·사이트운영">컨텐츠·사이트운영</option>
				<option value ="HTML·퍼블리싱·UI개발">HTML·퍼블리싱·UI개발</option>
				<option value = "웹디자인">웹디자인</option>
				<option value = "QA·테스터·검증">QA·테스터·검증</option>
				<option value ="게임">게임</option>
				<option value = "ERP·시스템분석·설계">ERP·시스템분석·설계</option>
				<option value = "IT·디자인·컴퓨터강사">IT·디자인·컴퓨터강사</option>
				<option value = "동영상제작·편집">동영상제작·편집</option>
				<option value ="빅데이터·AI(인공지능">빅데이터·AI(인공지능</option>
				<option value = "소프트웨어·하드웨어">소프트웨어·하드웨어</option>			 
	  		</select>
	  		</div>
    </div>
<!-- </div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	 -->    
    <div class ="w3-col m3 w3-center">
	        <%-- <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "location" class="cInput"
	             required="required" value ="${resume.hopeCondition.location}">
	            <span class="label">희망 근무지</span>
	            <span class="border"></span>
	        </label> --%>
	        <div include="form-input-select()">
	        <select name="location" class ="selectType" required="required" id ="location">
	        	 <option value="" hidden="">희망 근무 지역</option>
	        	 <option value ="서울">서울</option>
	        	 <option value ="경기">경기</option>
	        	 <option value ="인천">인천</option>
	        	 <option value ="대전">대전</option>
	        	 <option value ="세종">세종</option>
	        	 <option value ="충남">충남</option>
	        	 <option value ="충북">충북</option>
	        	 <option value ="광주">광주</option>
	        	 <option value ="전남">전남</option>
	        	 <option value ="전북">전북</option>
	        	 <option value ="대구">대구</option>                                                                                                                                                                                    
				 <option value ="경북">경북</option>                                    
                 <option value ="부산">부산</option>
                 <option value ="울산">울산</option>                                                                        
                 <option value ="경남">경남</option>
                 <option value ="강원">강원</option>
                 <option value ="제주">제주</option>
				 <option value ="전국">전국</option>                                                                      
	        </select>
	        </div>
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
		    
		    /* 희망 직종 */
		    var selectedValue = '${resume.hopeCondition.job}';
		    $('#hopeJob > option').each(function(index){
		    	if($(this).val()== selectedValue){
		    		$(this).attr('selected', 'selected');
		    	}
		    }); 
		    
		    var seletedLocation = '${resume.hopeCondition.location}';
		    $('#location > option').each(function(index){
		    	if($(this).val()== seletedLocation){
		    		$(this).attr('selected', 'selected');
		    	}
		    }); 
	 	</script>