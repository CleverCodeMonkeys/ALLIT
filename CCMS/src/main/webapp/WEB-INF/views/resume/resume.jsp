<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<title>Resume</title>
<style>
       #title {
            height: 50px;
            width: 98%;
            margin-left:10px !important;
        }
 
        .resume-form{
           margin-bottom:30px;
        }
       
        .boxForm{
        	padding-bottom: 2%;
        	padding-top: 2%;
        	padding-left: 1%;
        	padding-right: 1%;
        	margin-bottom: 6%;
        }
        
        .boxTitle{
       		padding-left: 3%;
        	font-family: whiteCloud;
        	font-size: 2em;
        }
        
        .plusBtn{
        	padding-left: 3%;
        	padding-right: 3%;
        	cursor: pointer;
        }
        
        .fontC{       
        	font-family: penB;
        }
        
        .inBoxUp{
        	margin-top: 30px; font-family: penB;
        }
        
        .inBoxDown{
        	margin-top: 30px; font-family: penB; padding-bottom: 5%;
        }
        
        /* input box color */ input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #fff inset ; -webkit-text-fill-color: #000; } input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active { transition: background-color 5000s ease-in-out 0s; }

.group {
  position: relative;
  margin: 45px 0;
}

textarea {
  resize: none;
  overflow: hidden;
}
input,
textarea {
  background: none;
  font-size: 24px;
  padding: 10px 10px 10px 5px;
  display: block;
  width: 100%;
  border: none;
  border-radius: 0;
  border-bottom: 2px solid #c8ccd4;
  padding-left: 5%;
}
input:focus,
textarea:focus {
  outline: none;
}
input:focus ~ label, 
textarea:focus ~ label{
  top: -14px;
  font-size: 12px;
  color: #2196F3;
}
input:focus ~ .bar:before,
textarea:focus ~ .bar:before {
  width: 100%;
}

.textlabel {
  color: #9098a9;
  font-size: 16px;
  font-weight: normal;
  position: absolute;
  pointer-events: none;
  left: 5px;
  top: 10px;
  transition: 300ms ease all;
}

