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
	                    <img src="<c:url value='/resources/img/sub_img/주요사업_img3.png' />" alt="주요사업">
	                    <h3>스타트업 전문교육</h3>
	                </div>
	
	                <table>
	                    <caption>입주기업의 Needs를 반영한 커리큘럼 구성 및 운영</caption>
	                    <thead>
	                        <tr>
	                            <th>수요조사</th>
	                            <th>연간 커리큘럼</th>
	                            <th>교육효과</th>
	                            <th>교육방법</th>
	                            <th>교육대상</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td style="font-size:15px">• 설문 등을 통한 입주기업의 교육수요 조사</td>
	                            <td style="font-size:15px">• 입주기업의 Needs와 필수교육 프로그램을 연계한 커리큘럼 구성</td>
	                            <td style="font-size:15px">
	                                • 학습을 통한 전문성 함양<br>
	                                • 비즈니스의 새로운방향성 체득
	                            </td>
	                            <td style="font-size:15px">
	                                • 이론, 현장실무 사례학습 등<br>
	                                • 스타트업필수실무교육 (오프라인자체운영)<br>
	                                • 온라인창업실습교육<br>
	                                • 맞춤형 전문특화교육
	                            </td>
	                            <td style="font-size:15px">• 창업 7년이내의 하남시 소재 기업 임직원 또는 하남시 거주 중인 예비창업자</td>
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