<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- if have More List.. --> 
<!-- [WARNNING] This Code isn't Good Code -->
<!-- if you customize this code, Should Change also VO Factory Model [resume/model/makeBoxHTML/] -->
<!-- Same award.jsp , But add Cancel Button and Need to Unique ID then Control Index State -->

<c:forEach var ="awardItem" items="${resume.awardList}" begin="1"> 
	<div id ='awardIndexZ${awardItem.awardId}'>
		<div class ='w3-row'><button class ='w3-btn fontC w3-pink w3-right' 
	 	type ='button' onclick='removeBtn(name)'  name='awardIndexZ${awardItem.awardId}'>삭제</button></div>
		 <div class = 'w3-container w3-white boxForm'>
		 	<div class = "w3-row" style="margin-top: 30px; font-family: penB;">
				<div class ="w3-col m6 w3-center">
				        <label class="inp">
				            <input type="text"  placeholder="&nbsp;" name = "awardTitle" 
				            class="cInput" value ="${awardItem.awardTitle}">
				            <span class="label">수상명</span>
				            <span class="border"></span>
				        </label>
				    </div>
				    
				    <div class ="w3-col m3 w3-center">
				        <label class="inp">
				            <input type="text" placeholder="&nbsp;" name = "awardOrgan" 
				            class="cInput" value = "${awardItem.awardOrganization}">
				            <span class="label">수여기관</span>
				            <span class="border"></span>
				        </label>
				    </div>
				    
				    <div class ="w3-col m3 w3-center">
				        <label class="inp">
				            <input type="date" placeholder="&nbsp;" name = "awardDate" 
				            class="cInput" value = "${awardItem.awardDate}">
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
						${awardItem.awardContent}
				    </textarea>
				    <span class="label" style ="margin-left: 4%;">수여내용</span>
				    </label> --%>
				    <div class="group">
						<textarea rows="5" name ="awardContent" onkeyup="resize(this);">${awardItem.awardContent}</textarea>
						<span class="bar"></span>
      					<label class = "textlabel">내용</label>
    				</div>
				</div>
			</div>
		 </div>
	</div>
</c:forEach>