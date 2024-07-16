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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub1-6.css' />">

</head>


<body class="animsition restyle-index">
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
	
	<!-- # common: header-menu-img start -->
    <%@ include file="./include/header-menu-img.jsp"%>
    <!-- # common: header-menu-img end -->   
    
	<div class="sub_container in_1400">
		
		<!-- # include: side-menu start -->
		<%@ include file="./include/side-menu.jsp"%>
		<!-- # include: side-menu end -->
		<main>
			<div class="right-contents col-lg-9">
				<!-- # include: title-box start -->
				<%@ include file="./include/title-box.jsp"%>
				<!-- # include: title-box end -->
				
	            <div class="conts_normal">
	                <div>
	                    <div class="left_content"><img src="<c:url value="/resources/img/sub_img/입주신청_img1.png" />" alt="입주신청"></div>
	                    <div class="right_content">
	                        <h3>입주조건</h3>
	                        <ul>
	                            <li class="title">자격기준</li>
	                            <li><p>• 예비 창업자 (캠퍼스입주 후 6개월 이내에 하남시에 사업자 등록을 하건나 법인 설립)</p></li>
	                            <li><p>• 창업 3년 이내 기업 (캠퍼스 입주 후 3개월 이내에 한남시로 본사 이전)</p></li>
	                        </ul>
	                        <ul>
	                            <li class="title">사업분야</li>
	                            <li><p>• 건강도시 조성관련 분야 또는 협업이 가능한 산업분야</p></li>
	                        </ul>
	                    </div>
	                </div>
	
	                <div>
	                    <div class="left_content"><img src="<c:url value="/resources/img/sub_img/입주신청_img2.png" />" alt="입주신청"></div>
	                    <div class="right_content">
	                        <h3>입주혜택</h3>
	                        <ul>
	                            <li class="title">자격기준</li>
	                            <li><p>• 예비 창업자 (캠퍼스입주 후 6개월 이내에 하남시에 사업자 등록을 하건나 법인 설립)</p></li>
	                            <li><p>• 창업 3년 이내 기업 (캠퍼스 입주 후 3개월 이내에 한남시로 본사 이전)</p></li>
	                        </ul>
	                    </div>
	                </div>
	
	                <div class="ico_wrap">
	                    <h3>자격기준</h3>
	                    <ul>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico1.png" />" alt="기업실적">입주자 모집공고</li>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico2.png" />" alt="기업실적">입주 신청</li>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico3.png" />" alt="기업실적">1차 서류 심사</li>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico4.png" />" alt="기업실적">2차 발표(PT) 심사</li>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico5.png" />" alt="기업실적">계약체결</li>
	                        <li><img src="<c:url value="/resources/img/sub_img/입주신청_ico6.png" />" alt="기업실적">입주</li>
	                    </ul>
	                </div><!--ico_wrap-->
	            </div><!--cont_normal-->
			
			
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