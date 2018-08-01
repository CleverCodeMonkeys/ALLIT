<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<meta charset="UTF-8">
<title>My Resume</title>
</head>
<style>
.tab_font{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
	border-right: 5px solid black;
}

.tab_font2{
	font-family: vitamin;
	font-size: 1.3em;
	padding-top: 3%;
}

.sub_menu_padding{
	margin-top: 1%;
	padding-top: 2%;
	padding-bottom: 2%;
	font-family: penB;
}

.h3_font{
	font-family: whiteCloud;
	font-size: 1.2em;
}

.btn{
	font-size: 15px;
	
}
th{
	 vertical-align: middle !important;
	 font-size:13pt !important;
}

td{
 	vertical-align: middle !important;
	font-size:11pt !important;
}

.title{
	cursor:pointer;
	text-align:left;
	font-size:11pt;
}
</style>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
	<div class ="w3-white" style ="height:100px;"></div> <!-- Spare Space -->
	
	<div class ="w3-amber w3-center" style ="padding-top: 1%; padding-bottom: 1%; margin-left: 15%; margin-right: 15%;">
		<h1 style="font-family: vitamin;">${m.id} 님의 이력서</h1>
	</div>
	
	<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; margin-bottom: 15%; margin-top: 1%;">
		<div class ="w3-col m2 w3-center tab_font w3-white">
  			<c:import url ="/WEB-INF/views/resumeList/resumeListMenu.jsp" charEncoding="UTF-8"/>
  			
		</div>
	
		<div class ="w3-col m9 w3-center tab_font2 w3-white" style ="margin-left:3%;">
		
			<label style="margin-right:80%;" ><input type="checkbox" id="filterResume" onclick="filterResume();" > 올린이력서만 보기</label>
		
			<table id="tbl-board" class="table table-striped table-hover">
	 				<tr class="w3-white">
	 					<th style="width:11%;">내 이력서 올리기</th>
	 					<th style="width:42%;">제목</th>
	 					<th style="width:13%;">작성일</th>
	 					<th style="width:13%;">수정일</th>
	 					<th style="width:10%;"></th>
	 					<th style="width:10%;"></th>
	 				</tr>
	 				<c:forEach items="${list}" var ="r">	 					
	 					<tr class="w3-white resumeBox">
	 					<input type="hidden" value="${r.display}" class="display"/>	 						
	 						<td>
		 						<c:if test="${r.display eq 'Y'}">
		 							<img src="${pageContext.request.contextPath }/resources/images/common/checked2.png" class="showResume" style="cursor:pointer;"  />
	 							</c:if>
	 							<c:if test="${r.display eq 'N'}">
		 							<img src="${pageContext.request.contextPath }/resources/images/common/checked.png" class="showResume" style="cursor:pointer;" />
	 							</c:if>
	 							<input type="hidden" value="${r.id}"/>
	 						</td>
	 						<td id="${r.id}" class="title">${r.title}</td>
	 						<td>${r.registDate}</td>
	 						<td>${r.updateDate}</td>
	 						<td><button onclick="modify(id);" class="btn w3-button w3-blue" type ="button" id="M${r.id}">수정</button></td>
	 						<td><button onclick="rDelete(id)" class="btn w3-button w3-pink" type="button" id ="D${r.id}" style="margin-left:-30px;">삭제</button></td>
	 					</tr>
	 				</c:forEach>
	 			</table>
	  		</div>
	  		
	</div>
	<%-- <% 
      int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
      int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
      
      //파라미터 cPage가 null이거나 "" 일 때에는 기본값 1로 세팅함.  
      String cPageTemp = request.getParameter("cPage");
      int cPage = 1;
      try{
         cPage = Integer.parseInt(cPageTemp);
      } catch(NumberFormatException e){
         
      }
      
   %>
   <!-- 페이지 처리 -->
   <%= com.kh.ccms.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "resumeList.resume") %> --%>
	
	<div style ="height: 50px;"></div>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8"/>
	<script>
				
			$('.showResume').on('click',function(){				
				var chk = "N";		
				var id = $(this).siblings('input').val();
				var msg = $(this).attr('src') == "${pageContext.request.contextPath }/resources/images/common/checked.png" ? 
						"올리겠습니까?" : "내리시겠습니까?";
				
				if(confirm(msg)){
					if($(this).attr('src') == "${pageContext.request.contextPath }/resources/images/common/checked.png"){
						$(this).attr('src', "${pageContext.request.contextPath }/resources/images/common/checked2.png");
						chk = "Y";
						
						
					}else{
						$(this).attr('src',"${pageContext.request.contextPath }/resources/images/common/checked.png");
						chk = "N";	
					};	
					
					$(this).parent().siblings().val(chk);
					filterResume();
					
					$.ajax({
						url:"${pageContext.request.contextPath}/resumeList/displayResume.resume",
						type: "post",
						data: {
							id : id,
							chk : chk
						},
						success: function(data){					
									
						},
						error : function(data){
							console.log(data);
						}
						
					}); 
				}
				
				
		});
		
		function filterResume(){
			
			 if($('input:checkbox[id="filterResume"]').is(":checked") == true){

				$('.resumeBox').each(function() {
				
					if($(this).children('.display').val() == 'N') {
						$(this).hide();
					}
					
				})
				 
			 }else{
				 $('.resumeBox').each(function() {
						
						if($(this).children('.display').val() == 'N') {
							$(this).show();
						}
						
					})
			 }
			 
/* 			 $.ajax({
					url:"${pageContext.request.contextPath}/resumeList/filterResume.resume",
					type:"post",
					data:{
						chk : chk
					},
					success:function(data){
						console.log(data);
						
					},error : function(data){
						console.log(data);
					}
				});  */	
		}
		
		
		$(function(){
			$("td[id]").on("click",function(){
				var id = $(this).attr("id");
				console.log("id = " + id);
				location.href= "${pageContext.request.contextPath}/resume/resumeView.resume?resumeId="+id;
			});
		});
		 
		function modify(id){
			// 내 Controller Reusme -> id 
			 id = id.substring( 1, id.length ); 
			 console.log(id);	
			 location.href= "${pageContext.request.contextPath}/resume/resume.resume?resumeId="+id;  
		}
		
		function rDelete(id){
			id = id.substring( 1, id.length ); 
			
			if(confirm('정말 지울꺼니?')){
				location.href= "${pageContext.request.contextPath}/resumeList/deleteResume.resume?id="+id;	
			}
		}
		
	</script>
</body>
</html>