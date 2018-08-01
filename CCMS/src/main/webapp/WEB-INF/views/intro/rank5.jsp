<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="grid" id ="grid5" style="display: none;">
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
       에지 컴퓨팅은 정보 처리와 콘텐츠 수집, 전달이 해당 정보 소스와 인접한 곳에서 처리되는 컴퓨팅 토폴로지(topology) 다. 연결과 대기 시간 문제, 대역폭 제약과 에지에 내장된 다양한 기능 차원에서는 분산 모델이 유리하다. 기업은 인프라 아키텍처 내, 특히 주요 IoT 패턴 설계 시 에지 컴퓨팅을 사용해야 한다.
        <br><br>
       클라우드와 에지를 라이벌 구도로 보기도 하지만, 클라우드는 탄력적 확장이 가능한 기술이 서비스로 제공되며, 중앙 집중화 모델을 필수로 하지 않는 컴퓨팅 스타일이다.
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec5.jpg);">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
          Cloud  <br> to the <br>Edge<span class="block"><b style="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">클라우드에서<span class="serif block italic">에지로</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/cloud1.jpeg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/cloud2.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/cloud3.png" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/cloud4.png" 
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
        <li><a onclick="changeArticle('5')"class ="w3-text-pink" >클라우드에서 에지로</a></li>
        <li><a onclick="changeArticle('6')">대화형 플랫폼</a></li>
        <li><a onclick="changeArticle('7')">몰입 경험</a></li>
        <li><a onclick="changeArticle('8')">블록체인</a></li>
        <li><a onclick="changeArticle('9')">이벤트 기반 모델</a></li>
        <li><a onclick="changeArticle('10')">지속적이고 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법</a></li>        
      </ul>
    </div>

  </div>