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

    <!-- # include: location start -->
    <%@ include file="./include/location.jsp"%>
    <!-- # include: location end -->
    
   

    <div class="sub-contents">
        <div class="inner">
            <!-- # include: side-menu start -->
            <%@ include file="./include/side-menu.jsp"%>
            <!-- # include: side-menu end -->
            
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#25a054;">네트워킹 데이</h1>
                                <h1 class="program-icon program-icon5"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p style="line-height: 25px; letter-spacing:-1px;">
                                    <strong>사업목표</strong>
                                    <span>• 하남 건강도시 조성을 위해 각 분야의 네트워크 운영체계 확립을 통한 혁신창출 도모</span>
                                    <span>• 캠퍼스 입주기업 네트워크 구축 기회 제공을 통한 새로운 비즈니스 협력기회 발굴</span>
                                </p>

                                <p style="line-height: 25px; letter-spacing:-1px;">
                                    <strong>사업내용</strong>
                                    <span>• 사업대상: 하남스타트업캠퍼스 입주기업 및 업무 유관기관, 해당 기관 입주기업 등</span>
                                    <span>• 정부/지자체 지원 사업설명회, 선배 창업자 및 VC/AC 강연</span>
                                    <span>• 네트워킹 교류를 통한 협업사업 발굴</span>
                                </p>
                                
                            </div>
                            <div style="width:100%; text-align:center;">
                                <img style="margin-top:50px;" src="<c:url value='/resources/img/networking.jpg' />" alt="네트워킹 데이" width="400">
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