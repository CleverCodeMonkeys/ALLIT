<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="grid" id ="grid1">
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
       최소 2020년까지 자율적으로 학습, 적응, 행동하는 시스템은 업체 간 가장 심한 각축전이 벌어질 분야일 것으로 예상된다. 또한 2025년까지 의사 결정 향상, 비즈니스 모델, 생태계ㆍ고객 경험 재형성을 위한 AI 능력이 디지털 이니셔티브를 성공으로 이끄는 주 원동력으로 작용할 전망이다.
        <br><br>
       데이비드 설리는 “AI 기술은 급속히 발전하고 있다. 조직은 이러한 기술과 프로세스, 툴(예: 데이터 준비, 통합, 알고리즘, 트레이닝 방법론, 모델 생성 등)에 대대적으로 투자해 기술을 성공적으로 활용하고 AI 강화 시스템을 구축해야 한다. 
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec1.jpg)">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
          AI
          <br/> Foundations<br> Technology<span class="block"><b style ="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">인공 지능 강화<span class="serif block italic">시스템</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/AI1.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/AI2.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/AI3.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/AI4.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
      </div>
    </div>
    
       
    <div class="item footer">
      <h2 class="title-small">TOP 10 기술</h2>
      <ul class="nav" style= "font-family: penB">
        <li><a onclick="changeArticle('1')" class ="w3-text-pink">인공지능 강화 시스템</a></li>
        <li><a onclick="changeArticle('2')">지능형 앱ㆍ분석</a></li>
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