<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class = "w3-teal boxTitle w3-center">제목</div>
            <div class = "w3-container w3-white boxForm" style ="padding:3%;">
            	<input id="title" name="title" type="text" class="cInput"
            	placeholder="나를 알릴 수 있는 제목을 입력해주세요." 
            	style ="font-family: vitamin; font-size: 2em;" required="required" value ="${resume.resume.title}">
</div>

<script>
/* 일반회원 각 항목 제한 입력 수 [START]*/
var titleMax = 30;
$('#title').keyup(function(event){
	var value = $(this).val().length;
	if(value >  titleMax)
		$(this).val($(this).val().substring(0,titleMax));
});
</script>