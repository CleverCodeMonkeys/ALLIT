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
    .toolbar{
        display: block;
        width: 100%;
        border: 1px solid #ccc;
        background-color: #fff;
    }
    
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
            <div id="article" class="content all-list w3-col m8" role="main">
                <div class="content-header">
                    <h3>첨삭 이력서  수정하기</h3>
                    
                </div>
                <div class="panel panel-default">
                    <div class="panel-head">
                        <div class="panel-userId" style="display: inline;">
                           		${m.id}
                        </div>                        
                    </div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/correction/correctionModifyEnd.correct" method="POST" role="form" enctype="multipart/form-data" class="article-form" id="myForm" onsubmit="return saveForm();">
                        	<input type="file" name="file" id="testFile" style="display : none;">
                        	<input type="text" name="cId" style="display : none;" value="${cId}">
                        	<input type="text" name="userId" style="display : none;" value="${m.id}">
                            <fieldset id="form-fieldset" class="form">
                                <div class="form-group">
	                                <input type="text" name="writeId" value="${m.id}" style="display: none;"/>
                                    <div>
										<textarea class="form-control w3-col m11" name="title" id="title-textarea" cols="30" rows="1" placeholder="제목은 45자 제한" maxlength="45" >${title}</textarea>
										<span id="titleCounter" class="w3-col m1" style="float:right;">###</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    
                                    <div>
                                        <input type="button" class="btn btn-default pull-right" value="이력서 불러오기">
                                    </div>
                                </div>

                                <div class="form-group">
									<div class ="w3-white" style ="height:60px;"></div> <!-- Spare Space -->
                                    <textarea name="content" id="summernote" >${content}</textarea> 
                                </div>

                                <div class="nav" role="navigation">
                                    <fieldset id="buttons-fieldset" class="buttons">
                                        <a href="#" class="btn btn-default " onclick="cancle('${cId}')">취소</a>                                      
                                        <input type="submit" class="enroll btn btn-success pull-right" value="등록">
                                    </fieldset>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    
                    
                </div>
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
       function cancle(cId){
    	  var cancle = confirm("정말로 취소하시겠습니까?");
    	  
    	  if(cancle == true) {
    		  location.href ='${pageContext.request.contextPath}/correction/correctionView.correct?no='+cId;
    	  }
    	  else{
    		  return false;
    	  }
    		 
    	  
       }
    </script>
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
</body>
</html>