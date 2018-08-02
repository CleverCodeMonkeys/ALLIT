<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script>
function fn_goComuForm(){
   location.href = "${pageContext.request.contextPath}/skill/skillForm.ski";
}
$(function(){
   $("tr[id]").on("click",function(){
      var board_id = $(this).attr("id");
      location.href = "${pageContext.request.contextPath}/skill/skillOneView.ski?no="+board_id;
   });
});

function freeboard(){
	location.href="${pageContext.request.contextPath}/community/community.comu";	
}

function skillboard(){
	location.href="${pageContext.request.contextPath}/skill/skill.ski";
}

function validate1(){
	var content = $("[name=searchSki]").val();
	if(content.trim().length==0){
		alert("내용을 입력하세요");
	    return false;
	}
	return true;
}
</script>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.1em;
	padding-top: auto;
}

.j_title_font{
	font-family: vitamin;
	font-size: 1.7em;
	padding-top: auto;
	color: blue;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class="w3-container" style="padding-left: 15%; padding-right: 15%; padding-top: 4%;">
        <div class="w3-row">
        	<div class ="w3-col m2 w3-center w3-white tab_font">
        		<div class="w3-col">
	        		<button class="w3-button w3-white" type="button" onclick="freeboard();">자유게시판</button><br /><br />
	        		<button class="w3-button w3-white" type="button" onclick="skillboard();">기술게시판</button>
        		</div>
        	</div>
        	<!-- M 10 -->
        	<div class ="w3-col m10" style="padding-left:2%; border-left: 5px solid orange;">
        		<div class="w3-row">
        			<div class="w3-col s6 w3-left j_title_font"><p>기술게시판</p></div>
        			<div class="w3-col s6 w3-right"><button class="w3-button w3-purple w3-right" type="button" onclick="fn_goComuForm()">글쓰기</button></div>
        		</div>
	            <div class="w3-col sub_menu_padding" style="padding-top: 2%; padding-bottom: 5%;">
	                <p>총 ${totalContents}건의 게시물이 있습니다.</p>
	                <table class="w3-table w3-bordered">
	                    <colgroup>
	                        <col width="7%">
	                        <col width="3">
	                        <col width>
	                        <col width="14%">
	                        <col width="14%">
	                        <col width="9%">
	                    </colgroup>
	                    <tr>
	                        <th scope="col" class="w3-center">번호</th>
	                        <th scope="col" class="w3-center">Type</th>
	                        <th scope="col">제목</th>
	                        <th scope="col" class="w3-center">작성자</th>
	                        <th scope="col" class="w3-center">작성일</th>
	                        <th scope="col" class="w3-center">조회수</th>
	                    </tr>
	                    <c:forEach items="${list}" var="ko">
	                    <tr id="${ko.board_id}">
	                        <td class="w3-center">${ko.board_id}</td>
	                        <td class="w3-center">${ko.type}</td>
	                        <td>${ko.title}</td>
	                        <td class="w3-center">${ko.writer}</td>
	                        <td class="w3-center">${ko.writer_date}</td>
	                        <td class="w3-center">${ko.see}</td>
	                    </tr>
	                    </c:forEach>
	                </table> 
	            </div>
	            <form action="${pageContext.request.contextPath}/skill/skillSearch.ski" method="get" onsubmit="return validate1();">
		            <div class="w3-row-padding" style="padding-left: 15%; padding-right: 15%; padding-bottom: 5%;">
		                <div class="w3-col m2">
		                	<select name="searchSelect" style="height: 40px; width: 80px;">
		                        <option value="TITLE">제목</option>
		                        <option value="TYPE">TYPE</option>
		                        <option value="WRITER">이름</option>
		                        <option value="CONTENT">내용</option>
		                    </select>
		                </div>
		                <div class="w3-col m7">
		                    <input class="w3-input w3-border w3-hover-border-red" name="searchSki" placeholder="게시글 찾기" type="text">
		                </div>
		                <div class="w3-col m3">
		                    <button class="w3-button w3-red" type="submit" style="width: 100%">찾기</button>
		                </div>
		            </div>
	            </form>
	            <!-- 페이지 바를 위한 정적 메소드 사용 -->
	            <%
	            	int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
	            	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	            	
	            	String cPageTemp = request.getParameter("cPage");
	            	
	                int cPage = 1;
	                try{
	                   cPage = Integer.parseInt(cPageTemp);
	                } catch(NumberFormatException e){
	                   
	                }
	            %>
		        <%= com.kh.ccms.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "skill.ski") %>       
        	</div>
        </div>
    </div>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>