<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="grid" id ="grid9" style="display: none;">
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
       디지털 비즈니스의 핵심은 매 순간 이벤트를 감지하고, 매 순간을 활용하는 것이다. 비즈니스 이벤트는 상품 구매 주문과 완료, 항공기 이착륙 등 주목할 만한 상태나 그 변화를 발견해 디지털적으로 반영될 수 있는 모든 것으로, 이벤트 브로커, IoT, 클라우드 컴퓨팅, AI 등을 활용해 신속히 추적하고 자세히 분석할 수 있다.
        <br>
       그러나 문화적 변화, 리더십 변화 없이 기술만으로 이벤트 중심 모델의 모든 가치를 전달할 수는 없다. 따라서 디지털 비즈니스는 IT 리더, 설계자, 아키텍트의 이벤트 사고 수용 필요성을 촉진시킨다.
       <br>
       

      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec9.png);">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
         Event   <br> Driven<span class="block">Trend</span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">이벤트<span class="serif block italic">기반</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/event1.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/event2.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/event3.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/event4.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
      </div>
 </div>
 
 
 <div class="item footer">
      <h2 class="title-small">TOP 10 기술</h2>
      <ul class="nav" style= "font-family: penB">
        <li><a onclick="changeArticle('1')" >인공지능 강화 시스템</a></li>
        <li><a onclick="changeArticle('2')">지능형 앱ㆍ분석</a></li>
        <li><a onclick="changeArticle('3')" >지능형 사물</a></li>
        <li><a onclick="changeArticle('4')" >디지털 트윈</a></li>
        <li><a onclick="changeArticle('5')">클라우드에서 에지로</a></li>
        <li><a onclick="changeArticle('6')" >대화형 플랫폼</a></li>
        <li><a onclick="changeArticle('7')" >몰입 경험</a></li>
        <li><a onclick="changeArticle('8')"  >블록체인</a></li>
        <li><a onclick="changeArticle('9')" class ="w3-text-pink">이벤트 기반 모델</a></li>
        <li><a onclick="changeArticle('10')">지속적이고 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법</a></li>        
      </ul>
    </div>
 
  </div>