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

<link rel="stylesheet" href ="${pageContext.request.contextPath}/resources/common/css/recruitStyle.css"/>

<meta charset="UTF-8">

<title>Recruit</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;" id="top"></div> <!-- Spare Space -->
	
    <div class="wrap" id="wrap">
        <div class="w3-row">
            <div class="w3-col side_nav" style="width: 10%; margin-right: 10px;">
                <div class="w3-col navigation">
                    <ul>
                        <li><a href="recruit.rc">인재검색</a></li>
                        <li><a href="scrabList.rc" style="color: royalblue;">인재관리</a></li>
                    </ul>
                </div>
            </div>
            <div class="w3-col content" style="width: 84%">

                <!-- 리스트 -->
                <div class="list_area">
                    <div class="list_header">
                        <div class="list_search_area w3-row">
                            <div class="w3-col m2">
                            </div>
                            <div class="w3-col m5"></div>
                             <div class="list_search_area_right w3-col m5 w3-row" style="float: right;">
                                <div class="w3-col m3">
                                </div>
                                <div class="w3-col m7">
                                </div>
                                <div class="w3-col m2">
                                </div>
                            </div> 
                        </div>
                    </div>
                    
                    <!-- 실제 리스트 시작 -->
                    <div class="list_content">
                        <table class="w3-table w3-bordered list_table">
                            <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>이력서 요약</th>
                                    <th id="orderDate">등록일</th>
                                </tr>
                            </thead>
                            <tbody id="list_tbody">
                            	<c:forEach items="${list}" var="rc">
                                <tr class="list_table_tr">
                                    <td class="user_info" style="width: 22%; padding-top: 20px;">
                                        <div class="w3-row">
                                            <div class="w3-col m2">
                                            	<input type="hidden" value="${rc.rId}" />
                                            		<img class="scrab_btn" src="${pageContext.request.contextPath}/resources/common/image/star_selected.png">
                                            </div>
                                            <div class="w3-col m10">
                                                <p class="user_info_name">${rc.name}</p>
                                                <p class="user_info_detail">(${rc.gender} | ${rc.birthyear}년, ${rc.age}세)</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="resume_view" style="width: 65%; padding-top: 20px;">
                                        <div>
                                            <p class="resume_view_title">
                                                 ${rc.title}
                                            </p>
                                            <p class="resume_view_detail">${rc.last_edu}</p>
                                            <p class="resume_view_detail">${rc.location} | ${rc.salary} 만원</p>
                                            <p class="resume_view_detail">${rc.job}</p>
                                            <p class="resume_view_detail">
                                            	<c:forTokens var="lang" items="${rc.language}" delims="," >
													<span>${lang}</span> 
												</c:forTokens>
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="resume_date">${rc.regist_date}</p>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

        <a href="#top"><img class="top_arrow" src="${pageContext.request.contextPath}/resources/common/image/up-arrow.png"></a>

    </div>

    <script>

    	var cPage = '${cPage}';
    
    	$(function() {
    		
    		getPageBar('${totalContents}', cPage, '${numPerPage}', "/recruit/scrabList.rc");
			
    		scrabBtnListner();
    		gotoResumeView();

		});
        
        function scrabBtnListner() {
			
            $('.scrab_btn').on('click', function() {
            	
            	var id = '${m.id}';
            	var rId = $(this).siblings('input').val();
	            		
           		$.ajax({
           			
           			url : '${pageContext.request.contextPath}/recruit/deleteScrab.rc',
           			data : {
           				"rId" : rId,
           			},
           			type : "POST",
           			success : function(data) {
						
           				if(data.result == 1) {
           					alert('스크랩 해제 되었습니다.');
           				} else {
           					alert('스크랩 해제를 실패 했습니다.');
           				}
           				
					} ,
           			error : function(data) {
						console.log(data);
					}
           			
           		});
           		
           		$(this).parent().parent().parent().parent().remove();

    		});
        	
		}
        
        // 페이지바 만들기...
        function getPageBar(totalContents, cPage, numPerPage, url) {
			
        	var $pageBarNode = $('<div>');
    		var pageBar = "";
    		var pageBarSize = 5;
    		
    		//총페이지수 구하기
    		var totalPage = Math.ceil(totalContents/numPerPage);
    		
    		//1.pageBar작성
    		//pageBar순회용변수 
    		var pageNo = (Math.floor((cPage - 1)/pageBarSize)) * pageBarSize +1;
    		//종료페이지 번호 세팅
    		var pageEnd = pageNo+pageBarSize-1;
    		//System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
    		
    		pageBar += "<div class='w3-center' style='margin-top:30px;'><div class='w3-bar w3-border'>";
    		//[이전]section
    		if(pageNo == 1 ){
    			pageBar += "<a href='javascript:returnFalse2()' class='w3-bar-item w3-button' style='pointer-events: none; color: #bbb;'>&laquo;</a>";
    		}
    		else {
    			pageBar += "<a href='javascript:fn_paging2("+(pageNo-1)+")' class='w3-bar-item w3-button'>&laquo;</a>";
    		}
    		
    		// pageNo section
    		while(!(pageNo>pageEnd || pageNo > totalPage)){
    			if(cPage == pageNo ){
    				pageBar += "<a class='w3-button' style='pointer-events: none; color: #bbb;'>"+pageNo+"</a>";
    			} 
    			else {
    				pageBar += "<a href='javascript:fn_paging2("+pageNo+")' class='w3-button'>"+pageNo+"</a>";
    			}
    			pageNo++;
    		}
    		
    		//[다음] section
    		if(pageNo > totalPage){
    			pageBar += "<a href='javascript:returnFalse2()' class='w3-button' style='pointer-events: none; color: #bbb;'>&raquo;</a>";
    			
    		} else {
    			pageBar += "<a href='javascript:fn_paging2("+pageNo+")' class='w3-button'>&raquo;</a>";
    		}
    		
    		pageBar += "</div></div>";
    		
    		$pageBarNode.html(pageBar);
    		
    		$pageBarNode.addClass('w3-center pageBar');
    		
    		$('.content').append($pageBarNode);
        	
		}
        
        function fn_paging2(cPage, numPerPage) {
        	
        	location.href='filterRecruitListPage.rc?cPage='+cPage;
        	
		}
        
        function returnFalse2() {
			return false;
		}
        
		function gotoResumeView() {
			
			$('.resume_view_title').on('click', function() {
				
				var rId = $(this).parent().parent().siblings('.user_info').children('.w3-row').children('.m2').children('input').val();
				
				location.href = "${pageContext.request.contextPath}/resume/resumeView.resume?resumeId="+rId;
				
			});
			
		}
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>

















