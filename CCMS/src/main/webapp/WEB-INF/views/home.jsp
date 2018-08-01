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
</head>

<style>
.padding_paper{
	padding-left: 15%;
	padding-right: 15%;
}

.article_margin_bottom{
	margin-bottom: 7%;
}

.font_subtitle{
	font-family: "vitamin";
	font-size: 1.5em;
}

.font_watch{
	font-family: "watch";
	font-size:1.5em;
}

.font_cloud{
	font-family: "whiteCloud";
	font-size: 1.5em;
}

.font_top_bottom{
	padding-top: 20px;
	padding-bottom: 20px;
	border : 2px solid black;
}

.font_penpal{
	font-family: "penB";
	font-size: 1.5em;
}

.memo_font{
	font-family: "penB";
	font-size: 1.1em;
}

 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
  #text {
	width:100%;
	background-color:#FFF;
	color:#222;
	font-family:penB;
	font-weight:normal;
	font-size:24px;
	resize:none;
	line-height:40px;
	padding-left:100px;
	padding-right:100px;
	padding-top:45px;
	padding-bottom:34px;
	background-image:url(${pageContext.request.contextPath}/resources/images/common/lines.png), 
	url(${pageContext.request.contextPath}/resources/images/common/paper.png);
	background-repeat:repeat-y, repeat;
	-webkit-border-radius:12px;
	border-radius:12px;
	-webkit-box-shadow: 0px 2px 14px #000;
	box-shadow: 0px 2px 14px #000;
	border-top:1px solid #FFF;
	border-bottom:1px solid #FFF;
}
</style>

<body>
<!-- Header  -->
<c:import url="common/header.jsp" charEncoding="UTF-8"/>

<c:forEach items="${banner}" var="bn" varStatus="bs">
	<header class="w3-container w3-center bannerView" style="padding:128px 16px; display: none;" id ="b${bs.index}">
	  <h1 class="w3-margin w3-jumbo font_cloud">${bn.mItemTitle}</h1>
	  <p class="w3-xlarge font_subtitle">${bn.mItemContent}</p>
	  <button class="w3-button w3-black w3-padding-large w3-large w3-margin-top font_watch" onclick="window.open('${bn.mUrl}')">Show</button>
	</header>
</c:forEach>

<div class ="w3-row w3-center font_subtitle article_margin_bottom" style="text-align: center; cursor: pointer;">
	<c:forEach items="${banner}" var="bn" varStatus="bs">
		<div class ="w3-col m2 w3-white font_top_bottom bannerTag" id = "bt${bs.index}" onclick="changeItem(${bs.index});">
	  		${bn.mItemTitle}
		</div>
	</c:forEach>
</div>
	<div class="w3-row padding_paper">
		<h1 class = "font_cloud" style="font-size: 5em; float:left;">ALL IT 영상</h1>
		<h1 style ="font-family:vitamin; cursor: pointer; float:right;" onclick="toggleMemo();">MEMO</h1>
	</div>
<div class="w3-row padding_paper article_margin_bottom">
	<!-- Video For IT Technology -->
	
	<div class ="w3-col m6">
		 <!-- <h1 style ="font-family:vitamin">  </h1>  -->
		<div class="owl-carousel owl-theme" style="z-index: 0; height: 400px; box-shadow: 5px 10px orange">
			 <c:forEach items="${movie}" var="mo">
    		 	<div class="item-video"><a class="owl-video" href="${mo.mUrl}"></a></div>
    	     </c:forEach>
		</div>
	</div>
	
	<!-- Rank From New Skill IT -->
	<div class ="w3-col m6" style="padding-left:10%;">
		
		<div id ="memoPage" style ="display:none;">
			
			<textarea placeholder="Enter something funny." id="text" name="text" rows="4" 
			style="resize: none; height: 450px;">
			</textarea>
			<button class ="w3-button w3-teal font_subtitle w3-right w3-right-margin" style ="margin-top:20px;" onclick="saveMemo();">메모저장</button>
			<button class ="w3-button w3-indigo font_subtitle w3-right" style ="margin-top:20px; margin-right: 10px;" onclick="CleanMemo();">clean</button>
		</div>
		
		<img src = "${pageContext.request.contextPath}/resources/images/logo/monkeyLogo.jpg"
		style ="width: 100%; margin-top: 5%; margin-left: 15%" id="logo"/>
	</div>
