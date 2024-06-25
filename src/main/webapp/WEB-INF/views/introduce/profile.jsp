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
                    ${CONTENT}
                    <%-- <div class="hn-goal">
                        <strong class="small-title small-bar">발자취</strong>
                        <h3 class="m-title">하남스타트업캠퍼스 연혁</h3>
                        <h1><img src="<c:url value='/resources/img/logo-dark-lg.png' />" alt="하남스타트업캠퍼스 로고"></h1>
                    </div>

                    <div class="hn-support mg-top-60">
                    
                        <ul class="hn-support-contents mg-top-60">
                            <li>
                                <div class="col-lg-2">
                                    <h1>2020년</h1>
                                </div>
                                <div class="col-lg-9 program-text">
                                    <p><strong>&#183;&nbsp;03월</strong><span>부동산 사용대차 계약체결(하남시↔산업은행)</span></p>
                                    <p><strong>&#183;&nbsp;04월</strong><span>하남스타트업캠퍼스 구축 및 운영협약 체결(하남시↔하남도시공사)</span></p>
                                    <p><strong>&#183;&nbsp;06월</strong><span>인테리어공사 설계용역 체결</span></p>
                                    <p><strong>&#183;&nbsp;08월</strong><span>스타트업캠퍼스 운영 인력 채용(센터장, 수석매니저)</span></p>
                                    <p><strong>&#183;&nbsp;11월</strong><span>운영규정 제정</span></p>
                                    <p><strong>&#183;&nbsp;12월</strong><span>제1회 하남스타트업캠퍼스 창업경진대회 개최</span></p>
                            

                                </div>
                            </li>

                            <li>
                                <div class="col-lg-2">
                                    <h1>2021년</h1>
                                </div>
                                <div class="col-lg-9 program-text">
                                    <p><strong>&#183;&nbsp;01월</strong><span>제1회 하남스타트업캠퍼스 창업경진대회 입상자 선정</span></p>
                                    <p><strong>&#183;&nbsp;02월</strong><span>캠퍼스 인테리어공사 완공 및 입주기업 선정</span></p>
                                    <p><strong>&#183;&nbsp;03월</strong><span>10개 입주기업 입주</span></p>
                                    <p><strong>&#183;&nbsp;05월</strong><span>바이오산업 육성 업무협약(MOU) 체결<br/>(하남도시공사↔건국대학교 LINC + 사업단)</span></p>
                                    <p><strong></strong><span>하남스타트업캠퍼스 개소식</span></p>
                                    <p><strong>&#183; ~&nbsp;12월</strong><span>
                                    	캠퍼스 지원사업 수행
                                    	<br/>
                                    	　- 사업화 패키지, 전문교육, 액셀러레이팅, 클러스터, 경진대회 등
                                    </span></p>
                                    
                                    
                                </div>
                            </li>
    
						   	<li>
                                <div class="col-lg-2">
                                    <h1>2022년</h1>
                                </div>
                                <div class="col-lg-9 program-text">
                                    <p><strong>&#183;&nbsp;02월</strong><span>조기 졸업기업 4개사<br/>
                                    	　- 앤코어스㈜, ㈜메디인테크, ㈜엘엔로보틱스, ㈜설랩
                                    </span></p>
                                    <p><strong>&#183;&nbsp;03월</strong><span>신규 입주기업 4개사<br/>
                                    	　- MAZE㈜, ㈜디에이블, ㈜아사달, ㈜소금광산		                                    
                                    </span></p>
                                    <p><strong>&#183;&nbsp;05월</strong><span>혁신창업기업 성장지원을 위한 업무협약<br/>
                                    	　- 하남도시공사 ↔ 신용보증기금 서울동부영업본부		                                    
                                    </span></p>
                                </div>
                            </li>
                            
                        </ul>
                   
                        
                    </div> --%>

                



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