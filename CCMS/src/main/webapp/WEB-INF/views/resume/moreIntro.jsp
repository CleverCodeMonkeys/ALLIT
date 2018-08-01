<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same Introd.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->
   
<c:forEach var ="introItem" items="${resume.introductionList}" begin="1">      
	<div id ='introIndexZ${introItem.introId}'>
	 <div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 type ='button' onclick='removeBtn(name)'  name='introIndexZ${introItem.introId}'>삭제</button></div>
	 
	 <div class = 'w3-container w3-white boxForm'>
	 <div class = 'w3-row inBoxUp'>
		<div class ='w3-col m8 w3-center'>
			 <label class='inp'>
		            <input type='text'  placeholder='&nbsp;' name = 'introdTitle' 
		            class='cInput' value ="${introItem.title}">
		            <span class='label'>주제</span>
		            <span class='border'></span>
		     </label>
		</div>
	</div>
	
	<div class = 'w3-row inBoxDown'>
		<div class ='w3-col m12 w3-center'>
			<%-- <label class ='inp'>
			<textarea placeholder='내용을 입력해주세요'  name='introdContent' rows='1'
			class= 'eduContent' onkeydown='resize(this);' onkeyup='resize(this);'>${introItem.content}</textarea>
		    <span class='label' style ='margin-left: 5%;'>내용</span></label> --%>
		    <div class="group">
				<textarea rows="5" name ="introdContent" onkeyup="resize(this);">${introItem.content}</textarea>
				<span class="bar"></span>
      			<label class = "textlabel">내용</label>
    		</div>
		</div>
	</div>
	 </div>
	</div>
</c:forEach>