</div>

<div class="w3-row padding_paper article_margin_bottom">
	<h1 class = "font_cloud" style="font-size: 5em; float:right;">떠오르는 TOP10 IT</h1>
	<c:forEach items="${top10}" var="to" varStatus="ts">
		<div class ="w3-col m6 font_penpal spContent" id="sp${ts.index}" style="display:none;">
			<h1 class ="font_cloud w3-amber w3-center">${to.mItemTitle}</h1>
			<span>${to.mItemContent}</span>	
		</div>
	</c:forEach>
	
	<div class ="w3-col m6" style="padding-left:10%;">
		<!-- <h1 style ="font-family:vitamin">TOP10 IT</h1> -->
		<table class = "font_penpal" style="text-align:center; width: 100%; margin-top: 3%;">
			<c:forEach items="${top10}" var="top" varStatus="ts">
				<tr style="cursor: pointer;" id="rankNo${ts.index}" onclick="rankChange(${ts.index});">
					<th class ="w3-yellow ranking" id ="th${ts.index}">no.${ts.count}</th>
					<th> ${top.mItemTitle} </th>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


<%-- <div class="w3-row padding_paper article_margin_bottom">
	<h1 class = "font_cloud" style="font-size: 5em;">알고리즘</h1>
	<!-- Algorithm -->
	<div class ="w3-col m6 font_penpal">
		<img src="${pageContext.request.contextPath}/resources/images/algorithm/${algorithm[0].mImage}" style ="width: 100%; height:250px; padding-left: 5%; padding-right: 5%"/>
	</div>
	
	<div class ="w3-col m6 font_penpal">
			<h1 class="font_cloud">${algorithm[0].mItemTitle}</h1>
			<span>${algorithm[0].mItemContent}</span> <br>
			<button class ="w3-red w3-button" style ="float: right;" onclick="window.open('${algorithm[0].mUrl}')">자세히 보기</button>	
	</div>
</div> --%>

<!-- Footer -->
<c:import url="common/footer.jsp" charEncoding="UTF-8"/>

<script type="text/javascript">
	$(document).ready(function(){
		$('#b0').css('display','block');
		$('#bt0').removeClass('w3-white');
		$('#bt0').addClass('w3-black');
		$('#sp0').css('display','block');
		$('#th0').removeClass('w3-yellow');
		$('#th0').addClass('w3-red');
		/* Setting Plain Color Setting */
		$('#b0').addClass('w3-red');
		$('#b1').addClass('w3-blue');
		$('#b2').addClass('w3-lime');
		$('#b3').addClass('w3-indigo');
		$('#b4').addClass('w3-pink');
		$('#b5').addClass('w3-blue-grey');
		
	});
	
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
	
	function changeItem(id)
	{
		$('.bannerTag').removeClass('w3-black');
		
		$('.bannerView').css('display','none');
		
		$('.bannerTag').each(function(index){
			if(index == id){
				$(this).addClass('w3-black');
			}
		});
		
		$('.bannerView').each(function(index){
			if(index == id){
					$(this).css('display','block');
			}
		});
	}
	
	var toggle = true;
	function toggleMemo()
	{
		if(toggle)
		{
			$('#memoPage').css('display','block');
			$('#logo').css('display','none');
			toggle = false;
		}
		else
		{
			$('#memoPage').css('display','none');
			$('#logo').css('display','block');
			toggle = true;
		}
	}
	
	function rankChange(id)
	{
		$('.ranking').each(function(index){
			
			$(this).removeClass('w3-red').addClass('w3-yellow');
			
			if(index == id){
				$(this).removeClass('w3-yellow');
				$(this).addClass('w3-red');
			}	
		});
		
		$('.spContent').css('display','none');
		$('.spContent').each(function(index){
			
			if(index == id){
				$(this).css('display','block');
			}
		});
	}
	
	function CleanMemo()
	{
		var answer = confirm("메모 내용을 지우겠습니까?");
		
		if(answer){
			$('#text').val("");
		}
	}
	
	function saveMemo()
	{
		var answer = confirm ("메모 내용을 저장하겠습니까?");
		
		if(answer){
			// Save Memo Contents	
			/* $('#text').val(""); */
		}
	}
	
</script>

</body>
</html>
