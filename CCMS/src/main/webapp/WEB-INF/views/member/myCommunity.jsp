<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<meta charset="UTF-8">
<title>My Resume</title>
</head>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
}
.tab_font2{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
}

.sub_menu_padding{
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}

.h3_font{
	font-family: whiteCloud;
	font-size: 1.2em;
}

.btn{
	font-size: 15px;
	
}
th{
	 vertical-align: middle !important;
	 font-size:13pt !important;
}

td{
 	vertical-align: middle !important;
	font-size:11pt !important;
}

.title{
	cursor:pointer;
	text-align:left;
	font-size:11pt;
}

#newResume{
	margin-left: 20%;
	margin-bottom:5%;
}
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	
	<%-- <div class ="w3-amber w3-center" style ="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id} 님의 자유 커뮤니티</h1>
	</div> --%>
	
	<c:import url="mypageBanner.jsp" charEncoding="UTF-8"/>
	
	<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class ="w3-col m2 w3-center tab_font w3-white">
  			<c:import url ="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8"/>
  			
		</div>
	
		<div class ="w3-col m9 w3-center tab_font2 w3-white" style ="margin-left:3%;">
			
		
        	<div class ="w3-col m10" style="padding-left:2%;">
	           
	            <div class="w3-col sub_menu_padding" style=" padding-bottom: 5%;">
	                <p>총 ${totalContents}건의 게시물이 있습니다.</p>
	                <table class="w3-table w3-bordered">
	                    <colgroup>
	                        <col width="9%">
	                        <col width>
	                        <col width="14%">
	                        <col width="14%">
	                        <col width="9%">
	                    </colgroup>
	                    <tr>
	                        <th scope="col" class="w3-center">번호</th>
	                        <th scope="col">제목</th>
	                        <th scope="col" class="w3-center">작성자</th>
	                        <th scope="col" class="w3-center">작성일</th>
	                        <th scope="col" class="w3-center">조회수</th>
	                    </tr>
	                    <c:forEach items="${list}" var="co">
	                    <tr id="${co.board_id}" style ="cursor: pointer;" class ="w3-hover-amber">
	                        <td class="w3-center">${co.board_id}</td>
	                        <td>${co.title}</td>
	                        <td class="w3-center">${co.writer}</td>
	                        <td class="w3-center">${co.writer_date}</td>
	                        <td class="w3-center">${co.see}</td>
	                    </tr>
	                    </c:forEach>
	                </table> 
	            </div>
	            <form action="${pageContext.request.contextPath}/member/communitySearch.do" method="get" onsubmit="return validate1();">
		            <div class="w3-row-padding" style="padding-left: 15%; padding-right: 15%; ">
		                <div class="w3-col m2">
		                	<select name="searchSelect" style="height: 40px; width: 80px;">
		                        <option value="TITLE">제목</option>
		                        <option value="WRITER">이름</option>
		                        <option value="CONTENT">내용</option>
		                    </select>
		                </div>
		                <div class="w3-col m7">
		                    <input class="w3-input w3-border w3-hover-border-red" name="searchComu" placeholder="게시글 찾기" type="text">
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
		        <%= com.kh.ccms.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "myComm.do") %>       
        	</div>
      
	  	</div>
	</div>
	<div style ="height: 50px;"></div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	<script>
	function fn_goComuForm(){
		   location.href = "${pageContext.request.contextPath}/community/communityForm.comu";
		}
		$(function(){
		   $("tr[id]").on("click",function(){
		      var board_id = $(this).attr("id");
		      location.href = "${pageContext.request.contextPath}/community/communityOneView.comu?no="+board_id;
		   });
		});

	
		function validate1(){
			var content = $("[name=searchComu]").val();
			if(content.trim().length==0){
				alert("내용을 입력하세요");
			    return false;
			}
			return true;
		}
	</script>
</body>
</html>