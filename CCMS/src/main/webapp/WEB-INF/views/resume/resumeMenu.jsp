<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<style>
.cbx {
  margin: auto;
  -webkit-user-select: none;
  user-select: none;
  cursor: pointer;
}
.cbx span {
  display: inline-block;
  vertical-align: middle;
  transform: translate3d(0, 0, 0);
}
.cbx span:first-child {
  position: relative;
  width: 18px;
  height: 18px;
  border-radius: 3px;
  transform: scale(1);
  vertical-align: middle;
  border: 1px solid #9098A9;
  transition: all 0.2s ease;
}
.cbx span:first-child svg {
  position: absolute;
  top: 3px;
  left: 2px;
  fill: none;
  stroke: #FFFFFF;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-dasharray: 16px;
  stroke-dashoffset: 16px;
  transition: all 0.3s ease;
  transition-delay: 0.1s;
  transform: translate3d(0, 0, 0);
}
.cbx span:first-child:before {
  content: "";
  width: 100%;
  height: 100%;
  background: #506EEC;
  display: block;
  transform: scale(0);
  opacity: 1;
  border-radius: 50%;
}
.cbx span:last-child {
  padding-left: 8px;
}
.cbx:hover span:first-child {
  border-color: #506EEC;
}

.inp-cbx:checked + .cbx span:first-child {
  background: #506EEC;
  border-color: #506EEC;
  animation: wave 0.4s ease;
}
.inp-cbx:checked + .cbx span:first-child svg {
  stroke-dashoffset: 0;
}
.inp-cbx:checked + .cbx span:first-child:before {
  transform: scale(3.5);
  opacity: 0;
  transition: all 0.6s ease;
}

