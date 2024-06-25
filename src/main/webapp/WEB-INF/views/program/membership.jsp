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
                            <div class="col-lg-5 program-title">
                                <h1 style="color:#1d4291;">스타트업캠퍼스 멤버쉽 프로그램</h1>
                                <!-- <h1 class="program-icon program-icon1"></h1> -->
                            </div>
                            <div class="col-lg-7 program-text">
                                <p style="line-height: 25px;">
                                    <strong>사업목표</strong>
                                    <span>• 스타트업캠퍼스 입주시 서비스 혜택 부여를 통한 우수 입주기업 유치<br>경쟁력 강화</span>
                                </p>

                                <p style="line-height: 25px;">
                                    <strong>사업내용</strong>
                                    <span>• 하남스타트업캠퍼스와 파트너십을 체결한 스타트업 지원서비스를<br>입주기업 대상 계약기간 동안 무상 또는 할인으로 제공</span>
                                    <span>• (서비스 예시) Knowhow,  쿼타북, 모두의싸인 등</span>
                                </p>                                
                            </div>

                            <div style="width:100%; text-align:center;">
                                <img src="<c:url value='/resources/img/membership.png' />" alt="멤버쉽프로그램" width="600">
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