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
	                    <div class="left_content"><img src="<c:url value='/resources/img/sub_img/주요사업_img5.png' />" alt="주요사업"></div>
	                    <div class="right_content">
	                        <h3 class="title_bule">투자유치 역량 강화 프로그램</h3>
	                        <ul>
	                            <li class="title_dk">자격기준</li>
	                            <li><p>• 스타트업 대상 맞춤형 투자유치 지원을 통한 스케일업 유도</p></li>
	                            <li><p>• 전략적 협업을 통한 투자유치 확대</p></li>
	                            <li><p>• 네트워킹 활성화를 통한 투자유치 지원</p></li>
	                        </ul>
	                        <ul>
	                            <li class="title_dk">사업분야</li>
	                            <li><p>• 사업대상: 투자유치를 희망하는 창업 7년 이내 하남시 소재 기업(8개사 내외)</p></li>
	                            <li><p>• 지원내용: 투자유치 컨설팅, IR 자료 제작지원, AC/VC 1:1 맞춤형 멘토링 등</p></li>
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