.bar {
  position: relative;
  display: block;
  width: 100%;
}
.bar:before {
  content: '';
  height: 2px;
  width: 0;
  bottom: 0px;
  position: absolute;
  background: #2196F3;
  transition: 300ms ease all;
  left: 0%;
}
</style>
</head>
<body class ="w3-light-gray">
   <c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
   <div class ="w3-light-gray" style ="height:100px;"></div>
      
   <form action="${pageContext.request.contextPath}/resume/saveResume.resume" method="post" enctype="multipart/form-data" onsubmit="return validate();">
   
   <!-- Distinguish New or Modify Resume -->
   <input type="hidden" value="${resume.resume.id}" name ="modifyResume"/>
   
   <div class="w3-row" style="padding-left:25%; ">
        <div class="w3-col m8 resume-form w3-light-gray" >
        	<!-- 제목 뷰 -->
           	<c:import url="/WEB-INF/views/resume/title.jsp" charEncoding="UTF-8"/>
                               
            <!-- 인적사항 뷰  -->
            <div class = "w3-indigo boxTitle">인적사항</div>            	
            		<c:import url="/WEB-INF/views/resume/profile.jsp" charEncoding="UTF-8"/>
            		<input type ="hidden" id ="languageValue" name ="languageValue" value="${resume.resume.language}"/>
            	<div class = "w3-container w3-white boxForm">
           			<c:import url="/WEB-INF/views/resume/profile2.jsp" charEncoding="UTF-8"/>
           		</div>
        
            <!-- 고등학교 사항 뷰 -->            
            <div class = "w3-indigo boxTitle">고등학교</div>
               <div class = "w3-container w3-white boxForm">
               		<c:import url="/WEB-INF/views/resume/school.jsp" charEncoding="UTF-8"/>
               </div>
             
            <!-- 희망 근무사항 뷰 -->
             <div class = "w3-indigo boxTitle">희망근무 조건</div>
              <div class = "w3-container w3-white boxForm">
              		<c:import url="/WEB-INF/views/resume/hope.jsp" charEncoding="UTF-8"/>
              </div>
              
              
           	<!-- 동적 뷰 영역 [START]  -->
                            
            <!-- 대학교 뷰 -->
            <div id= "degreeForm"> 
	              <div class = "w3-indigo boxTitle w3-display-container">대학교 <span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rDegree">+</span></div>
	              <div class = "w3-container w3-white boxForm" id ="degreeIndexZ1">
	              	<c:import url="/WEB-INF/views/resume/degree.jsp" charEncoding="UTF-8"/>
	              </div>
	              
	              <!-- if [1] Index have Value, This List can get More. -->                         		   			               			
               	  <c:import url="/WEB-INF/views/resume/moreDegree.jsp" charEncoding="UTF-8"/>
            </div>
                      
            <!-- 교육 뷰 -->
            <div id= "eduForm"> 
               <div class = "w3-indigo boxTitle w3-display-container">교육 <span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rAcademy">+</span></div>
               <div class = "w3-container w3-white boxForm" id ="eduIndexZ1">
	              	<c:import url="/WEB-INF/views/resume/edu.jsp" charEncoding="UTF-8"/>
	           </div>
	           
	           <!-- if [1] Index have Value, This List can get More. -->                         		   			               			
               <c:import url="/WEB-INF/views/resume/moreEdu.jsp" charEncoding="UTF-8"/>
            </div>
            
            <!-- 자격증 뷰  -->  
            <div id="certForm">
            	<div class = "w3-indigo boxTitle w3-display-container">자격증<span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rCert">+</span></div>
           		<div class = "w3-container w3-white boxForm" id ="certIndexZ1">
           			<c:import url="/WEB-INF/views/resume/cert.jsp" charEncoding="UTF-8"/>
           		</div>
           		
           	   <!-- if [1] Index have Value, This List can get More. -->                         		   			               			
               <c:import url="/WEB-INF/views/resume/moreCert.jsp" charEncoding="UTF-8"/>
            </div>
              
            <!-- 수상 뷰 -->
            <div id="awardForm">
               <div class = "w3-indigo boxTitle w3-display-container">수상<span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rAward">+</span></div>
               <div class = "w3-container w3-white boxForm" id ="awardIndexZ1">
               		<c:import url="/WEB-INF/views/resume/award.jsp" charEncoding="UTF-8"/>
               </div>
               
               <!-- if [1] Index have Value, This List can get More. -->                         		   			               			
               <c:import url="/WEB-INF/views/resume/moreAward.jsp" charEncoding="UTF-8"/>
            </div>
            
            <!-- 어학 뷰 -->
            <div id="langForm">
                <div class = "w3-indigo boxTitle w3-display-container">어학<span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rLang">+</span></div>
                <div class = "w3-container w3-white boxForm" id ="langIndexZ1">
                	<c:import url="/WEB-INF/views/resume/lang.jsp" charEncoding="UTF-8"/>
                </div>
                
                <!-- if [1] Index have Value, This List can get More. -->                         		   			               			
                <c:import url="/WEB-INF/views/resume/moreLang.jsp" charEncoding="UTF-8"/> 
            </div>

			<!-- 포트폴리오 뷰 -->         
            <div id="portForm">
               <div class = "w3-indigo boxTitle w3-display-container">포트폴리오<span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rPort">+</span></div>               		
               <div class = "w3-container w3-white boxForm" id = "portIndexZ1">
               		<c:import url="/WEB-INF/views/resume/port.jsp" charEncoding="UTF-8"/>
               </div>
               
               <c:import url="/WEB-INF/views/resume/morePort.jsp" charEncoding="UTF-8"/> 
            </div>
            
            <!-- 자기소개서 뷰  -->
            <div id="introdForm">
               <div class = "w3-indigo boxTitle w3-display-container">자기소개서<span class="w3-right w3-amber plusBtn w3-hover-deep-orange" onclick="plusForm(id);" id="rIntro">+</span></div>                                           		
               		<div class = "w3-container w3-white boxForm" id ="introIndexZ1">
               			<c:import url="/WEB-INF/views/resume/introd.jsp" charEncoding="UTF-8"/>
               		</div>               		               		
               		<!-- if [1] Index have Value, This List can get More. -->                         		   			               			
               		<c:import url="/WEB-INF/views/resume/moreIntro.jsp" charEncoding="UTF-8"/>               		            			               			                  
            </div>

      </div>
      
    	<c:import url="/WEB-INF/views/resume/resumeMenu.jsp" charEncoding="UTF-8"/>
    </div>
    </form>
       
    <script>
    // Introduction Counts
    var introValue = '${resume.introductionList.size()}';
    var introBoxCount = 1; 
    var maxIntroBox = 5;
    
    // Degree Counts
    var degreeValue = '${resume.degreeList.size()}';
    var degreeBoxCount = 1;
    var maxDegreeBox = 3;
    
    // Academy Counts
    var academyValue = '${resume.academyList.size()}';
    var academyBoxCount = 1;
    var maxAcademyBox = 3;
    
    // Award Counts
    var awardValue = '${resume.awardList.size()}';
    var awardBoxCount = 1;
    var maxAwardBox   = 5;
    
    //Certificate
    var certValue = '${resume.certificateList.size()}';
    var certBoxCount = 1;
    var maxCertBox = 6;
    
    //Language
    var langValue = '${resume.certiLanguageList.size()}';
    var langBoxCount = 1;
    var maxLangBox = 3;
    
    //Port
    var portValue = '${resume.portpolioList.size()}';
    var portBoxCount = 1;
    var maxPortBox  = 5;
    
    // Start
    $(function(){
    	/* Setting Index [START]*/
  		if(introValue != ""){introBoxCount = ++introValue;}
  		if(degreeValue != ""){degreeBoxCount =++degreeValue;}
  		if(academyValue != "") {academyBoxCount = ++academyValue;}
  		if(awardValue != "") {awardBoxCount = ++awardValue;}
  		if(certValue != ""){certBoxCount = ++certValue;}	
  		if(langValue != "") {langBoxCount = ++langValue;}
  		if(portValue != ""){portBoxCount = ++portValue;}
  		/* Setting Index [END]*/
    });

    function plusForm(id){
    	   
    	 if(maxBoxLImit(id)) 
    	 {
          var rUrl = makeUrl(id);
          var index = makeIndex(id);
           $.ajax({
             url : rUrl,
             data: {index : index},
             type : "post",
             dataType: "json",
             success: function(data){
                makeAppend(id, data);
             },
             error : function(data){
                alert("추가 실패!");
             }
          }); } else{
        	  alert('이미 추가 횟수를 초과 하였습니다.');
          }
       }
       
       function maxBoxLImit(id){
    	   var result = true;
    	   
    	   switch(id)
           {
		       case "rDegree" : 
		    	   result = degreeBoxCount > maxDegreeBox ? false : true;
		    	   if(result) degreeBoxCount++;
		    	   break;
		       case "rAcademy" : 
		    	   result = academyBoxCount > maxAcademyBox ? false : true;
		    	   if(result) academyBoxCount++;
		    	   break;
		       case "rCert" :
		    	   result = certBoxCount > maxCertBox ? false : true;
	    	   	   if(result) certBoxCount++;
	    	   	   break;
		       case "rAward":
		    	   result = awardBoxCount > maxAwardBox ? false : true;
		    	   if(result) awardBoxCount++;
		    	   break;
		       case "rLang" : 
		    	   result = langBoxCount > maxLangBox ? false : true;
	    	   	   if(result) langBoxCount++;
	    	   	   break;
		       case "rPort" : 
		    	   result = portBoxCount > maxPortBox ? false : true;
	    	   	   if(result) portBoxCount++;
	    	   	   break;
		       case "rIntro" :
		    	   result = introBoxCount > maxIntroBox ? false : true;
		    	   if(result) introBoxCount++;
		    	   break;
           }
    	   
    	   return result;
       }
       
       /* Make Index String */
       function makeIndex(id){
           var index;
           switch(id)
           {
               case "rDegree" : index = 'degreeIndexZ' + degreeBoxCount; break;
               case "rAcademy" : index = 'eduIndexZ' + academyBoxCount; break;
               case "rCert" : index= 'certIndexZ' + certBoxCount; break;
               case "rAward" : index= 'awardIndexZ' + awardBoxCount; break;
               case "rLang" : index = 'langIndexZ' + langBoxCount; break;
               case "rPort" : index = 'portIndexZ' + portBoxCount; break;
               case "rIntro" : index = 'introIndexZ' + introBoxCount; break;
           }          
           return index;
        }
       
       /* make Url String */
       function makeUrl(selectedUrl){
          var url = "${pageContext.request.contextPath}/resume/";
          switch(selectedUrl)
          {
              case "rDegree" : url += "degreeForm.resume"; break;
           	  case "rAcademy" : url += "academyForm.resume"; break;
              case "rCert" : url += "certForm.resume"; break;
              case "rAward" : url += "awardForm.resume"; break;
              case "rLang" : url += "langForm.resume"; break;
              case "rPort" : url += "portForm.resume"; break;
              case "rIntro" : url += "introForm.resume"; break;
          }          
          return url;
       }
       
       function makeAppend(selectedUrl, data){
          switch(selectedUrl){
             case "rDegree": $('#degreeForm').append(data.value); break;
             case "rAcademy": $('#academyForm').append(data.value); break;
             case "rCert": $('#certForm').append(data.value); break;
             case "rAward": $('#awardForm').append(data.value); break;
             case "rLang": $('#langForm').append(data.value); break;
             case "rPort": $('#portForm').append(data.value); break;
             case "rIntro" : $('#introdForm').append(data.value); break;            
          }
       }
       
       function saveResume(){
             location.href = '${pageContext.request.contextPath}/resume/saveResume.resume';
       }
  
       function removeBtn(name){
    	   if(confirm('삭제하겠습니까?')){    
    		 console.log(name + "이 지워졌습니다.");
    	   	var result = '#' + name;
    	   	reduceCount(name);
    	  	$(result).remove();
    	   }
       }
 
       function reduceCount(str){
    	   console.log(str);
    	   var get = str.split('Z')[0];
   
    	   switch(get){    	   
    	   		case "introIndex" : introBoxCount--; break;    	   		    	   		
    	   		case "degreeIndex" : degreeBoxCount--; break;
    	   		case "awardIndex" : awardBoxCount--; break;
    	   		case "eduIndex" : academyBoxCount--; break;
    	   		case "certIndex" : certBoxCount--; break;
    	   		case "langIndex" : langBoxCount--; break;
    	   		case "portIndex" : portBoxCount--; break;
    	   }    	   
    
       }
       
       /* Limit Text Counts */
       
       /* TextArea 500자. */
       var textMax = 500;       
       $('textarea').keyup(function(){
    		var value = $(this).val().length;
    	 	if(value >  textMax)
    	 		$(this).val($(this).val().substring(0,textMax));
    	});
       
       /* confirm submit */
       function validate(){
    	   var wow = true;
    	   
    	   if($('#birth').val().trim().length != 6) {
    		   alert('유효하지 않은 주민번호입니다.');
    		   wow = false;
    	   }
    	   
    	   if($('#schoolName').val().trim().length > 20){
    		   alert('고등학교 이름이 너무 깁니다.');
    		   wow = false;
    	   }
    	 	
    	  /* Degree  */
    	  $('input[name=universityName]').each(function(){
    		  if($(this).val().trim().length > 30) { wow = false; alert('대학명이 깁니다');}
    	  });
    	  
    	  $('input[name=major]').each(function(){
    		  if($(this).val().trim().length > 20){ wow = false; alert('전공명이 깁니다');}
    	  });
    	  
    	  /* Academy */
    	  $('input[name=educationTitle]').each(function(){
    		  if($(this).val().trim().length > 50) { wow = false; alert('교육명이 깁니다');}
    	  });
    	  
    	  $('input[name=academyName]').each(function(){
    		  if($(this).val().trim().length > 30) { wow = false; alert('교육기관명이 깁니다');}
    	  });
    	  
    	  $('input[name=content]').each(function(){
    		  if($(this).val().trim().length > 500) { wow = false; alert('교육내용 500자 입니다');}
    	  });
    	  
    	  /* Award */
    	  $('input[name=awardTitle]').each(function(){
    		  if($(this).val().trim().length > 30) { wow = false; alert('수상명이 깁니다');}
    	  });
    	  
    	  $('input[name=awardOrgan]').each(function(){
    		  if($(this).val().trim().length > 20) { wow = false; alert('수상기관명이 깁니다');}
    	  });
    	  
    	  $('input[name=awardContent]').each(function(){
    		  if($(this).val().trim().length > 500) { wow = false; alert('수상내용은 500자 이내입니다');}
    	  });
    	  
    	  /* Certificate */
    	  $('input[name=certName]').each(function(){
    		  if($(this).val().trim().length > 20) { wow = false; alert('자격증명이 깁니다');}
    	  });
    	  
    	  $('input[name=certFrom]').each(function(){
    		  if($(this).val().trim().length > 20) { wow = false; alert('자격기관명이 깁니다');}
    	  });
    	  
    	  /* Language */
    	  $('input[name=langName]').each(function(){
    		  if($(this).val().trim().length > 20) { wow = false; alert('외국어명이 깁니다');}
    	  });
    	  
    	  $('input[name=testName]').each(function(){
    		  if($(this).val().trim().length > 20) { wow = false; alert('공인시험명이 깁니다');}
    	  });
    	  
    	  $('input[name=langScore]').each(function(){
    		  if($(this).val().trim().length > 10) { wow = false; alert('급수명이 깁니다');}
    	  });
    	  
    	  /* Portpolio */
    	  $('input[name=url]').each(function(){
    		  if($(this).val().trim().length > 200) { wow = false; alert('URL 깁니다');}
    	  });
    	  
    	  /* Introduction */
    	  $('input[name=introdTitle]').each(function(){
    		  if($(this).val().trim().length > 100) { wow = false; alert('자기소개 제목 100자 이내입니다');}
    	  });
    	  
    	  $('input[name=introdContent]').each(function(){
    		  if($(this).val().trim().length > 4000) { wow = false; alert('자기소개 내용은 4000자 내외입니다');}
    	  });
    	  
    	  return wow;
       }
       
       
    </script>
</body>
</html>