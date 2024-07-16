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

	           <div class="container_wrap">
	                <div class="business_img">
	                    <img src="<c:url value='/resources/img/sub_img/주요사업_img7.png' />" alt="주요사업">
	                    <h3>스타트업 전문교육</h3>
	                </div>
	
	                <table>
	                    <caption>
	                        입주기업의 Needs를 반영한 커리큘럼 구성 및 운영
	                        <p>전문분야 : 공통(BM, 사업화 진단 등), 경영(회계, 법률 마케팅 등), 기술(바이오헬스, 금속, 지식재산권 등)</p>
	                    </caption>
	                    <thead>
	                        <tr>
	                            <th>상담신청 및 접수</th>
	                            <th>기본상담 및 설계상담</th>
	                            <th>멘토링/자문실시</th>
	                            <th>멘토링 사후관리</th>
	                            <th>에로사항 해결</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td style="font-size:15px">• 신청기업 신청서<br> 작성 및 제출(상시)</td>
	                            <td style="font-size:15px">
	                                • 캠퍼스 전담인력이<br>
	                                신청기업 애로사항 파악<br>
	                                • 적합한 전문가 매칭
	                            </td>
	                            <td style="font-size:15px">
	                                • 심층멘토링/자문<br>
	                                • 결과보고서 제출
	                            </td>
	                            <td style="font-size:15px">
	                                • 신청기업 대상 멘토링 만족도 파악<br>
	                                • 필요시 대내외 지원 프로그램 연계 추천
	                            </td>
	                            <td style="font-size:15px">• 애로사항 해결</td>
	                        </tr>
	                    </tbody>
	                </table><!--테이블-->
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