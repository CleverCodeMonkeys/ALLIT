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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/common/css/summernote.css">


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/css/summernote.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/css/lang/summernote-ko-KR.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Correction</title>
</head>
<style>
    #article{
        margin-left: 15px;
    }

    .layout-container{
        margin-left: 15%;
        margin-right: 15%;
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

    .sidebar-nav{
        display: block;
        background-color: #004c92;
        color : #f8f8f8;
        z-index: 0;
        height: 800px; 
    }

    .panel{
        background-color: white;
        border:1px solid transparent;
    }

    .panel-default{
        border-color: #ddd;
    }

    .panel-head{
        
        border-bottom: 1px solid #ddd;
        padding: 10px 15px;
    }

    .form-control{
        display: block;
        width: 100%;
        padding: 6px 12px;
        border: 1px solid #ccc;
        background-color: #fff;
    }

    #note{
        height: 500px;
        resize: none;
        overflow:auto;
    }    
    /* .toolbar{
        display: block;
        width: 100%;
        border: 1px solid #ccc;
        background-color: #fff;
    } */
    
    #buttons-fieldset{
    	border: 0;
    }
    #form-fieldset{
    	border: 0;
    }
    
    #title-textarea{
    	resize : none;
    }
    
    #titleCounter{
    	border:1px solid #0080FF;
 		border-radius: 0.5em;
 	 	padding: 0.1em 0.1em;
	 	font-size: 1em;
    }
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	<!-- 전체를 감싸는 div -->
    <div class="layout-container w3-row">
        <div class="main">
            <!-- 메인 부분을 감싸는 div -->
            <div id="article" class="content all-list w3-col m7" role="main" style="margin-right: 30px;">
                <div class="content-header">
                    <h3 style="font-family: vitamin;">첨삭 이력서 작성하기</h3>
                </div>
                <div class="panel panel-default">
                    <div class="panel-head">
                        <div class="panel-userId" style="display: inline;">
                           		${m.id }
                        </div>                        
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/correction/correctionWriteEnd.correct" method="POST" role="form" enctype="multipart/form-data" class="article-form" id="myForm" onsubmit="return saveForm();">
                        	<input type="file" name="file" id="testFile" style="display : none;">
                            <fieldset id="form-fieldset" class="form">
                                <div class="form-group">
	                                <input type="text" name="writeId" value="${m.id }" style="display: none; font-family: penB;"/>
                                    <div>
										<textarea class="form-control w3-col m11" name="title" id="title-textarea" cols="30" rows="1" placeholder="제목은 45자 제한" maxlength="45" ></textarea>
										<span id="titleCounter" class="w3-col m1" style="float:right;">###</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div>      
                                   		
                                    </div>
                                </div>

                                <div class="form-group">
									<div class ="w3-white" style ="height:60px;"></div> <!-- Spare Space -->
                                    <textarea name="content" id="summernote"></textarea> 
                                </div>
                                
                                

                                <div class="nav" role="navigation">
                                    <fieldset id="buttons-fieldset" class="buttons">
                                        <a href="#" class="btn btn-default " onclick="cancle()">취소</a>                                      
                                        <input type="submit" class="enroll btn btn-success pull-right" value="등록">
                                    </fieldset>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    
                    
                </div>
            </div>
            <!-- 이력서 보기 창 -->
            <div id="resumeView" class="content all-list w3-col m4" role="main">
            	<div class="content-header">
                    <h3 style="font-family: vitamin;">내  자소서 확인하기</h3>   
                </div>
		<%-- <button type="button"  onclick="resumeModal('${m.id}');"  class="btn btn-default pull-right" >이력서 불러오기</button> --%>  
               <div class="panel panel-default">
                    <div class="panel-head">
                    	<div style="display: inline; font-family: penB;" >
                    		자소서 확인   
                        	<input type="button" onclick="resumeModal('${m.id}');"  class="pull-right" value="자소서 불러오기" />
                        </div>                    
                    </div>
                    <div class="panel-body">
                     	<!-- <input type="file" name="file" id="testFile" style="display : none;"> -->
                             <div class="form-group">
                                 
                             </div>
                             <div class="form-group">					
                                 <div id="resumeValue"></div> 
                             </div>
                    </div>  
                </div>
            </div>
        </div>                
    </div>
    
   <!-- Modal -->
	<div id="resume" class="w3-modal" style="z-index: 1100;" >
	   <div class="w3-modal-content w3-animate-top" style ="width: 500px;">
	      <header class="w3-container w3-amber w3-center"> 
   			<h2 style="font-family:vitamin">내 자소서</h2>
   			<span onclick="document.getElementById('resume').style.display='none'" class="w3-button w3-display-topright">&times;</span>
	      </header>
	      
	      <div id="resumeBody" class="w3-container member">
	      	<form class="w3-container" action="${pageContext.request.contextPath}/correction/correctionResumeModal.correct" method="POST" onsubmit="return closeModal();">
		         	<!-- append를 통해  작성 -->
	      	</form>
	      </div>
   		 </div>
	  </div>

    <script>
       //제목 글자수 제한하기
       $(function(){
    	   $('#title-textarea').keyup(function(){
    		  var title = $('#title-textarea').val(); 
    		  $('#titleCounter').text(title.length+'/45');
    	   });
    	   $('#title-textarea').keyup();
       });
       
       $(function() {
    	    $('#summernote').summernote({
    	      width: '100%',       
    	      height: 300,          // 기본 높이값
    	      minHeight: null,      // 최소 높이값(null은 제한 없음)
    	      maxHeight: null,      // 최대 높이값(null은 제한 없음)
    	      focus: true,          // 페이지가 열릴때 포커스를 지정함
    	      lang: "ko-KR",         // 한국어 지정(기본값은 en-US)
    	      callbacks: {
    	      onImageUpload: function(files, editor, welEditorble) {   	    	  
    	  	  for(var i = files.length-1; i>=0; i--){
    	      var data = new FormData();
    	      data.append("file",files[i]);
    	      data.append("userId", '${m.id}');
    	      var userId = '${m.id}';
    	      var $note = $(this);
    	      $.ajax({
    	        	
    	         data : data,
    	         type : "post",
    	         url : '${pageContext.request.contextPath}/correction/correctionWriteImageEncoding.correct', // servlet url
    	         cache : false,
    	         contentType : false,
    	         processData : false,
    	         success : function(url){
    	            
    	            $note.summernote('insertImage',url);
    	         }, error : function(request,status,error) {
    	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	         }
    	     	});
    	  	  }
    	      }
    	      
    	      }
    	      
    	    });
    	  });
     	 
       //모달 창 띠우기
      function resumeModal(userId){
    	   var id = userId;
    	   console.log(id);
    	   $.ajax({
    		  url : "${pageContext.request.contextPath}/correction/correctionResumeModal.correct",  
    		  type : "POST",
    		  data : {id : id},
    		  success : function(data) {
						
					var j = 0;
					var resumeDiv = $("<div id='resumeDiv' style='margin-top:10px;'>")					
					var resumeTable = $("<table style='cellpadding: 5px;'>");
					
					$('#resume').children('div').children('div').children('form').children('div').css("display","none");
					$(resumeTable).append("<b>자소서 제목</b><br>");
									
					for(var i in data){
						var num = ++j;
						/* $(resumeTable).append("<tr>"+"<td>"+"&nbsp"+num+"</td>"+"<td>"+data[i].resumeTitle+"</td>"+"</tr>"); */
						$(resumeTable).append("<input type='radio' name='resume' value='"+data[i].resumeContent+"'>"+data[i].resumeTitle+"<br>");

					}
					
					$(resumeDiv).append(resumeTable);
					$(resumeDiv).append("<button class='w3-button w3-block w3-indigo w3-section w3-padding' type='button' onclick='insertResume();'>자소서 등록</button>");
					
					$('#resume').children('div').children('div').children('form').append(resumeDiv);
			
					$('#resume').css("display", "block");
					
				},
				error : function() {
					alert("에러발생");
				}
    	   });	  
       } 
       
       // 이력서 modal 등록 버튼
       function insertResume(){
    	   $('#resumeValue').empty();
    	  	var resumeContent= $("input[name='resume']:checked").val();
    	 	  console.log(resumeContent);
    	  

    	 	$('#resumeValue').prepend(resumeContent);
    	   
    	  
    	   $('#resume').css("display", "none");
       }
       
       
       
       /* function() {
      	    $('#summernote').summernote({
      	      width: '100%',       
      	      height: 300,          // 기본 높이값
      	      minHeight: null,      // 최소 높이값(null은 제한 없음)
      	      maxHeight: null,      // 최대 높이값(null은 제한 없음)
      	      focus: true,          // 페이지가 열릴때 포커스를 지정함
      	      lang: "ko-KR",         // 한국어 지정(기본값은 en-US)
      	      callbacks: {
      	      onImageUpload: function(files, editor, welEditorble){
      	      		for(var i = files.length -1; i>=0; i--){
      	      			console.log("썸머노트");
      	      			sendFile(files[i]);
      	      			console.log(files[i]);
      	      			}  
      	      		}
      	     	 } 
      	      });
    	  });
    	  
    	  function sendFile(file){
    		  var form = $('#testFile');
    		  var form_data = new FormData(form);
    		  
    		  form_data.append('file', file);
    		  console.log(file);
    		  console.log(form_data);
    		  $.ajax({
    			  data: { "file" : form_data },
    			  // enctype: "multipart/form-data",
    		      processData: false,
    		      contentType:false,
    		      type: "POST",
    			  url: "${pageContext.request.contextPath}/correction/correctionWriteImageEncoding.correct",
    			  cache:false,
    		      success: function(url){
    		    	  $note.summernote('insertImage', url);
    		      }, 
    		      error : function() {
    		            alert(form_data+"........");
    		      }
    		  });
    	  } */

    	  
       //등록 버튼
       function saveForm(){
			var title = $('#title-textarea').val();
			var content = $('#summernote').val();
			
			if(title == null || title.length == 0 || content == null || content.length == 0){
				alert("공백값은 등록되지 않습니다");
				return false;
			}
			else return true;
  	   }
       
       //취소 버튼
       function cancle(){
    	  var cancle = confirm("정말로 취소하시겠습니까?");
    	  
    	  if(cancle == true) location.href = '${pageContext.request.contextPath}/correction/correction.correct';
    	  else{}
 			
       }
    </script>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>