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


.responsive-table li {
  border-radius: 3px;
  padding: 25px 30px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 25px;
}
.responsive-table .table-header {
  /* background-color: #95A5A6; */
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 0.03em;
}
.responsive-table .table-row {
  background-color: #ffffff;
  box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
  font-family: penB;
  font-size: 1.1em;
}
.responsive-table .col-1 {
  flex-basis: 10%;
}
.responsive-table .col-2 {
  flex-basis: 30%;
}
.responsive-table .col-3 {
  flex-basis: 10%;
}
.responsive-table .col-4 {
  flex-basis: 10%;
}

.fa-angle-up{
	font-size:1.1em !important;
	color:green !important; 
	font-weight: bold !important;
}

.fa-angle-down{
	font-size:1.1em !important;
	color:red !important; 
	font-weight: bold !important;
}

.fa-angle-double-up{
	font-size:1.1em !important;
	color:green !important; 
	font-weight: bold !important;
}

.tiobeNews{
	line-height: 1.5em;
	font-family: penB;
}

/* Create a Parallax Effect */
.bgimg-1{
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
   background-size: inherit;
   margin-top: 8%;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('${pageContext.request.contextPath}/resources/intro/backimage/bg8.gif');
    height: 55%;
    padding-top: -50px !important;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1{
        background-attachment: scroll;
    }

}
</style>
<body>
<!-- Header  -->
<c:import url="common/header.jsp" charEncoding="UTF-8"/>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container" id="home">
  <div class="w3-display-topmiddle" style="white-space:nowrap; font-family: penB">
    <span class="w3-center w3-padding-large w3-amber w3-xlarge w3-wide">신입<span class="w3-hide-small"> 프로그래머</span>는 IT의 미래입니다.</span> 
  </div>
</div>

<br><br>

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
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; height: 50px;">
</div>

<!-- Git Hub Rank Language -->
<div class = "w3-row" style ="margin-bottom: 5%;">
	<h1 class ="w3-center" style ="font-family: vitamin; font-size: 5em;">TIOBE Rank Language</h1>
</div>

<div class = "w3-row" style ="padding-left: 15%; padding-right: 15%;">
	<div class ="w3-col m5">
		<h1 style ="font-family: vitamin;">TIOBE Index for August 2018</h1> <br>
		<h3 style ="font-family: penB; color:gray;">Python is approaching the top 3 for the first time</h3>
		
		<p class ="tiobeNews">Programming language Python is getting very close to the top 3 of the TIOBE index. 
		If Python surpasses C++ and becomes number 3, this will be an all time high for the scripting language 
		of Guido van Rossum. In 2005 there was a study what programming language was taught most at US 
		universities and Java appeared to be a clear number one with 60% of all introductory programming courses.
		 Similar research was conducted almost 10 years later in 2014 and the outcome was different. 
		 This time Python was a clear winner with more than 70% "market share". 
		 This Python boost is also visible in the TIOBE index. But industry is adopting Python as well. 
		 The Python programming language started as a successor of Perl to write build scripts and all kind of 
		 glue software. But gradually it entered also other domains. Nowadays it is quite common to have Python
		  running in large embedded systems. So it is very likely that Python will enter the top 3 and even might 
		  become the new number 1 in the long run. Other interesting news is that Hack, Groovy and 
		  Julia re-entered the top 50, whereas TypeScript lost a few places and is now at position 62.</p>
		  <br>
		  <p class ="tiobeNews">
		  <b style ="color:red;">IMPORTANT NOTE. </b>SQL has been added again to the TIOBE index since February 2018. The reason for this is that SQL appears to be Turing complete. As a consequence, there is no recent history for the language and thus it might seem that the SQL language is rising very fast. This is not the case.
		  </p>
		  
		  <br><br>
		  
		  <img src = "${pageContext.request.contextPath}/resources/intro/backimage/augRating.png"
		  style ="width: 100%; cursor: pointer; box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);" onclick="onClick(this);">
		  
		  <br><br><br>
		  
		  <p class ="w3-right tiobeNews">CopyRight : 
		  <a href = "https://www.tiobe.com" target="_blank" class ="w3-hover-text-indigo">https://www.tiobe.com</a></p>
	</div>

	<div class ="w3-col m7">
		<ul class="responsive-table">
		    <li class="table-header w3-amber" style ="font-family: vitamin; font-size: 1.2em;">
		      <div class="col col-1">AUG 2018</div>
		      <div class="col col-1">AUG 2017</div>
		      <div class="col col-1">change</div>
		      <div class="col col-2">Language name</div>
		      <div class="col col-3">Rating</div>
		      <div class="col col-4">Change</div>
		    </li>
		    <li class="table-row">
		      <div class="col col-1">1</div>
		      <div class="col col-1">1</div>
		      <div class="col col-1"></div>
		      <div class="col col-2">Java</div>
		      <div class="col col-3">16.881%</div>
		      <div class="col col-4">+3.92%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">2</div>
		      <div class="col col-1">2</div>
		      <div class="col col-1"></div>
		      <div class="col col-2">C</div>
		      <div class="col col-3">14.966%</div>
		      <div class="col col-4">+8.49%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">3</div>
		      <div class="col col-1">3</div>
		      <div class="col col-1"></div>
		      <div class="col col-2">C++</div>
		      <div class="col col-3">7.471%</div>
		      <div class="col col-4">+1.92%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">4</div>
		      <div class="col col-1">5</div>
		      <div class="col col-1"><i class="fa fa-angle-up"></i></div>
		      <div class="col col-2">Python</div>
		      <div class="col col-3">6.992%</div>
		      <div class="col col-4">+3.30%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">5</div>
		      <div class="col col-1">6</div>
		      <div class="col col-1"><i class="fa fa-angle-up"></i></div>
		      <div class="col col-2">Visual Basic .NET</div>
		      <div class="col col-3">4.762%</div>
		      <div class="col col-4">+2.19%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">6</div>
		      <div class="col col-1">4</div>
		      <div class="col col-1"><i class="fa fa-angle-down"></i></div>
		      <div class="col col-2">C#</div>
		      <div class="col col-3">3.541%</div>
		      <div class="col col-4">-0.65%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">7</div>
		      <div class="col col-1">7</div>
		      <div class="col col-1"></div>
		      <div class="col col-2">PHP</div>
		      <div class="col col-3">2.925%</div>
		      <div class="col col-4">+0.63%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">8</div>
		      <div class="col col-1">8</div>
		      <div class="col col-1"></div>
		      <div class="col col-2">Java Script</div>
		      <div class="col col-3">2.411%</div>
		      <div class="col col-4">+0.31%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">9</div>
		      <div class="col col-1"></div>
		      <div class="col col-1"><i class="fa fa-angle-double-up"></i></div>
		      <div class="col col-2">SQL</div>
		      <div class="col col-3">16.881%</div>
		      <div class="col col-4">+3.92%</div>
		    </li>
		    
		    <li class="table-row">
		      <div class="col col-1">10</div>
		      <div class="col col-1">14</div>
		      <div class="col col-1"><i class="fa fa-angle-double-up"></i></div>
		      <div class="col col-2">Assembly language</div>
		      <div class="col col-3">1.409%</div>
		      <div class="col col-4">-0.40%</div>
		    </li>   
		  </ul>
	</div>
</div>

<!-- Line Under Moive  -->
<div class ="w3-row" style ="padding-left: 15%; padding-right: 15%; height: 50px;">
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
