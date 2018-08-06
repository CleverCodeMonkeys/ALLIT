<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>My Scrab</title>
</head>
<style>

.content2 {
	font-family: penB;
}

ul {
    padding: 0;
    margin: 0;
}
li {
    list-style: none;
}

.wrap {
    /* background-color: #eee; */
    padding: 0 10% 5% 10%;
}

.side_nav, .content {
    height: auto;
}

.navigation {
    background-color: white;
    /* border: 1px solid #ddd; */
    padding: 0 20px;
}
.navigation ul li {
    margin: 25px 0;
}
.navigation ul li a {
    text-decoration: none;
    font-size: 1.3em;
    font-family: vitamin;
}
.navigation ul li a:hover {
    color: royalblue;
}

.content {
    background-color: white;
    float: right;
    border-left: 3px solid black;
    padding: 0 50px 50px 100px;
}

.search_area div {
    border: 1px solid black;
}
.search_area div input {
    outline: none;
}

/*         .filter_area {
            margin-top: 30px;
        } */
.filter_header div, .filter_content div {
    border: 1px solid #ddd;
}
.filter_header div {
    padding: 10px 10px;
    background-color: #ffbf00;
    font-size: 1.1em;
    font-family: vitamin;
}
.filter_content div {
    height: 250px;
    padding: 10px 0;
    overflow-y: auto;
}

/* width */
.filter_content div::-webkit-scrollbar {
    width: 10px;
}

/* Track */
.filter_content div::-webkit-scrollbar-track {
    background: #f1f1f1; 
}

/* Handle */
.filter_content div::-webkit-scrollbar-thumb {
    background: #777; 
}

/* Handle on hover */
.filter_content div::-webkit-scrollbar-thumb:hover {
    background: #555; 
}

.filter_content ul li {
    list-style: none;
    font-size: 0.9em;
    padding: 8px 20px;
}
.filter_content ul li:hover {
    /* color: royalblue; */
    /* font-weight: bold; */
    background: #eee;
}
.filter_content ul li:hover {
    cursor: pointer;
}
#age_area, #gender_area {
    border: none;
    padding: 0;
}
#age_area {
    height: 170px;
}
#gender_area {
    height: 45px;
    border-top: 1px solid #eee;
    padding-top: 10px;
    margin: 10px 8px 0 8px;
    font-size: .9em;
    line-height: 33px;
    text-align: center;
}
#gender_area ul li {
    display: inline;
    padding: 0;
    font-size: .9em;
}

.filter_condition {
    border: 1px solid #ddd;
    height: auto;
    padding: 10px;
}

.condition {
    font-size: .9em;
    padding: 0 10px;
    cursor: pointer;
    display: inline-block;
}

.list_area {
    margin-top: 30px;
}
.list_search_area {
    padding-bottom: 10px;
    border-bottom: 1px solid black;
}
.list_search_area h3 {
    display: inline;
}
.list_search_area h3 span {
    color: dodgerblue;
    font-weight: bold;
}
.list_search_area_right {
    float: right;
}
.list_search_area_right div:first-child {
    text-align: right;
}
.list_search_area_right div select {
    height: 30px;
}
.list_search_area_right div input {
    height: 30px;
}
.list_search_area_right div button {
    height: 30px;
    line-height: 14px;
}

.list_order_area {
    padding: 20px 0;
}
.list_order_area span {
    cursor: pointer;
    font-size: .9em;
}

.list_content {
}

.list_table {
    border-top: 1px solid #555;
}
.list_table thead th {
    text-align: center;
}
.list_table_tr td {
    padding-top: 20px;
}
.list_table_tr:hover {
    background-color: #eee;
}
.user_info div div img {
    cursor: pointer;
}
.user_info div div p {
    margin: 0;
}
.user_info_name {
    font-size: 1.0em;
}
.user_info_detail {
    font-size: .8em;
    color: #555;
}
.resume_view div p {
    margin: 0 0 10px 0;
}
.resume_view_title {
    font-weight: bold;
    cursor: pointer;
    display: inline-block;
    font-size: 1.1em;
}
.resume_view_detail {
    font-size: .9em;
    color: #333;
}
.resume_badge {
    border: 1px solid salmon;
    color: salmon;
    padding: 2px;
    font-size: .9em;
    border-radius: 15px;
}
.resume_date {
    font-size: .9em;
    color: #555;
    text-align: center;
    line-height: 123px;
}

.top_arrow {
    cursor: pointer;
    position: fixed;
    bottom: 10%;
    right: 10%;
    border: 1px solid black;
    padding: 5px;
    opacity: .6;
}

#registOrder {
	color: royalblue;
	font-weight: bold;
}

.selectedItem {
	color: royalblue;
	font-weight: bold;
}

th {
	font-family: vitamin;
	font-size: 1.1em;	
}
.gender li {
	font-size: 1.0em !important;
}





.tab_font {
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
}

.tab_font2 {
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
}

.sub_menu_padding {
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8" />
	<div class="w3-white" style="height: 100px;"></div>
	<!-- Spare Space -->

	<div class="w3-amber w3-center"
		style="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id}님의 스크랩 인재</h1>
	</div>

	<div class="w3-row"
		style="padding-left: 15%; padding-right: 15%; margin-bottom: 0.7%; margin-top: 0.7%;">
		<div class="w3-col m2 w3-center tab_font w3-white">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp"
				charEncoding="UTF-8" />

		</div>

		<div class="w3-col m9 w3-center tab_font2 w3-white">



			<div class="wrap" id="wrap">
				<div class="w3-row">

					<div class="w3-col content2" style="width:120%;">

						<!-- 리스트 -->
						<div class="list_area">
							<div class="list_header">
								<div class="list_search_area w3-row">
									<div class="w3-col m2"></div>
									<div class="w3-col m5"></div>
									<div class="list_search_area_right w3-col m5 w3-row"
										style="float: right;">
										<div class="w3-col m3"></div>
										<div class="w3-col m7"></div>
										<div class="w3-col m2"></div>
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
															<input type="hidden" value="${rc.rId}" /> <img
																class="scrab_btn"
																src="${pageContext.request.contextPath}/resources/common/image/star_selected.png">
														</div>
														<div class="w3-col m10">
															<p class="user_info_name">${rc.name}</p>
															<p class="user_info_detail">(${rc.gender} |
																${rc.birthyear}년, ${rc.age}세)</p>
														</div>
													</div>
												</td>
												<td class="resume_view"
													style="width: 65%; padding-top: 20px;">
													<div>
														<p class="resume_view_title">${rc.title}</p>
														<p class="resume_view_detail">${rc.last_edu}</p>
														<p class="resume_view_detail">${rc.location}|
															${rc.salary} 만원</p>
														<p class="resume_view_detail">${rc.job}</p>
														<p class="resume_view_detail">
															<c:forTokens var="lang" items="${rc.language}" delims=",">
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
			</div>

		</div>
		<a class="top_arrow" href="#"><img
			src="${pageContext.request.contextPath}/resources/common/image/up-arrow.png"></a>
	</div>
	<div style="height: 50px;"></div>

	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />
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
		
		$('.content2').append($pageBarNode);
    	
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
	
	$('.top_arrow').on('click', function() {
		
		$( 'html, body' ).animate( { scrollTop : 0 }, 200 );
		return false;
		
	});
	
	</script>
</body>
</html>