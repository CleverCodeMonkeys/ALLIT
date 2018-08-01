<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="grid" id ="grid3" style="display: none;">
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
       지능형 사물은 융통성 없는 프로그래밍 모델의 실행력을 넘어 AI를 통한 고급 기능을 선보이며 인간, 주변 환경과 한층 자연스러운 상호 작용을 하는 사물을 의미한다. AI는 자율주행차, 로봇, 드론 등 새로운 지능형 사물의 발전을 주도하고 있으며 IoT나 연결형 소비자, 산업 시스템 등 수많은 사물의 역량을 발전시키고 있다.
        <br><br>
       데이비드 설리는 “현재 농업, 광업 등 통제된 환경에서의 자율주행차 사용이 급속히 성장 중인 지능형 사물 분야로 떠오르고 있다. 2022년까지 통제된 도로상에서 제한적 자율주행차 사례가 나올 전망이다.
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec3.png)">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
          Intelligent <br> Things<span class="block"><b style="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">지능형<span class="serif block italic">사물</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/IOT1.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IOT2.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IOT3.jpeg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/IOT4.jpeg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
      </div>
 </div>
 
 
 <div class="item footer">
      <h2 class="title-small">TOP 10 기술</h2>
      <ul class="nav" style= "font-family: penB">
        <li><a onclick="changeArticle('1')" >인공지능 강화 시스템</a></li>
        <li><a onclick="changeArticle('2')">지능형 앱ㆍ분석</a></li>
        <li><a onclick="changeArticle('3')" class ="w3-text-pink">지능형 사물</a></li>
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