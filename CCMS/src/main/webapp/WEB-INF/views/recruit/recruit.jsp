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
	<div class ="w3-light-grey" style ="height:100px;"></div> <!-- Spare Space -->
	
    <div class="wrap" id="wrap">
        <div class="w3-row">
            <div class="w3-col side_nav" style="width: 14%; margin-right: 10px;">
                <div class="w3-col navigation">
                    <ul>
                        <li><a href="">인재검색</a></li>
                        <li><a href="">인재관리</a></li>
                    </ul>
                </div>
            </div>
            <div class="w3-col content" style="width: 84%">

                <!-- 필터 -->
                <div class="filter_area">
                    <div class="first_floor">
                        <div class="w3-row filter_header">
                            <div class="w3-col m2">직무</div>
                            <div class="w3-col m2">언어</div>
                            <div class="w3-col m2">희망연봉</div>
                            <div class="w3-col m2">희망근무지역</div>
                            <div class="w3-col m2">학력</div>
                            <div class="w3-col m2">나이/성별</div>
                        </div>
                        <div class="w3-row filter_content">
                            <div class="w3-col m2">
                                <ul class="job">
                                <c:set var="jobList" scope="page" >
									웹프로그래머,응용프로그래머,시스템프로그래머,DBA·데이터베이스,네트워크·서버·보안,웹기획·PM,웹마케팅,컨텐츠·사이트운영,HTML·퍼블리싱·UI개발,웹디자인,QA·테스터·검증,게임,ERP·시스템분석·설계,IT·디자인·컴퓨터강사,동영상제작·편집,빅데이터·AI(인공지능),소프트웨어·하드웨어
								</c:set>

                                <c:forEach items="${jobList}" var="jobItem">
                                	<c:set var="chk" value="true" />
	                                <c:forEach items="${job}" var="jobItemSelected">
	                                	<c:if test="${ jobItem == jobItemSelected }">
	                                		<li class="selectedItem">${ jobItem }</li>
	                                		<c:set var="chk" value="false" />
	                                	</c:if>
	                                </c:forEach>
	                                <c:if test="${ chk }">
	                                	<li>${ jobItem }</li>
	                                </c:if>
                                </c:forEach>
                                </ul>
                            </div>
                            <div class="w3-col m2">
                                <ul class="language">
                                    <li>Java</li>
                                    <li>C</li>
                                    <li>C++</li>
                                    <li>Python</li>
                                    <li>C#</li>
                                    <li>JavaScript</li>
                                    <li>PHP</li>
                                    <li>Assembly</li>
                                    <li>SQL</li>
                                    <li>HTML/CSS</li>
                                    <li>기타</li>
                                </ul>
                            </div>
                            <div class="w3-col m2">
                                <ul class="salary">
                                    <li>~2,000만원</li>
                                    <li>2,000~2,500만원</li>
                                    <li>2,500~3,000만원</li>
                                    <li>3,000~3,500만원</li>
                                    <li>3,500~4,000만원</li>
                                    <li>4,000~4,500만원</li>
                                    <li>4,500~5,000만원</li>
                                    <li>5,000~6,000만원</li>
                                    <li>6,000만원~</li>
                                </ul>
                            </div>
                            <div class="w3-col m2">
                                <ul class="loc">
                                    <li>서울</li>
                                    <li>경기</li>
                                    <li>인천</li>
                                    <li>대전</li>
                                    <li>세종</li>
                                    <li>충남</li>
                                    <li>충북</li>
                                    <li>광주</li>
                                    <li>전남</li>
                                    <li>전북</li>
                                    <li>대구</li>
                                    <li>경북</li>
                                    <li>부산</li>
                                    <li>울산</li>
                                    <li>경남</li>
                                    <li>강원</li>
                                    <li>제주</li>
                                    <li>전국</li>
                                </ul>
                            </div>
                            <div class="w3-col m2">
                                <ul class="edu">
                                    <li>대학교(4년) 졸업</li>
                                    <li>대학(2,3년) 졸업</li>
                                    <li>대학원 졸업</li>
                                    <li>고등학교 졸업</li>
                                </ul>
                            </div>
                            <div class="w3-col m2">
                                <div id="age_area">
                                    <ul class="age">
                                        <li>~25세</li>
										<li>26~30세</li>
                                        <li>31~35세</li>
                                        <li>36~40세</li>
                                        <li>41~50세</li>
                                        <li>51세 이상</li>
                                    </ul>
                                </div>
                                <div id="gender_area">
                                    <ul class="gender">
                                        <li>남자</li>&nbsp;&nbsp;&nbsp;
                                        <li>여자</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="filter_condition">
						<c:forEach items="${rcFilter.rcJob}" var="rcJob">
							<span class="condition job"><span class="conditionText">${rcJob}</span>×</span>
						</c:forEach>
						<c:forEach items="${rcFilter.rcLang}" var="rcLang">
							<span class="condition language"><span class="conditionText">${rcLang}</span>×</span>
						</c:forEach>
						<c:if test="${!empty rcFilter.rcSal}"><span class="condition salary"><span class="conditionText">${filter.rcSal}</span>×</span></c:if>
						<c:forEach items="${rcFilter.rcLoc}" var="rcLoc">
							<span class="condition loc"><span class="conditionText">${rcLoc}</span>×</span>
						</c:forEach>
						<c:forEach items="${rcFilter.rcEdu}" var="rcEdu">
							<span class="condition edu"><span class="conditionText">${rcEdu}</span>×</span>
						</c:forEach>
						<c:if test="${!empty rcFilter.rcAge}"><span class="condition age"><span class="conditionText">${filter.rcAge}</span>×</span></c:if>
						<c:forEach items="${rcFilter.rcGender}" var="rcGender">
							<span class="condition gender"><span class="conditionText">${rcGender}</span>×</span>
						</c:forEach>
                    </div>
                </div>

                <!-- 리스트 -->
                <div class="list_area">
                    <div class="list_header">
                        <div class="list_search_area w3-row">
                            <div class="w3-col m2">
                                <h3>총 <span id="totalCount">${totalContents}${how}</span>명</h3>
                            </div>
                            <div class="w3-col m5"></div>
                             <div class="list_search_area_right w3-col m5 w3-row" style="float: right;">
                                <div class="w3-col m3">
                                    <select name="" id="searchSelect">
                                        <option value="title">제목</option>
                                        <option value="name">이름</option>
                                    </select>
                                </div>
                                <div class="w3-col m7">
                                    <input class="w3-input w3-border" type="text" placeholder="결과 내 재검색" id="searchInput">
                                </div>
                                <div class="w3-col m2">
                                    <button class="w3-button w3-black" id="searchBtn">검색</button>
                                </div>
                            </div> 
                        </div>

                        <div class="list_order_area">
                            · <span id="registOrder">등록일순</span>
                            · <span id="updateOrder">수정일순</span>
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
                                                <img class="scrab_btn" src="${pageContext.request.contextPath}/resources/common/image/star.png">
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

        <a href="#wrap"><img class="top_arrow" src="${pageContext.request.contextPath}/resources/common/image/up-arrow.png"></a>

    </div>

    <script>
    
	    var order = 'regist';
	    var searchSelect = '';
	    var searchInput = '';
	    var title = '';
	    var name = '';
	    var cPage = '${cPage}';
		var job = '';
		var language = '';
		var salary = '';
		var loc = '';
		var edu = '';
		var age = '';
		var gender = '';
    	
    	$(function() {
    		
    		getPageBar('${totalContents}', cPage, '${numPerPage}', "/recruit/recruit.rc");
			
    		scrabBtnListner();
    		
    		$('.condition').each(function() {
    			deleteCondition($(this));
			});
    		
    		/*[START] Get Script Value */
    		
    		var rcJob = '${rcFilter.rcJob}';
    		var rcLang = '${rcFilter.rcLang}';
    		var rcSal = '${rcFilter.rcSal}';
    		var rcLoc = '${rcFilter.rcLoc}';
    		var rcEdu = '${rcFilter.rcEdu}';
    		var rcAge = '${rcFilter.rcAge}';
    		var rcGender = '${rcFilter.rcGender}';
    		
    		ConditionChk(rcJob);
    		ConditionChk(rcLang);
    		ConditionChk(rcSal);
    		ConditionChk(rcLoc);
    		ConditionChk(rcEdu);
    		ConditionChk(rcAge);
    		ConditionChk(rcGender);
    		
    		/*[END] Get Script Value */

    		
		});
    
    	// 필터에서 클릭한 클래스와 같은 클래스가 조건에 5개 이상 존재하는지 체크
    	function maxChk(className) {
			
    		var count = 0;
    		
    		$('.condition').each(function() {
				
    			if($(this).attr('class') == 'condition '+className) {
    				count++;
    				
    			}
    			
			});
    		
    		return count;
    		
		}
    	
    	// 필터에서 클릭한 노드와 같은 내용을 갖는 노드가 조건에 존재하는지 체크
    	function dupChk(content) {

    		if($('.condition:contains(' + content + ')').length) return false;
    		else return true;
    		
		}
	
    
        $('.filter_content div ul li').on('click', function() {
        	
        	var className = $(this).parent().attr('class');
        	var content = $(this).text();
        	
        	var dupCheck = dupChk(content);
        	var maxCheck = true;
        	var filterName;
        	
        	switch(className) {
        	
        	case 'job' : filterName = '직무'; if(maxChk(className) > 4) maxCheck = false; break;
        	case 'loc' : filterName = '희망근무지역'; if(maxChk(className) > 4) maxCheck = false; break;
        	case 'edu' : filterName = '학력'; if(maxChk(className) > 4) maxCheck = false; break;
        	case 'language' : filterName = '언어'; if(maxChk(className) > 4) maxCheck = false; break;
        	case 'salary' : filterName = '희망연봉'; if(maxChk(className) > 0) maxCheck = false; break;
        	case 'age' : filterName = '나이'; if(maxChk(className) > 0) maxCheck = false; break;
        	case 'gender' : filterName = '성별'; break;
        	
        	}
        	
        	if(!dupCheck) {
				alert('선택되있는 조건입니다.');
        	} else if(!maxCheck) {
        		alert(filterName + '은(는) 최대 '+ maxChk(className) + '개까지 선택이 가능합니다.');
        	} else {
        		
        		$(this).addClass('selectedItem');
        		
                $condition = $('<span>');
                $conditionText = $('<span>');

                $condition.addClass('condition');
                $condition.addClass(className);
                $conditionText.addClass('conditionText');
                
                $conditionText.text($(this).text());
                $condition.append($conditionText);
                $condition.html($condition.html() + '&times;');

                $('.filter_condition').append($condition);
                
                cPage = '1';
                
            	deleteCondition($condition);
        		
            	// 조건이 정상적으로 추가되었을 시에, 각 필터에 맞게 조건들의 리스트를 만들기
            	reloadList();
            	
        	}
        	
        });
        
        function reloadList() {
			
         	job = '';
       		language = '';
       		salary = '';
       		loc = '';
       		edu = '';
       		age = '';
       		gender = '';
        	
        	$('.condition').each(function() {
				
        		conditionClass = $(this).attr('class');
        		conditionText = $(this).children('.conditionText').text();
        		
        		switch(conditionClass) {
        		
        		case 'condition job' : job += conditionText+'::'; break;
        		case 'condition language' : language += conditionText+'::'; break;
        		case 'condition salary' : salary += conditionText; break;
        		case 'condition loc' : loc += conditionText+'::'; break;
        		case 'condition edu' : edu += conditionText+'::'; break;
        		case 'condition age' : age += conditionText; break;
        		case 'condition gender' : gender += conditionText+'::'; break;
        		
        		}
        		
			});
        	
        	$.ajax({
        		
        		url : '${pageContext.request.contextPath}/recruit/filterRecruitList.rc',
        		data : {
        			'cPage' : cPage,
        			'job' : job,
        			'language' : language,
        			'salary' : salary,
        			'loc' : loc,
        			'edu' : edu,
        			'age' : age,
        			'gender' : gender,
        			'order' : order,
        			'searchSelect' : searchSelect,
        			'searchInput' : searchInput
        		},
        		type : 'get',
        		success : function(data) {
        			
        			$('#totalCount').text(data.totalContents);
					
        			$('#list_tbody').html('');
        			
        			console.log(data.list);
        			console.log(data.numPerPage);
        			console.log(data.totalContents);
        			
        			for(var idx in data.list) {
							
        				if(data.list[idx].language != null) {
							var langArr = data.list[idx].language.split(",");
        				}
							var langs = '';
							for(var i in langArr) {
								langs += langArr[i] + ' ';
							}
							
							var orderDate;
							if(order == 'regist')
								orderDate = new Date(data.list[idx].regist_date+86400000).toISOString().slice(0, 10);
							else
								orderDate = new Date(data.list[idx].update_date+86400000).toISOString().slice(0, 10);
							
							
							$('#list_tbody').html(
		            				$('#list_tbody').html()
		            				+
		            				'<tr class="list_table_tr">'
		                            +'   	<td class="user_info" style="width: 22%; padding-top: 20px;">                                              '
		                            +'        <div class="w3-row">                                                                                     '
		                            +'            <div class="w3-col m2">                                                                              '
		                            +'                <img class="scrab_btn" src="${pageContext.request.contextPath}/resources/common/image/star.png"> '
		                            +'            </div>                                                                                               '
		                            +'            <div class="w3-col m10">                                                                             '
		                            +'                <p class="user_info_name">'+data.list[idx].name+'</p>                                            '
		                            +'                <p class="user_info_detail">('+data.list[idx].gender+' | '+data.list[idx].birthyear+'년, '+data.list[idx].age+'세)</p>                    '
		                            +'            </div>                                                                                               '
		                            +'        </div>                                                                                                   '
		                            +'    </td>                                                                                                        '
		                            +'    <td class="resume_view" style="width: 65%; padding-top: 20px;">                                              '
		                            +'        <div>                                                                                                    '
		                            +'            <p class="resume_view_title">                                                                        '
		                            +'                '+data.list[idx].title
		                            +'            </p>                                                                                                 '
		                            +'            <p class="resume_view_detail">'+data.list[idx].last_edu+'</p>                  '
		                            +'            <p class="resume_view_detail">'+data.list[idx].location+' | '+data.list[idx].salary+' 만원</p>        '
		                            +'            <p class="resume_view_detail">'+data.list[idx].job+'</p>                                             '
		                            +'			  <p class="resume_view_detail">																	   '
		                            +			      langs
                            		+'			  </p>																								   '
		                            +'        </div>                                                                                                   '
		                            +'    </td>                                                                                                        '
		                            +'    <td>                                                                                                         '
		                            +'        <p class="resume_date">'+orderDate+'</p>                                                             '
		                            +'    </td>                                                                                                        '
		                            +'</tr>     '
		            					
		            			);

        			}
        			
        			scrabBtnListner();
        			
        			$('.pageBar').remove();
        			
        			
        			getPageBar(data.totalContents, cPage, data.numPerPage, "/recruit/filterRecruitList.rc");
        			
				}, error : function(data) {
					console.log(data);
				}
        		
        	});
        	
		}
        
        function deleteCondition(condition) {
			
        	condition.on('click', function() {
        		
        		var text = $(this).children('.conditionText').text(); 
				$(this).remove();
				
				$('.filter_content div ul li').each(function() {
					console.log(text);
					if($(this).text() == text) {
						
						$(this).removeClass('selectedItem');
						
					}
					
				});
				
				cPage = '1';
				
				reloadList();
				// deleteCondition();
				
			});
        	
		}
        
        function scrabBtnListner() {
			
            $('.scrab_btn').on('click', function() {
        		
            	if($(this).attr('src') == '${pageContext.request.contextPath}/resources/common/image/star.png') {
            		$(this).attr('src', '${pageContext.request.contextPath}/resources/common/image/star_selected.png');	
            	} else {
            		$(this).attr('src', '${pageContext.request.contextPath}/resources/common/image/star.png');
            	}                   	
    		});
        	
		}
 
        $('#registOrder').on('click', function() {
			
        	$('#orderDate').text('등록일');
        	
        	$(this).css({
        		'color' : 'royalblue',
        		'font-weight' : 'bold'
        	});
        	
        	$('#updateOrder').css({
        		'color' : 'black',
        		'font-weight' : '500'
        	});
        	
        	order = 'regist';
        	
        	cPage = '1';
        	
        	reloadList();
        	
		});
        
        $('#updateOrder').on('click', function() {
			
        	$('#orderDate').text('수정일');
        	
        	$(this).css({
        		'color' : 'royalblue',
        		'font-weight' : 'bold'
        	});
        	
        	$('#registOrder').css({
        		'color' : 'black',
        		'font-weight' : '500'
        	});
        	
        	order = 'update';
        	
        	cPage = '1';
        	
        	reloadList();
        	
		});
        
        $('#searchBtn').on('click', function() {
			
        	title = '';
        	name = '';
        	
        	if($('#searchSelect option:selected').val() == 'title') {
        		searchSelect = 'title';
        	}
        	else if($('#searchSelect option:selected').val() == 'name') {
        		searchSelect = 'name';
        		
        	}
        	
        	searchInput = $('#searchInput').val();
        	
        	console.log('searchSelect : ' + searchSelect);
        	console.log('searchInput : ' + searchInput);
        	
        	cPage = '1';
        	
        	reloadList();
        	
		});
        
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
        	
        	location.href='filterRecruitListPage.rc?cPage='+cPage
        				+'&job='+job
        				+'&language='+language
        				+'&salary='+salary
        				+'&loc='+loc
        				+'&edu='+edu
        				+'&age='+age
        				+'&gender='+gender
        				+'&order='+order
        				+'&searchSelect='+searchSelect
        				+'&searchInput='+searchInput;
        	
		}
        
        function returnFalse2() {
			return false;
		}
        
		function ConditionChk(condition) {
			
			var cdList = (condition.substring(1, condition.length-1)).split(", ");
			
			$('.filter_content div ul li').each(function() {
				
				for(var i in cdList) {
					
					if($(this).text() == cdList[i]) {
						
						$(this).css({
							'color' : 'royalblue',
							'font-weight' : 'bold'
						});
						
						job += $(this).text()+"::";
						
					}
					
				}
				
			});
			
		}
		
	</script>

	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>

