@keyframes wave {
  50% {
    transform: scale(0.9);
  }
}
</style>    
    	<!-- [RIGHT SIDE BAR] Remote Controller -->
		<div class="w3-col m3 w3-sidebar w3-white w3-light-gray" style="right:0; margin-top: 5%; padding-left: 3%;">
			<div class = "w3-row" style ="margin-right: 55%; font-family: penB; padding-top: 2%; padding-bottom: 2%;">
				<input class="inp-cbx" id="cbx" type="checkbox" style="display: none;"/>
				<label class="cbx" for="cbx"><span>
	    		<svg width="12px" height="10px" viewbox="0 0 12 10">
	      		<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
	    		</svg></span><span>기본정보 추가</span></label>
    		</div>
        	<div class ="w3-white" style ="margin-right: 50%; font-family: penB; padding-top: 2%;">     	
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="degreeF();" id ="degreeMenu">
	        		<span style="text-decoration: none;">
	        		<i class="fa fa-graduation-cap"></i> 학력
	        		</span> 
        		<i class="fa fa-check w3-right" id ="degreeCheck"></i>
        		<input type="hidden" name="hiddenDegree" id ="hiddenDegree" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="eduF();" id ="eduMenu">
        			<span style="text-decoration: none;">
        			<i class= "fa fa-book"></i> 교육
        			</span>
        			<i class="fa fa-check w3-right" id ="eduCheck"></i>
        			<input type="hidden" name="hiddenEdu" id = "hiddenEdu" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="certF();" id ="certMenu">
        			<span style="text-decoration: none;">
        				<i class="fa fa-drivers-license-o"></i> 자격증
        			</span>
        			<i class="fa fa-check w3-right" id ="certCheck"></i>
        			<input type="hidden" name="hiddenCert" id= "hiddenCert" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="awardF();" id ="awardMenu">
        			<span style="text-decoration: none;">
        				<i class="fa fa-diamond"></i> 수상
        			</span>
        			<i class="fa fa-check w3-right" id ="awardCheck"></i>
        			<input type="hidden" name="hiddenAward" id= "hiddenAward" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="langF();" id ="langMenu">
        			<span style="text-decoration: none;">
        			<i class="fa fa-globe"></i> 어학
        			</span>
        			<i class="fa fa-check w3-right" id ="langCheck"></i>
        			<input type="hidden" name="hiddenLang" id="hiddenLang" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="portfF();" id ="portfMenu">
        			<span style="text-decoration: none;">
        			<i class= "fa fa-server"></i> 포트폴리오
        			</span>
        			<i class="fa fa-check w3-right" id ="portfCheck"></i>
        			<input type="hidden" name="hiddenPort" id= "hiddenPort" value="1" />
        		</div>
        		
        		<div class ="w3-panel w3-large" style ="cursor: pointer;" onclick="introdF();" id ="introdMenu">
        			<span style="text-decoration: none;">
        			<i class="fa fa-newspaper-o"></i> 자기소개서
        			</span>
        			<i class="fa fa-check w3-right" id ="introdCheck" ></i>
        			<input type="hidden" name="hiddenIntrod" id="hiddenIntrod" value="1" />
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
    	/* var careerFlag = true; //2 */
    	var eduFlag = true; //3
    	var certFlag = true; //4 
    	var awardFlag = true; //5
    	var langFlag = true; //6
    	var portfFlag = true; //7
    	var introdFlag = true; //8
    	
    	$(function(){
    			if('${resume}' == "") return;
    		
    			degreeFlag = '${resume.degreeList.size()}' > 0 ? true : false;
    			eduFlag = '${resume.academyList.size()}' > 0 ? true : false;
    			certFlag = '${resume.certificateList.size()}' > 0 ? true : false;
    			awardFlag = '${resume.awardList.size()}' > 0 ? true : false;
    			langFlag = '${resume.certiLanguageList.size()}' > 0 ? true : false;
    			portfFlag = '${resume.portpolioList.size()}' > 0 ? true : false;
    			introdFlag = '${resume.introductionList.size()}' > 0 ? true : false;
    			
    			changeMenucolor("degree" , degreeFlag);
    			changeMenucolor("edu" , eduFlag);
    			changeMenucolor("cert" , certFlag);
    			changeMenucolor("award" , awardFlag);
    			changeMenucolor("lang" , langFlag);
    			changeMenucolor("portf" , portfFlag);
    			changeMenucolor("introd" , introdFlag);
    			
    			$('#degreeForm').css('display',flaging(degreeFlag));
    			$('#eduForm').css('display', flaging(eduFlag));
    			$('#certForm').css('display', flaging(certFlag));
    			$('#awardForm').css('display', flaging(awardFlag));
    			$('#langForm').css('display', flaging(langFlag));
    			$('#portForm').css('display', flaging(portfFlag));
    			$('#introdForm').css('display', flaging(introdFlag));
    	 });
    	
    	function flaging(flag){
    		if(flag) return 'block';
    		else return 'none';
    	}
    	
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
    			if(confirm("포트폴리오 추가를 취소하겠습니까?")){
    				portfFlag = !portfFlag;
    				changeMenucolor("portf" ,portfFlag);
    				$('#portForm').css('display', 'none');
    			}
    		}else{
    			$('#portForm').css('display', 'block');
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
    		console.log( name + ":  : " + hiddenValue + " : : " + flag);
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
       	
       	$('#cbx').on('change', function(){
       		
       		/* 기본 정보 가져오기 */
       		if($("#cbx").is(":checked")){
       			if(confirm("기본정보를 불러오시겠습니까?")){
       				$.ajax({
       					url : "${pageContext.request.contextPath}/resume/callProfile.resume",
       					type : "post",
       					success: function(data){
       						if(data.result == 'success'){
           						var address = data.pro.address;
           						var birth = data.pro.birth;
           						var gender = data.pro.gender;
           						var language = data.pro.language;
           						var name = data.pro.name;
           						var tel = data.pro.tel;
           						var email = data.pro.email;
           						
           						$('#address').val(address);
           						$('#birth').val(birth);
           						$('#pEmail').val(email);
								$('#tel').val(tel);
								$('#name').val(name);
								
           						if(gender == 'M')
           							$('#yes-button').attr('checked', true);
           						else
           							$('#no-button').attr('checked', true);
           						   
       						}else{
       							alert('기본정보가 없습니다.');
       						}
       					}, error: function(data){
       						console.log(data + "error");
       					}
       				});
       			}
            }
       	});
  
       </script>