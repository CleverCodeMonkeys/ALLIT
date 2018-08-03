<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: penB, sans-serif !important; font-size: 1.1em !important;} 

hr { 
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 1px;
} 

.trFont{
    font-size: 0.8em;
}

p{
	font-family: penB !important;
}

th{
 text-align: left !important;
}
</style>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
<!-- Page Container -->
<div class="w3-margin-top" style="width:100%; padding-left: 20%; padding-right: 20%;">
    <p class="w3-right"></p>
    <hr style="border-color:teal;">
    <!-- The Grid -->
    <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
        	<c:if test="${resume.resume.photo eq monkeyLogo.jpg}">
        		<img src="${pageContext.request.contextPath}/resources/images/log/monkeyLogo.jpg" style="width:100%" alt="Avatar">	
        	</c:if>
        	<c:if test="${resume.resume.photo ne monkeyLogo.jpg}">
            	<img src="${pageContext.request.contextPath}/resources/uploadFiles/picture/${resume.resume.memberId}/${resume.resume.photo}" style="width:100%" alt="Avatar">
            </c:if>
        </div>
        <div class="w3-container">
            <p><i class="fa fa-id-badge fa-fw w3-margin-right w3-large w3-text"></i>${resume.resume.name}</p>
            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-large w3-text-red"></i>${resume.resume.birthday}</p>
            <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-orange"></i>${resume.resume.email}</p>
            <p><i class="	fa fa-child fa-fw w3-margin-right w3-large w3-text-yellow"></i>${resume.resume.gender}</p>
            <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-green"></i>${resume.resume.tel}</p>
            <p><i class="	fa fa-address-book fa-fw w3-margin-right w3-large w3-text-blue"></i>${resume.resume.address}</p>
            <hr>

            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-indigo"></i>Skill</b></p>
            <c:forTokens items="${resume.resume.language}" delims="," var="language">
            	<p><i class="fa fa-tag fa-fw w3-margin-right w3-large w3-text"></i>${language}</p>                   
            </c:forTokens>
            <hr>

            <p class="w3-large w3-text-theme"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-purple"></i>희망근무조건</b></p>
            <p><i class="fa fa-money fa-fw w3-margin-right w3-large w3-text"></i>${resume.hopeCondition.job}</p>
            <p><i class="fa fa-money fa-fw w3-margin-right w3-large w3-text"></i>${resume.hopeCondition.location}</p>
            <p><i class="fa fa-money fa-fw w3-margin-right w3-large w3-text"></i>${resume.hopeCondition.salary}만원</p>
            <br>
            </div>
        </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    	<div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-pink"></i>고등학교</h2>
            <hr style="border-color:tomato;">
            <div class="w3-margin-bottom">
                <table class="w3-table w3-bordered">
                    <tr class="w3-hover-orange">
                        <th>학교명</th>
                        <th>입학일</th>
                        <th>졸업일</th>
                    </tr>
                    <tr class="w3-hover-yellow trFont">
                        <td>${resume.highSchool.schoolName}</td>
                        <td>${resume.highSchool.enrollDate}</td>
                        <td>${resume.highSchool.graduDate}</td>
                    </tr>
                </table>
            </div>
        </div>
    
 		<c:if test="${fn:length(resume.degreeList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-red"></i>대학교</h2>
            <hr style="border-color:tomato;">
            <div class="w3-margin-bottom">
                <table class="w3-table w3-bordered">
                    <tr class="w3-hover-orange">
                        <th>학교명</th>
                        <th>학교타입</th>
                        <th>입학일</th>
                        <th>졸업일</th>
                        <th>전공명</th>
                        <th>학점</th>
                        <th>총점</th>
                    </tr>
                    <c:forEach var ="degreeItem" items="${resume.degreeList}" begin="0">  
	                    <tr class="w3-hover-yellow trFont">
	                        <td>${degreeItem.schoolName}</td>
	                        <td>${degreeItem.schoolType}</td>
	                        <td>${degreeItem.enrollDate}</td>
	                        <td>${degreeItem.graduDate}</td>
	                        <td>${degreeItem.major}</td>
	                        <td>${degreeItem.score}</td>
	                        <td>${degreeItem.totalScore}</td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
		</c:if>
      	
      	<c:if test="${fn:length(resume.academyList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-orange"></i>교육</h2>
            <hr style="border-color:orange;">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-bordered">
                <c:forEach var ="eduItem" items="${resume.academyList}" begin="0"> 
                    <tr class="w3-hover-orange">
                        <th>교육명</th>
                        <th>교육기관</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <!-- <th>내용</th> -->
                    </tr>
                    
	                    <tr class="w3-hover-yellow trFont">
	                        <td>${eduItem.educationTitle}</td>
	                        <td>${eduItem.academyName}</td>
	                        <td>${eduItem.startDate}</td>
	                        <td>${eduItem.endDate}</td>
	                        
	                    </tr>
	                   <tr class="w3-hover-yellow trFont" style ="border-bottom: none;"> 
	                    	<td colspan="4" class ="w3-center" style ="font-family: penB; font-size: 2em;">교육 내용</td>
	                   </tr>
	                   <tr class="trFont" style ="border-bottom: 2px solid orange;">	                   
	                    	<td colspan="4">${eduItem.content}<br><br></td>
	                   </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
		</c:if>
		
		<c:if test="${fn:length(resume.certificateList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-yellow"></i>자격증</h2>
            <hr style="border-color:yellow">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-center w3-bordered">
                
                    <tr class="w3-hover-orange">
                        <th>자격증명</th>
                        <th>기관</th>
                        <th>취득일</th>
                    </tr>
                <c:forEach var ="certItem" items="${resume.certificateList}" begin="0">
                    <tr class="w3-hover-yellow trFont">
                        <td>${certItem.certificateName}</td>
                        <td>${certItem.certificateFrom}</td>
                        <td>${certItem.certificateDate}</td>
                    </tr>
                </c:forEach>
                </table>
            </div>
        </div>
        </c:if>

		<c:if test="${fn:length(resume.awardList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-green"></i>수상</h2>
            <hr style="border-color:green">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-center w3-bordered">
                <c:forEach var ="awardItem" items="${resume.awardList}" begin="0">
                    <tr class="w3-hover-orange">
                        <th>수상명</th>
                        <th>수여기관</th>
                        <th>수상연도</th>
                    </tr>
                   
                    <tr class="w3-hover-yellow trFont">
                        <td>${awardItem.awardTitle}</td>
                        <td>${awardItem.awardOrganization}</td>
                        <td>${awardItem.awardDate}</td>
                    </tr>
                                        
                    <tr class="w3-hover-yellow trFont" style ="border-bottom: none;"> 
	                    	<td colspan="4" class ="w3-center" style ="font-family: penB; font-size: 2em;">수상 내용</td>
	                </tr>
                                        
                    <tr class="trFont" style ="border-bottom: 2px solid green;">	                   
	                    	<td colspan="4">${awardItem.awardContent}<br><br></td>
	                   </tr>
                </c:forEach>
                </table>
            </div>
        </div>
        </c:if>

		<c:if test="${fn:length(resume.certiLanguageList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-blue"></i>어학</h2>
            <hr style="border-color:blue">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-center w3-bordered">
                    <tr class="w3-hover-orange">
                        <th>외국어명</th>
                        <th>공인시험</th>
                        <th>급수</th>
                        <th>취득일</th>
                    </tr>
                   <c:forEach var ="certLangItem" items="${resume.certiLanguageList}" begin="0">
                    <tr class="w3-hover-yellow trFont">
                        <td>${certLangItem.languageName}</td>
                        <td>${certLangItem.testName}</td>
                        <td>${certLangItem.score}</td>
                        <td>${certLangItem.getDate}</td>
                    </tr>
                   </c:forEach>
                </table>
            </div>
        </div>
        </c:if>

		<c:if test="${fn:length(resume.portpolioList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-indigo"></i>포트폴리오</h2>
            <hr style="border-color:indigo">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-center w3-bordered">
                    <tr class="w3-hover-orange">
                        <th>URL</th>
                    </tr>
                    <c:forEach var ="portItem" items="${resume.portpolioList}" begin="0">
                    <tr class="w3-hover-yellow trFont">
                        <td><a href = "${portItem.url}" target="_blanket">${portItem.url}</a></td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        </c:if>

		<c:if test="${fn:length(resume.introductionList) > 0}">
        <div class="w3-container w3-card w3-white w3-margin-bottom">
            <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-purple"></i>자기소개서</h2>
            <hr style="border-color:purple">
            <div class="w3-container w3-margin-bottom">
                <table class="w3-table w3-center w3-bordered">
                <c:forEach var ="introItem" items="${resume.introductionList}" begin="0"> 
                    <tr class="w3-hover-orange">
                        <th>${introItem.title}</th>
                    </tr>
                    <tr class="w3-hover-yellow trFont">
                        <td>${introItem.content}</td>
                    </tr>
                 </c:forEach>
                </table>
            </div>
        </div>
		</c:if>
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>
</body>
</html>
