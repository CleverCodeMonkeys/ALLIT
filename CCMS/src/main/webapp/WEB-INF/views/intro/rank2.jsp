<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="grid" id ="grid2" style="display: none;">
    <div class="item small-ad">
      <a class="link-block">
        2018 <span class="serif">가트너 선정</span> 10대 전략 기술
      </a>
    </div>
    <div class="item article-header">
      <h2 class="title-block">TOP 10</h2>
      <h3 class="title-tag serif">Technology</h3>
    </div>
    
<div class="item article-body">
      <p class="text serif">
       향후 몇 년간 사실상 모든 앱과 애플리케이션, 서비스들이 일정 수준의 AI를 포함하게 될 것이다.
       <br>
        일부 앱들은 AI와 머신러닝을 필수 포함하는 명백한 지능형 앱일 것이다. 
        또 다른 일부 앱들은 드러나지 않게 지능을 제공하는 방식으로 AI를 활용할 것이다. 
        <br><br>
        지능형 앱은 인간과 시스템 간 새로운 지능적 매개층을 형성할 것이며, 업무 본질과 현장 구조를 변화시킬 잠재력을 가진다.
        
       
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec2.jpg)">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
          Intelligent<br> Apps
          <br> and<br> Analytics<span class="block"><b style="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">지능형 앱 <span class="serif block italic">분석</span></h2>
        <h3 class="title-block-small">TECHNOLOGY</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/IAA1.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IAA2.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IAA3.JPG" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IAA4.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
      </div>
 </div>
 
  <div class="item footer">
      <h2 class="title-small">TOP 10 기술</h2>
      <ul class="nav" style= "font-family: penB">
        <li><a onclick="changeArticle('1')" >인공지능 강화 시스템</a></li>
        <li><a onclick="changeArticle('2')" class ="w3-text-pink">지능형 앱ㆍ분석</a></li>
        <li><a onclick="changeArticle('3')">지능형 사물</a></li>
        <li><a onclick="changeArticle('4')">디지털 트윈</a></li>
        <li><a onclick="changeArticle('5')">클라우드에서 에지로</a></li>
        <li><a onclick="changeArticle('6')">대화형 플랫폼</a></li>
        <li><a onclick="changeArticle('7')">몰입 경험</a></li>
        <li><a onclick="changeArticle('8')">블록체인</a></li>
        <li><a onclick="changeArticle('9')">이벤트 기반 모델</a></li>
        <li><a onclick="changeArticle('10')">지속적이고 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법</a></li>        
      </ul>
    </div>
  
  </div>