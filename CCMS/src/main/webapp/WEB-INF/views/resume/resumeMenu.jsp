<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
    	<!-- [RIGHT SIDE BAR] Remote Controller -->
		<div class="w3-col m3 w3-sidebar w3-white w3-light-gray" style="right:0; margin-top: 5%; padding-left: 3%;">
		
        	<div class ="w3-white" style ="margin-right: 50%; font-family: penB; padding-top: 2%;">     	
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="degreeF();" id ="degreeMenu">
	        		<span style="text-decoration: none;">
	        		<i class="fa fa-graduation-cap"></i> 학력
	        		</span> 
        		<i class="fa fa-check w3-right" id ="degreeCheck"></i>
        		<input type="hidden" name="hiddenDegree" id ="hiddenDegree" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="eduF();" id ="eduMenu">
        			<span style="text-decoration: none;">
        			<i class= "fa fa-book"></i> 교육
        			</span>
        			<i class="fa fa-check w3-right" id ="eduCheck"></i>
        			<input type="hidden" name="hiddenEdu" id = "hiddenEdu" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="certF();" id ="certMenu">
        			<span style="text-decoration: none;">
        				<i class="fa fa-drivers-license-o"></i> 자격증
        			</span>
        			<i class="fa fa-check w3-right" id ="certCheck"></i>
        			<input type="hidden" name="hiddenCert" id= "hiddenCert" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="awardF();" id ="awardMenu">
        			<span style="text-decoration: none;">
        				<i class="fa fa-diamond"></i> 수상
        			</span>
        			<i class="fa fa-check w3-right" id ="awardCheck"></i>
        			<input type="hidden" name="hiddenAward" id= "hiddenAward" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="langF();" id ="langMenu">
        			<span style="text-decoration: none;">
        			<i class="fa fa-globe"></i> 어학
        			</span>
        			<i class="fa fa-check w3-right" id ="langCheck"></i>
        			<input type="hidden" name="hiddenLang" id="hiddenLang" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="portfF();" id ="portfMenu">
        			<span style="text-decoration: none;">
        			<i class= "fa fa-server"></i> 포트폴리오
        			</span>
        			<i class="fa fa-check w3-right" id ="portfCheck"></i>
        			<input type="hidden" name="hiddenPort" id= "hiddenPort" value="0" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="introdF();" id ="introdMenu">
        			<span style="text-decoration: none;">
        			<i class="fa fa-newspaper-o"></i> 자기소개서
        			</span>
        			<i class="fa fa-check w3-right" id ="introdCheck" ></i>
        			<input type="hidden" name="hiddenIntrod" id="hiddenIntrod" value="0" />
        		</div>
        		<!-- If this New or Modify  -->
        		<c:set var ="rs" value="${resume}"/>
        		<c:choose>
        			<c:when test="${!empty rs}">
        				<button type="submit" class="w3-btn w3-cyan"  style="width: 50%;">수정</button>
        			</c:when>
        			
        			<c:otherwise>
        				<button type="submit" class="w3-btn w3-indigo"  style="width: 50%;">저장</button>
        			</c:otherwise>
        		</c:choose>
            	<button type="button" class="w3-btn w3-amber w3-right" style="width: 50%;">취소</button>
            </div>
        </div>
        
       <script>
    	// 학위
   		var degreeFlag = true; //1
    	var careerFlag = true; //2
    	var eduFlag = true; //3
    	var certFlag = true; //4 
    	var awardFlag = true; //5
    	var langFlag = true; //6
    	var portfFlag = true; //7
    	var introdFlag = true; //8
    	
    	//1
       function degreeF()
	   {	
	   		if(degreeFlag){
	   			if(confirm("학력 추가를 취소하겠습니까?"))
	   			{
	   				degreeFlag = !degreeFlag;
	   				changeMenucolor("degree" ,degreeFlag);
	   				$('#degreeForm').css('display','none');
	   			}
	   		}else
	   		{
	   			$('#degreeForm').css('display','block');
	   			degreeFlag = !degreeFlag;
	   			changeMenucolor("degree" ,degreeFlag);
	   		}
	   	}
    	
    	//3
    	function eduF(){
    		if(eduFlag){
    			if(confirm("교육 추가를 취소하겠습니까?")){
    				eduFlag = !eduFlag;
    				changeMenucolor("edu" ,eduFlag);
    				$('#eduForm').css('display', 'none');
    			}
    		}else{
    			$('#eduForm').css('display', 'block');
    			eduFlag  = !eduFlag;
    			changeMenucolor("edu" ,eduFlag);
    		}
    	}
    	
    	//4
    	function certF(){
    		if(certFlag){
    			if(confirm("자격증 추가를 취소하겠습니까?")){
    				certFlag = !certFlag;
    				changeMenucolor("cert" ,certFlag);
    				$('#certForm').css('display', 'none');
    			}
    		}else{
    			$('#certForm').css('display', 'block');
    			certFlag  = !certFlag;
    			changeMenucolor("cert" ,certFlag);
    		}
    	}
    	
    	//5
    	function awardF(){
    		if(awardFlag){
    			if(confirm("수상목록 추가를 취소하겠습니까?")){
    				awardFlag = !awardFlag;
    				changeMenucolor("award" ,awardFlag);
    				$('#awardForm').css('display', 'none');
    			}
    		}else{
    			$('#awardForm').css('display', 'block');
    			awardFlag  = !awardFlag;
    			changeMenucolor("award" ,awardFlag);
    		}
    	}
    	
    	//6
    	function langF(){
    		if(langFlag){
    			if(confirm("어학목록 추가를 취소하겠습니까?")){
    				langFlag = !langFlag;
    				changeMenucolor("lang" ,langFlag);
    				$('#langForm').css('display', 'none');
    			}
    		}else{
    			$('#langForm').css('display', 'block');
    			langFlag  = !langFlag;
    			changeMenucolor("lang" ,langFlag);
    		}
    	}
    	
    	//7
    	function portfF(){
    		if(portfFlag){
    			if(confirm("수상목록 추가를 취소하겠습니까?")){
    				portfFlag = !portfFlag;
    				changeMenucolor("portf" ,portfFlag);
    				$('#portfForm').css('display', 'none');
    			}
    		}else{
    			$('#portfForm').css('display', 'block');
    			portfFlag  = !portfFlag;
    			changeMenucolor("portf" ,portfFlag);
    		}
    	}
    	
    	//8
    	function introdF(){
    		if(introdFlag){
    			if(confirm("수상목록 추가를 취소하겠습니까?")){
    				introdFlag = !introdFlag;
    				changeMenucolor("introd" ,introdFlag);
    				$('#introdForm').css('display', 'none');
    			}
    		}else{
    			$('#introdForm').css('display', 'block');
    			introdFlag  = !introdFlag;
    			changeMenucolor("introd" ,introdFlag);
    		}
    	}
    
       	/* Check Icon disappear or appear  */
    	function changeMenucolor(name ,flag){
    		
    		var decideFlag = flag ?  "block" : "none"; 
    		var decideColor = flag ? "black" : "black";
    		var hiddenValue = flag ? 1 : 0;
    		
    		switch(name){
    			case "degree" : $('#degreeCheck').css('display', decideFlag); $('#degreeMenu').css('color', decideColor); $('#hiddenDegree').val(hiddenValue); break;
    			case "edu" : $('#eduCheck').css('display', decideFlag); $('#eduMenu').css('color', decideColor);  $('#hiddenEdu').val(hiddenValue); break;
    			case "cert" : $('#certCheck').css('display', decideFlag); $('#certMenu').css('color', decideColor); $('#hiddenCert').val(hiddenValue); break;
    			case "award" : $('#awardCheck').css('display', decideFlag); $('#awardMenu').css('color', decideColor);  $('#hiddenAward').val(hiddenValue);break;
    			case "lang" : $('#langCheck').css('display', decideFlag); $('#langMenu').css('color', decideColor);  $('#hiddenLang').val(hiddenValue); break;
    			case "portf" : $('#portfCheck').css('display', decideFlag); $('#portfMenu').css('color', decideColor); $('#hiddenPort').val(hiddenValue); break;
    			case "introd" : $('#introdCheck').css('display', decideFlag); $('#introdMenu').css('color', decideColor); $('#hiddenIntrod').val(hiddenValue); break;
    		}
    	}
       	
       </script>