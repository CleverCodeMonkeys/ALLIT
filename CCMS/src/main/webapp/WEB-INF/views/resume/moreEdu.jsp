<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same edu.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="eduItem" items="${resume.academyList}" begin="1">    
	<div id ='eduIndexZ${eduItem.academyId}'>
		<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 type ='button' onclick='removeBtn(name)'  name='eduIndexZ${eduItem.academyId}'>삭제</button></div>
	 	<div class = 'w3-container w3-white boxForm'>
	 		<div class = "w3-row" style="margin-top: 30px; font-family: penB;">
				<div class ="w3-col m4 w3-center">
					<label class="inp">
				           <input type="text" placeholder="&nbsp;" name = "educationTitle" 
				           class="cInput" value = "${eduItem.educationTitle}">
				           <span class="label">교육명</span>
				           <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m4 w3-center">
					<label class="inp">
				           <input type="text" placeholder="&nbsp;" name = "academyName" 
				           class="cInput" value = "${eduItem.academyName}">
				           <span class="label">교육기관</span>
				           <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m2 w3-center">
					<label class="inp">
				           <input type="date" placeholder="&nbsp;" name = "startDate" 
				           class="cInput" value ="${eduItem.startDate}">
				           <span class="label">시작년월</span>
				           <span class="border"></span>
				    </label>
				</div>
				
				<div class ="w3-col m2 w3-center">
					<label class="inp">
				           <input type="date" placeholder="&nbsp;" name = "endDate" 
				           class="cInput" value = "${eduItem.endDate}">
				           <span class="label">종료년일</span>
				           <span class="border"></span>
				    </label>
				</div>
			</div>
			
			<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
				<div class ="w3-col m12 w3-center">
					<%-- <label class ="inp">
					<textarea placeholder="내용을 입력해주세요"  name="content" rows="1"
					class= "eduContent" onkeydown="resize(this);" onkeyup="resize(this);">${eduItem.content}</textarea>
				    <span class="label" style ="margin-left: 5%;">내용</span>
				    </label> --%>
				    <div class="group">
						<textarea rows="5" name ="content" onkeyup="resize(this);">${eduItem.content}</textarea>
						<span class="bar"></span>
      					<label class = "textlabel">내용</label>
    				</div>
				</div>
			</div>
	 	</div>	 
	</div>
</c:forEach>