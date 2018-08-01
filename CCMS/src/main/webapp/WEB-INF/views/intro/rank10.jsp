<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="grid" id ="grid10" style="display: none;">
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
       한층 정교한 타깃 공격이 가능해진 세상에서 디지털 비즈니스 이니셔티브를 안전하게 추진할 수 있도록, 보안과 리스크 관리 담당자는 적응 가능한 대응으로 실시간적이고 위협과 신뢰 기반의 의사 결정을 하기 위한 지속적이며 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법을 택해야 한다. 보안 인프라는 디지털 비즈니스와 같은 속도로 움직이는 보안 제공을 통한 기회 포착과 위험 관리를 위해 어디서든 적응 가능해야 한다.
        <br>
       
     
      <a href="https://www.gartner.com/smarterwithgartner/gartner-top-10-strategic-technology-trends-for-2018/" target="_blank" class="btn">More details</a>
    </div>
<div class="item bg-block" style ="background: url(${pageContext.request.contextPath}/resources/intro/images/tec.jpg);">
      <div class="bg-block__wrapper">
        <h2 class="title-small">이슈 동향</h2>
        <p class="text-block">
        Continuous Adaptive Risk<br> and Trust<br> <span class="block"><b style="color:red;">Trend</b></span>
        </p>
      </div>
    </div>
<div class="item community">
      <div class="community-header">
        <h2 class="title-block-small">CARTA<span class="serif block italic">접근법</span></h2>
        <h3 class="title-block-small">Technology</h3>
      </div>
      <div class="img-grid">
        <img src="${pageContext.request.contextPath}/resources/intro/images/ca1.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/ca2.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/ca3.jpg" 
        style ="width:150px; height:150px; cursor:pointer;" class = "w3-hover-opacity" onclick="onClick(this)"/>
        
        <img src="${pageContext.request.contextPath}/resources/intro/images/ca4.jpg" 
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
        <li><a onclick="changeArticle('9')">이벤트 기반 모델</a></li>
        <li><a onclick="changeArticle('10')"  class ="w3-text-pink">지속적이고 적응할 수 있는 리스크 및 신뢰 평가(CARTA) 접근법</a></li>        
      </ul>
    </div>
 
  </div>