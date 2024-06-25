<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- # common: head start -->
	<%@ include file="/WEB-INF/head.jsp"%>
    <!-- # common: head end -->

	<!-- # include: script start -->
    <%@ include file="./include/script.jsp"%>
    <!-- # include: script end -->
	<!-- # include: stylesheet start -->
	<%@ include file="./include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
</head>


<body class="animsition restyle-index">
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   

	<div class="sub_container in_1400">
		
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
			<main>
	           <div class="right-contents col-lg-9">
	               <!-- # include: title-box start -->
	               <%@ include file="./include/title-box.jsp"%>
	               <!-- # include: title-box end -->
	
	               <div class="col-lg-12 r-contents">
	                   <div class="col-lg-6 mg-top-30">
	                       <h3 class="g-title-lg green-bar"><strong>생각,<br>현실이 되다.</strong></h3>
	                       <img src="<c:url value='/resources/img/sub/sub1-1.png' />" alt="하남도시공사 로고 이미지">
	                   </div>
	
	                   <div class="col-lg-6 mg-top-30">
	                       <h3 class="g-title">하남스타트업캠퍼스는...</h3>
	                       <p class="b-text">
	                           하남시-한국산업은행-하남도시공사가 함께 협력하여 스타트업이<br>가속성장 할 수 있도록 지원하여 국내를 넘어 세계적인 기업으로<br/>성장하는데 기여하고자 설립되었습니다.
	                       </p>
	
	                       <h3 class="g-title">캠퍼스는 모두에게 열려 있습니다.</h3>
	                       <p class="b-text">
	                           저희 캠퍼스는 바이오헬스 분야 스타트업의 공간뿐만 아니라<br>관련분야의 모든 사람들이 함께 의견을 나눌 수 있는 공유오피스<br/>공간도 준비되어 있습니다.
	                       </p>
	
	                       <h3 class="g-title">경쟁력을 마련하겠습니다.</h3>
	                       <p class="b-text">
	                           국경 없는 무한경쟁 시대에 대비하여 국제 경쟁력을 갖는 스타트업의 성장을 위해 사업화 지원사업, 전문교육, 바이오헬스 실증 및 체험<br> 클러스터 협의회 등 다양한 사업을 제공하고 있습니다.
	                       </p>
	
	                       <h3 class="g-title">창업에서 성공까지 함께 하겠습니다.</h3>
	                       <p class="b-text">
	                           캠퍼스는 창업준비, 기술개발, 제품개발, 생산준비, 본격생산을 통한 기업공개까지 창업기업 성장 全단계에 걸쳐 함께할 것이며 도움이<br>필요한 모든 스타트업에게 열려있습니다. 
	                           <br>
	                           <br>
	                           창업에서 성공까지 함께하는 캠퍼스가 되겠습니다. 
	
	                           <strong style="float:left; text-align:right; width:100%; color:#000; margin-top:45px;">하남스타트업캠퍼스</strong>
	                       </p>
	                   </div>
	               </div><!-- r-contents div 끝 -->
	           </div><!-- right-contents div 끝 -->
            </main>
	</div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>