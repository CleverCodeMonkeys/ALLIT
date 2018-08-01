<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same port.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="portItem" items="${resume.portpolioList}" begin="1">
   <div id ='portIndexZ${portItem.portId}'>
   		<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 	type ='button' onclick='removeBtn(name)'  name='portIndexZ${certLangItem.langId}'>삭제</button></div>
	 	<div class = 'w3-container w3-white boxForm'>
	 		<div class = "w3-row" style="margin-top: 30px; font-family: penB; padding-bottom: 5%;">
				<div class ='w3-col m12 w3-center'>
					<label class='inp'>
						<input type='text' placeholder='&nbsp;' name = 'url' class='cInput' value="${portItem.url}">
						<span class='label'>URL[주소입력]</span>
						<span class='border'></span>
					</label>
				</div>
			</div>
	 	</div>
   </div>
</c:forEach>