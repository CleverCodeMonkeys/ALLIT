<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="grid" id ="grid4" style="display: none;">
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
       디지털 트윈은 ‘현실 세계에 존재하는 대상이나 시스템의 디지털 버전’을 말한다. <br>디지털 트윈은 향후 3~5년간 특히 IoT 프로젝트에서 유망할 것이다. 이는 오늘날 디지털 트윈이 주목 받는 이유다. 체계적으로 설계된 디지털 트윈은 기업 의사 결정을 대폭 향상시킨다. 또한 현실 세계에 존재하는 실제 모델과 연결돼 물체나 시스템의 현 상태 이해와 변화 대응, 운영 개선, 가치 증진에 활용된다. 조직은 디지털 트윈을 단순 구현 차원에서 시작해 이를 점차 발전시키고 데이터 수집, 가시화하는 능력을 개선시키며, 올바른 분석 기법과 규칙을 적용하며 효과적으로 사업 목표에 대응한다.
        <br><br>
       
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec4.jpg);">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
          Digital  <br> Twin<span class="block"><b style="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">디지털<span class="serif block italic">트윈</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/dt1.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/dt2.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/dt3.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/dt4.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
      </div>
 </div>
 
 <div class="item footer">
      <h2 class="title-small">TOP 10 기술</h2>
      <ul class="nav" style= "font-family: penB">
        <li><a onclick="changeArticle('1')" >인공지능 강화 시스템</a></li>
        <li><a onclick="changeArticle('2')">지능형 앱ㆍ분석</a></li>
        <li><a onclick="changeArticle('3')" >지능형 사물</a></li>
        <li><a onclick="changeArticle('4')" class ="w3-text-pink" >디지털 트윈</a></li>
        <li><a onclick="changeArticle('5')">클라우드에서 에지로</a></li>
        <li><a onclick="changeArticle('6')">대화형 플랫폼</a></li>
        <li><a onclick="changeArticle('7')">몰입 경험</a></li>
        <li><a onclick="changeArticle('8')">블록체인</a></li>
        <li><a onclick="changeArticle('9')">이벤트 기반 모델</a></li>
        <li><a onclick="changeArticle('10')">지속적이고 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법</a></li>        
      </ul>
    </div>

  </div>