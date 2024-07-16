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
	                    <div class="left_content"><img src="<c:url value='/resources/img/sub_img/주요사업_img4.png' />" alt="주요사업"></div>
	                    <div class="right_content">
	                        <h3 class="title_bule">하남도시공사 창업경진대회</h3>
	                        <ul>
	                            <li class="title_dk">자격기준</li>
	                            <li><p>• 성장 잠재력이 우수한 바이오 헬스 및 4차산업 관련 스타트업 발굴</p></li>
	                            <li><p>• 기업유치 활성화 및 하남시 창업환경 조성을 통한 창업 촉진</p></li>
	                        </ul>
	                        <ul>
	                            <li class="title_dk">사업분야</li>
	                            <li><p>• 참가대상 : 예비창업자 또는 창업기업(창업 3년 이내)</p></li>
	                            <li><p>• 선정내역 : 5~10개팀 (포상 수여 등), 대상기업 스타트업캠퍼스 입주권 부여• 선정내역 : 5~10개팀 (포상 수여 등), 대상기업 스타트업캠퍼스 입주권 부여</p></li>
	                            <li><p>• 추후 지원 사업 및 입주심사 시 우대 혜택 부여</p></li>
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