<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<div class = 'w3-row inBoxUp'>
	<div class ='w3-col m8 w3-center'>
		 <label class='inp'>
	            <input type='text'  placeholder='&nbsp;' name = 'introdTitle' 
	            class='cInput' value ="${resume.introductionList[0].title}">
	            <span class='label'>주제</span>
	            <span class='border'></span>
	     </label>
	</div>
</div>

<div class = 'w3-row inBoxDown'>
	<div class ='w3-col m12 w3-center'>
		<%-- <label class ='inp'>
		<textarea placeholder='내용을 입력해주세요'  name='introdContent' rows='1'
		class= 'eduContent' onkeydown='resize(this);' onkeyup='resize(this);'>${resume.introductionList[0].content}</textarea>
	    <span class='label' style ='margin-left: 5%;'>내용</span></label> --%>
	    
	    <div class="group">
			<textarea rows="5" name ="introdContent" onkeyup="resize(this);">${resume.introductionList[0].content}</textarea>
			<span class="bar"></span>
      		<label class = "textlabel">내용</label>
    	</div>
	</div>
</div>
