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

                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#d84f4f;">투자유치 역량 강화 프로그램</h1>
                                <h1 class="program-icon program-icon4"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p style="line-height: 25px;">
                                    <strong>사업목표</strong>
                                    <span>• 스타트업 대상 맞춤형 투자유치 지원을 통한 스케일업 유도</span>
                                    <span>• 전략적 협업을 통한 투자유치 확대</span>
                                    <span>• 네트워킹 활성화를 통한 투자유치 지원</span>
                                </p>

                                <p style="line-height: 25px;">
                                    <strong>사업내용</strong>
                                    <span>• 사업대상: 투자유치를 희망하는 창업 7년 이내 하남시 소재 기업(8개사 내외)</span>
                                    <span>• 지원내용: 투자유치 컨설팅, IR 자료 제작지원, AC/VC 1:1 맞춤형 멘토링 등</span>
                                </p>

                            </div>

                            <div style="width:100%; text-align:center;">
                                <img src="<c:url value='/resources/img/investment.png' />" alt="투사유치역량강화" width="500">
                            </div>

                        </li>
                    </ul>

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