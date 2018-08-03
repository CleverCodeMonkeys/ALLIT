<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Correction</title>
</head>
<style>
    .layout-container{
        margin-left: 25%;
        margin-right: 25%;
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
        width: 40%;
        margin-right: 10px;
    }

    .list-summary-wrapper{
        float: left;
        width: 30%
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
	

	<!-- 전체를 감싸는 div -->
    <div class="layout-container w3-row">
        <!-- 메인 부분을 감싸는 div -->
        <div id="list-article" class="content all-list w3-col m10" role="main">
            <!-- 머리통 + 검색창 + 버튼 -->
            <div id="resume-nav" class="w3-bar">
                <a href="/ccms/correction/correctionWrite.correct" id="resume-nav-button" class="btn btn-success btn-wide pull-right" style="font-family: vitamin;"><i class="fa fa-pencil"></i>새 글 쓰기</a>
                <h4 style="margin-left: 50px; font-family: vitamin;" > 이력서 첨삭</h4>
                <form action="#" name="category-filter" id="category-filter-form">
                    <div class="category-filter-wrapper w3-row">
                        <ul class="filter-list pull-left" style="cursor: pointer;">                        	
	                            <li class="filter-name">
	                                <a onclick="reNew('dateSort')" id="dateSort" style="font-family: penB;" class="filter-list-link active">최신순</a>
	                            </li>
	
	                            <li class="filter-name">
	                                <a onclick="reNew('commentSort')" id="commentSort" style="font-family: penB;" class="filter-list-link">댓글순</a>
	                            </li >
	
	                            <li class="filter-name">
	                                <a onclick="reNew('seeSort')" id="seeSort" style="font-family: penB;" class="filter-list-link">조회순</a>
	                            </li>
                        </ul>  
                         <div class="category-filter-search pull-right" >                              	 	 
                            <div class="input-group input-group-sm">
                              	
                                <input type="text" maxlength="30" width="200px" name="search" id="search" class="form-control pull-right" onkeydown="JavaScript:enterCheck();" placeholder="검색어 30자 제한" value="${search}">
                                
                                <span class="input-group-btn">
                                    <button type="button" id="searchFiled" onclick="searchGo();" class="btn btn-default pull-right"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </div> 
                        <div class ="form-group pull-right"> 	
                        	<div class="select-group select-group-sm">
                            	<select id="searchKinds" class="form-control" style="height: 30px; font-size: 12px;">
                                	<option value="title">제목</option>
                                	<option value="name">아이디</option>
                            	</select>       
                            </div>                     	
                        </div>                    
                    </div>
                </form>
            </div>


            <!-- 게시판 view -->
            <c:if test="${!empty list}">
           	 	<div id="resume-edit">
           	 		<ul id="list-group" style="cursor: pointer;" >
            			<c:forEach items="${list}" var="correction">
							 
            			     <c:if test="${correction.correctionCommentCount gt 0}">
            			           		                
			                    <li onclick="goView('${correction.correctionId}')" id="list-group-li" class="w3-panel w3-border w3-border-gray w3-leftbar" style="border-left-color: #71A4D9 !important; font-family: penB;">
			           					
			                        <!-- title -->		             
			                        <div class="list-title-wrapper">
			                            <h5>
			                                <a style="font-family: penB;">${correction.correctionTitle} </a>
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
			                        <div class="list-author-wrapper" style="display: inline;">
			                            <div class="list-author-specific" style="display: inline;">
			                                <span >${correction.correctionUserId}</span>  
			                            </div>
			                            &nbsp;&nbsp;
			                            <div class="list-date" style="display: inline;"> 
			                                <span>${fn:substring(correction.correctionDate,0,11)}</span>
			                            </div>
			                        </div>
			                    </li>	
			              </c:if>
			              <c:if test="${correction.correctionCommentCount le 0}">
			              		<li onclick="goView('${correction.correctionId}')"  id="list-group-li" class="w3-panel w3-border w3-border-gray w3-leftbar" style="font-family: penB;">
			              		
			                        <!-- title -->		             
			                        <div class="list-title-wrapper">
			                            <h5>
			                                <a style="font-family: penB;">${correction.correctionTitle} </a>
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
			                            <div class="list-author-specific" style="display: inline;">
			                                <span >${correction.correctionUserId}</span>  
			                            </div>
			                            &nbsp;&nbsp;
			                            <div class="list-date" style="display: inline;">
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
            <!-- 페이징 올 자리  pageUtil을 사용-->          
           <% 
           		int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
           		int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
           		
           		String sortValue = String.valueOf(request.getAttribute("sort"));
           		String search = String.valueOf(request.getAttribute("search"));
           		
           		//기본  cPage는 1이다
           		//view에서 누르는 페이지를 저장
           		String cPageTemp = request.getParameter("cPage");
           		
           		int cPage = 1;
           		
           		try{
        			cPage = Integer.parseInt(cPageTemp);
        		} catch(NumberFormatException e){
        			
        		}
           
           %>
            
           <div class="text-center">
           
           <%= com.kh.ccms.correction.pageUtil.Paging.getPageBar(totalContents, cPage, numPerPage, "correction.correct", sortValue, search) %>
           </div>
        </div>
    </div>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	<script>

	$(function(){
		var sortOpt = '${sort}';
		var kindsOpt = '${kinds}';
		
		//정렬
		if(sortOpt == 'dateSort' || sortOpt == ""){
			$('#dateSort').css("color", "#E31D2E");
		} else if(sortOpt == 'commentSort'){
			$('#commentSort').css("color", "#E31D2E");
		} else if(sortOpt == 'seeSort'){
			$('#seeSort').css("color", "#E31D2E");
		} 
		
		//검색 기준 
		if(kindsOpt == 'name') $("select option[value='name']").attr("selected", true);
		
	});
	
	//제목누름 VIEW로
	function goView(id) {
		console.log(id);
		location.href = '${pageContext.request.contextPath}/correction/correctionView.correct?no='+id;
	} 
	
	//글 정렬하기 
	function reNew(value){
		var sort =value;
	
		location.href = '${pageContext.request.contextPath}/correction/correction.correct?sort='+sort;

	}
	
	//글 검색 input enter체크
	function enterCheck(){
		if(event.keyCode == 13){
			searchGo();		
			return false;
		}
		return false;
	}
	
	//글 검색
	function searchGo(){
		var value = $('#search').val();
		var sortOpt = '${sort}';
		var searchKinds = $('#searchKinds option:selected').val();
		
		
		value = value.trim();
		
		
		if(value.length == 0 || value == null) {
			alert("공백은 검색이 불가능합니다.");
			$('#search').val("");
			
			return false;
		}
		else {
			
			/* location.href = '${pageContext.request.contextPath}/correction/correction.correct?sort='+sortOpt+'&search='+value; */
			 $.ajax({
				url : '${pageContext.request.contextPath}/correction/correction.correct',
				type : "GET",
				data : {
					sort : sortOpt,
					search : value,
					kinds : searchKinds
				},
				
				success : function(data){
					alert("검색성공");
					location.href = '${pageContext.request.contextPath}/correction/correction.correct?sort='+sortOpt+'&search='+value+'&serachKinds='+searchKinds;
				},
					error : function(){
					alert("에러발생");
					location.reload();
				}
	
			}); 
		}
	}
	
	
	</script>
</body>
</html>