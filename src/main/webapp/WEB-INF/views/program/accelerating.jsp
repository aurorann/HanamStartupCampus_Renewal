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

                                <div class="col-lg-12 r-contents program-box">
                    <ul>
                        <li>
                            <div class="col-lg-4 program-title">
                                <h1 style="color:#853c1c;">액셀러레이팅 프로그램</h1>
                                <h1 class="program-icon program-icon2"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p style="line-height: 25px;">
                                    <strong>사업목표</strong>
                                    <span>• 우수 스타트업 발굴 및 육성을 통한 일자리 창출 및 성장동력 확충</span>
                                    <span>• 민간 액셀러레이터 프로그램을 활용 실질적·효율적 사업 추진</span>
                                    <span>• 기업의 투자규모 및 단계에 따른 별도 지원프로그램 제공</span>
                                    <span>• 스타트업 기업의 경쟁력 있는 사업계획서 작성 지원을 통한 지원사업 및<br>투자유치 기회 확대</span>
                                </p>

                                <p style="line-height: 25px;">
                                    <strong>사업내용</strong>
                                    <span>• 지원내용 : 액셀러레이터 선발을 통한 스타트업 육성 지원</span>
                                    <span>• 지원종류 : BM 진단, 맞춤형 멘토링, 투자기관 초청 모의 데모데이, 우수기업 투자연계, 컨설팅 전문가 매칭, 멘토링 지원, 사업계획서 기획 및 작성 지원 등</span>
                                </p>
                                
                            </div>

                            <div style="width:100%; text-align:center;">
                                <img src="<c:url value='/resources/img/accelerating.jpg' />" alt="액셀러레이팅" width="500">
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