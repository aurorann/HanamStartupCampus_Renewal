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
    <%@ include file="../include/script.jsp"%>
    <!-- # include: script end -->
	<!-- # include: stylesheet start -->
	<%@ include file="../include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
</head>


<body class="animsition restyle-index">
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   

    <!-- # include: location start -->
    <%@ include file="../include/location.jsp"%>
    <!-- # include: location end -->
    
   

    <div class="sub-contents">
        <div class="inner">
            <!-- # include: side-menu start -->
            <%@ include file="../include/side-menu.jsp"%>
            <!-- # include: side-menu end -->
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="../include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#3a6e70;">디지털 바이오헬스<br>실증 프로젝트</h1>
                                <h1 class="program-icon program-icon5"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p>실증 프로젝트를 통한 하남시 건강도시 구축, 디지털헬스케어 분야
                                    건강데이터를 통한<br/>정책 발굴 및 중앙정부 사업 유치</p>
                                <p><strong>- 누가?</strong><span>디지털헬스케어분야의 기업 및 스타트업</span></p>
                                <p><strong>- 누구에게?</strong><span>하남시민</span></p>
                                <p><strong>- 무엇을?</strong><span>사업 참여 업체가 개발한 제품 또는 서비스</span></p>
                                <p><strong>- 어떻게?</strong><span>실증 테스트 진행</span></p>
                                <p>
                                    <img src="<c:url value='/resources/img/sub/program-icon5.png' />" alt="디지털 바이오헬스 실증 프로젝트 설명 이미지">
                                </p>
                            </div>
                        </li>

                    </ul>
                   


                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>