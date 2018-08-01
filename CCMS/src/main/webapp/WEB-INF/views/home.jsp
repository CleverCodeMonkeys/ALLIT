<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
	<title>ALL IT</title>
	<script src="${pageContext.request.contextPath }/resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/common/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/common/js/owl.carousel.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/common/css/owl.carousel.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/common/css/owl.theme.default.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/intro/css/intro.css">
</head>
<style>
a{
cursor: pointer;
}

.news{
	line-height: 1.2em;
	font-family: penB;
}
</style>
<body>
<!-- Header  -->
<c:import url="common/header.jsp" charEncoding="UTF-8"/>
<div class ="w3-white" style ="height:100px;"></div>

<div class="page">
  <h1 class="page-title">ALL IT</h1>
  
    <!-- [START]  -->
    <c:import url="intro/rank1.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank2.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank3.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank4.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank5.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank6.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank7.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank8.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank9.jsp" charEncoding="UTF-8"/>
    
    <c:import url="intro/rank10.jsp" charEncoding="UTF-8"/>
    <!-- [END] -->
 
</div>

<!-- black line [notice news end tag]  -->
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%;">
	<div class="w3-white" style ="height: 77px; margin-bottom: 50px; margin-top: 50px;"></div>
</div>

<!-- gatner movie -->
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%;">
	<div class ="w3-col m6">		 
		<div class="owl-carousel owl-theme" style="z-index: 0; height: 400px; box-shadow: 5px 10px orange">			 			
    		 <div class="item-video"><a class="owl-video" href="https://www.youtube.com/watch?v=TPbKyD2bAR4"></a></div>    	     
		</div>
	</div>
	
	<div class = "w3-col m6" style ="padding-left: 5%; padding-right: 5%;">
		<h1 class="w3-center" style ="font-family: vitamin">The Intelligent Digital Mesh</h1>
		<br><br>
		<p class ="news">Gartner calls the entwining of people, devices, content and services the intelligent digital mesh. It’s enabled by digital models, business platforms and a rich, intelligent set of services to support digital business.</p>
		
		<br>
		<span class ="news"><b class ="w3-text-red">Intelligent:</b> How AI is seeping into virtually every technology and with a defined, well-scoped focus can allow more dynamic, flexible and potentially autonomous systems.</span> <br><br>
		
		<span class ="news"><b class ="w3-text-red">Digital:</b> Blending the virtual and real worlds to create an immersive digitally enhanced and connected environment.</span> <br><br>
		
		<span class ="news"><b class ="w3-text-red">Mesh:</b> The connections between an expanding set of people, business, devices, content and services to deliver digital outcomes.</span>
	</div>
</div>

<!-- black line [notice news end tag]  -->
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%;">
	<div class="w3-black" style ="height: 15px; margin-bottom: 50px; margin-top: 100px;"></div>
</div>

<!-- Line Under Moive  -->
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; height: 100px;">
</div>

 <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
	  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
	  <div class="w3-modal-content w3-animate-zoom">
	    <img id="img01" style="width:100%">
	  </div>
</div>


<!-- Footer -->
<c:import url="common/footer.jsp" charEncoding="UTF-8"/>

<script>
function onClick(element) {
	console.log(element + " 이거 맞아?");
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}

function changeArticle(data){
	console.log(data);
	/* display : none all */
	$('#grid1').css('display', 'none');
	$('#grid2').css('display', 'none');
	$('#grid3').css('display', 'none');
	$('#grid4').css('display', 'none');
	$('#grid5').css('display', 'none');
	$('#grid6').css('display', 'none');
	$('#grid7').css('display', 'none');
	$('#grid8').css('display', 'none');
	$('#grid9').css('display', 'none');
	$('#grid10').css('display', 'none');
	
	switch(data)
	{
		case '1' : $('#grid1').show(); break;
		case '2': $('#grid2').show(); break;
		case '3': $('#grid3').show();  break;
		case '4': $('#grid4').show();  break;
		case '5': $('#grid5').show();  break;
		case '6': $('#grid6').show(); break;
		case '7': $('#grid7').show();  break;
		case '8': $('#grid8').show();  break;
		case '9': $('#grid9').show();  break;
		case '10': $('#grid10').show();  break;
	}
}

 jQuery(document).ready(function($) {
	$('.owl-carousel').owlCarousel({
	        items:1,
	        merge:true,
	        loop:true,
	        margin:10,
	        video:true,
	        center:true,
	    }); 
}); 



</script>
</body>
</html>
