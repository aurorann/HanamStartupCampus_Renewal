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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub2.css' />">

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
	                    <div class="left_content"><img src="<c:url value='/resources/img/sub_img/주요사업_img6.png' />" alt="주요사업"></div>
	                    <div class="right_content">
	                        <h3 class="title_bule">네트워킹 데이</h3>
	                        <ul>
	                            <li class="title_dk">자격기준</li>
	                            <li><p>• 하남 건강도시 조성을 위해 각 분야의 네트워크 운영체계 확립을 통한 혁신창출 도모</p></li>
	                            <li><p>• 캠퍼스 입주기업 네트워크 구축 기회 제공을 통한 새로운 비즈니스 협력기회 발굴</p></li>
	                        </ul>
	                        <ul>
	                            <li class="title_dk">사업분야</li>
	                            <li><p>• 사업대상: 하남스타트업캠퍼스 입주기업 및 업무 유관기관, 해당 기관 입주기업 등</p></li>
	                            <li><p>• 정부/지자체 지원 사업설명회, 선배 창업자 및 VC/AC 강연</p></li>
	                            <li><p>• 네트워킹 교류를 통한 협업사업 발굴</p></li>
	                        </ul>
	                    </div>
	                </div>
	            </div><!--conts_normal-->

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