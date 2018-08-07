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

    .filter-name{
        list-style: none;
        float: left;
        margin: 5px;
    }

    #list-group-li{
        list-style: none;
        margin: 0;
    }

    .list-summary-items-each{
        list-style: none;
        float: left;
    }
    
    .list-title-wrapper{
        float: left;
        width: 55%;
        margin-right: 10px;
    }

    .list-summary-wrapper{
        float: left;
        width: 20%
    }

    .list-summary-items{
        margin-top: 5px;
        
    }

    .sidenav {
	    width: 130px;
	    position: fixed;
	    z-index: 1;
	    top: 20px;
	    left: 10px;
	    background: #eee;
	    overflow-x: hidden;
	    margin-left: 15%;
	    margin-top: 10%;
	}

    #resume-nav{
        margin-bottom: 10px;
    }

    #resume-nav-button{
        padding-left: 20px;
        padding-right: 20px;
        letter-spacing: 1px;
    }

    .category-filter-search{
        width: 50%;
    }
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	
	<%-- <div class ="w3-amber w3-center" style ="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id} 님의 이력서 첨삭</h1>
	</div> --%>
	
	<c:import url="mypageBanner.jsp" charEncoding="UTF-8"/>
	
	<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; margin-bottom: 1%; margin-top: 1%;">
		<div class ="w3-col m2 w3-center tab_font w3-white">
  			<c:import url ="/WEB-INF/views/member/myPageMenu.jsp" charEncoding="UTF-8"/>
  			
		</div>
	
		<div class ="w3-col m9 w3-center tab_font2 w3-white" style ="margin-left:3%;">
			
		
        	<div  style="padding-left:2%;">
	           
	          <!-- 전체를 감싸는 div -->
    <div class="layout-container w3-row">
        <!-- 메인 부분을 감싸는 div -->
        <div id="list-article" class="content all-list" role="main">
            <!-- 머리통 + 검색창 + 버튼 -->
            <div id="resume-nav" class="w3-bar">
                
                <h4 style="margin-left: 50px; font-family: vitamin;" > 나의 이력서 첨삭</h4>
                
            </div>


            <!-- 게시판 view -->
            <c:if test="${!empty list}">
           	 	<div id="resume-edit">
           	 		<ul id="list-group" style="cursor: pointer;">
            			<c:forEach items="${list}" var="correction">

            			     <c:if test="${correction.correctionCommentCount gt 0}">      		                
			                    <li id="list-group-li" class="w3-panel w3-border w3-border-gray w3-leftbar" style="border-left-color: rgb(255,193,7) !important; font-family: penB;">
			                        <!-- title -->		             
			                        <div class="list-title-wrapper">
			                            <h5>
			                                <a id="${correction.correctionId}"  onclick="goView(id)" style="font-family: penB;">${correction.correctionTitle} </a>
			                            </h5>
			                        </div>
			                        <!-- 댓글 수 조회 수 확인 --> 
			                        <div class="list-summary-wrapper" >
			                            <div class="list-summary-items">
			                                <ul>
			                                    <li class="list-summary-items-each"><i class="fa fa-comment">&nbsp;</i>${correction.correctionCommentCount} &nbsp; &nbsp;</li>
			                                    <li class="list-summary-items-each"><i class="fa fa-eye">&nbsp;</i>${correction.correctionSee}</li>
			                                </ul>
			                            </div>
			                        </div>
			                        <!-- 작성자 및 작성일 확인 -->
			                        <div class="list-author-wrapper">
			                            <div class="list-author-specific">
			                                <span >${correction.correctionUserId}</span>  
			                            </div>
			                            <div class="list-date">
			                                <span>${fn:substring(correction.correctionDate,0,11)}</span>
			                            </div>
			                        </div>
			                    </li>	
			              </c:if>
			              <c:if test="${correction.correctionCommentCount le 0}">
			              		<li id="list-group-li" class="w3-panel w3-border w3-border-gray w3-leftbar" onclick="goView('${correction.correctionId}')"  style="font-family: penB;">
			                        <!-- title -->		             
			                        <div class="list-title-wrapper">
			                            <h5>
			                                <a id="${correction.correctionId}" style="font-family: penB;">${correction.correctionTitle} </a>
			                            </h5>
			                        </div>
			                        <!-- 댓글 수 조회 수 확인 --> 
			                        <div class="list-summary-wrapper" >
			                            <div class="list-summary-items">
			                                <ul>
			                                    <li class="list-summary-items-each"><i class="fa fa-comment">&nbsp;</i>${correction.correctionCommentCount} &nbsp; &nbsp;</li>
			                                    <li class="list-summary-items-each"><i class="fa fa-eye">&nbsp;</i>${correction.correctionSee}</li>
			                                </ul>
			                            </div>
			                        </div>
			                        <!-- 작성자 및 작성일 확인 -->
			                        <div class="list-author-wrapper">
			                            <div class="list-author-specific">
			                                <span >${correction.correctionUserId}</span>  
			                            </div>
			                            <div class="list-date">
			                                <span>${fn:substring(correction.correctionDate,0,11)}</span>
			                            </div>
			                        </div>
			                    </li>
			              </c:if>	                    	                   
            		</c:forEach>
            	</ul>
            </div>
            </c:if>
            <c:if test="${empty list}">
		            <div>
		            	검색 결과가 없습니다.
		            </div>
	        </c:if>
	            <!-- 페이지 바를 위한 정적 메소드 사용 -->
	           <% 
           		int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
           		int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
           		
           		
           		//기본  cPage는 1이다
           		//view에서 누르는 페이지를 저장
           		String cPageTemp = request.getParameter("cPage");
           		
           		int cPage = 1;
           		
           		try{
        			cPage = Integer.parseInt(cPageTemp);
        		} catch(NumberFormatException e){
        			
        		}
           
           %>
		        <%= com.kh.ccms.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "myCorr.do") %>       
        	</div>
      
	  	</div>
	</div>
	</div>
	</div>
	<div style ="height: 50px;"></div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	<script>
	
	
	//제목누름 VIEW로
	function goView(id) {
		location.href = '${pageContext.request.contextPath}/correction/correctionView.correct?no='+id;
	} 
	
	
	
	</script>
</body>
</html>