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
                                <h1 style="color:#007946;">하남도시공사 창업경진대회</h1>
                                <h1 class="program-icon program-icon3"></h1>
                            </div>
                            <div class="col-lg-8 program-text">
                                <p style="line-height: 25px;">
                                    <strong>사업목표</strong>
                                    <span>• 성장 잠재력이 우수한 바이오 헬스 및 4차산업 관련 스타트업 발굴</span>
                                    <span>• 기업유치 활성화 및 하남시 창업환경 조성을 통한 창업 촉진</span>
                                </p>

                                <p style="line-height: 25px;">
                                    <strong>사업내용</strong>
                                    <span>• 참가대상 : 예비창업자 또는 창업기업(창업 3년 이내)</span>
                                    <span>• 선정내역 : 5~10개팀 (포상 수여 등), 대상기업 스타트업캠퍼스 입주권 부여</span>
                                    <span>• 추후 지원 사업 및 입주심사 시 우대 혜택 부여</span>
                                </p>
                            </div>
                            <div style="width:100%; text-align:center; padding:15px 0;">
                                <img src="<c:url value='/resources/img/founded.png' />" alt="창업경진대회" width="550">
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