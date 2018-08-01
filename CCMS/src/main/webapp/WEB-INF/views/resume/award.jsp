<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class = "w3-row" style="margin-top: 30px; font-family: penB;">
	<div class ="w3-col m6 w3-center">
	        <label class="inp">
	            <input type="text"  placeholder="&nbsp;" name = "awardTitle" 
	            class="cInput" value ="${resume.awardList[0].awardTitle}">
	            <span class="label">수상명</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="text" placeholder="&nbsp;" name = "awardOrgan" 
	            class="cInput" value = "${resume.awardList[0].awardOrganization}">
	            <span class="label">수여기관</span>
	            <span class="border"></span>
	        </label>
	    </div>
	    
	    <div class ="w3-col m3 w3-center">
	        <label class="inp">
	            <input type="date" placeholder="&nbsp;" name = "awardDate" 
	            class="cInput" value = "${resume.awardList[0].awardDate}">
	            <span class="label">수상연도</span>
	            <span class="border"></span>
	        </label>
	    </div>
</div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m12 w3-center">
		<%-- <label class ="inp">
		<textarea placeholder="내용을 입력해주세요"  name="awardContent" rows="1"
		class= "eduContent" onkeydown="resize(this);" onkeyup="resize(this);">
			${resume.awardList[0].awardContent}
	    </textarea>
	    <span class="label" style ="margin-left: 4%;">수여내용</span>
	    </label> --%>
	     <div class="group">
			<textarea rows="5" name ="awardContent" onkeyup="resize(this);">${resume.awardList[0].awardContent}</textarea>
			<span class="bar"></span>
      		<label class = "textlabel">내용</label>
    	</div>
	</div>
</div>