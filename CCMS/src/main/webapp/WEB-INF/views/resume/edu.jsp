<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* 	textarea {
	width:90%;
	overflow:hidden;
	background-color:#FFF;
	color:#222;
	font-family:penB;
	font-weight:normal;
	font-size:24px;
	resize:none;
	line-height:40px;
	padding-left:100px;
	padding-right:100px;
	padding-top:45px;
	padding-bottom:34px;
	background-image:url(${pageContext.request.contextPath}/resources/images/common/lines.png), 
	url(${pageContext.request.contextPath}/resources/images/common/paper.png);
	background-repeat:repeat-y, repeat;
	border-top:1px solid #FFF;
	border-bottom:1px solid #FFF;
	outline: none;
} */


</style>

<div class = "w3-row" style="margin-top: 30px; font-family: penB;">
	<div class ="w3-col m4 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "educationTitle" 
	           class="cInput" value = "${resume.academyList[0].educationTitle}">
	           <span class="label">교육명</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m4 w3-center">
		<label class="inp">
	           <input type="text" placeholder="&nbsp;" name = "academyName" 
	           class="cInput" value = "${resume.academyList[0].academyName}">
	           <span class="label">교육기관</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m2 w3-center">
		<label class="inp">
	           <input type="date" placeholder="&nbsp;" name = "startDate" 
	           class="cInput" value ="${resume.academyList[0].startDate}">
	           <span class="label">시작년월</span>
	           <span class="border"></span>
	    </label>
	</div>
	
	<div class ="w3-col m2 w3-center">
		<label class="inp">
	           <input type="date" placeholder="&nbsp;" name = "endDate" 
	           class="cInput" value = "${resume.academyList[0].endDate}">
	           <span class="label">종료년일</span>
	           <span class="border"></span>
	    </label>
	</div>
</div>

<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
	<div class ="w3-col m12 w3-center">
		<%-- <label class ="inp">
		<textarea placeholder="내용을 입력해주세요"  name="content" rows="1"
		class= "eduContent" onkeydown="resize(this);" onkeyup="resize(this);">
			${resume.academyList[0].content}
	    </textarea>
	    <span class="label" style ="margin-left: 5%;">내용</span> 
	    </label>--%>
	    <div class="group">
			<textarea rows="5" name ="content" onkeyup="resize(this);">${resume.academyList[0].content}</textarea>
			<span class="bar"></span>
      		<label class = "textlabel">내용</label>
    	</div>
	</div>
</div>

<script>
function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
}

</script>