<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume View</title>
<style>
.viewTitle{
	font-family: "penB";
	font-size: 3em;
}
</style>
</head>

<body class="w3-light-gray">
   <c:import url="/WEB-INF/views/common/header.jsp" charEncoding="UTF-8"/>
   <div class ="w3-light-gray" style ="height:100px;"></div>
   
	<div class="w3-row w3-light-grey" style="padding-left:25%; padding-right: 25%;">
		<div class = "w3-row w3-white">
			<div class = "viewTitle w3-center">${resume.resume.title}</div>
		</div>
		
		<div class= "w3-row">
			<div class ="w3-col m3">
				<img style ="width: 80%; height: 220px;" 
				src = "${pageContext.request.contextPath}/resources/images/logo/${resume.resume.photo}">
			</div>
			
			<div class = "w3-col m9">
				<div class ="w3-col m4">
					${resume.resume.name}
				</div>
			</div>
		</div>
			
	</div>
</body>
</html>