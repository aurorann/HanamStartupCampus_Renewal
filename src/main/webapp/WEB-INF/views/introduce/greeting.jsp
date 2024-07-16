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
	
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub1-1.css' />">

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
            <div class="sub_title">
                <h3>인사말</h3>
                <ol>
                    <li><img src="<c:url value='/resources/img/route_home_ico.png' />" alt="홈"></li>
                    <li>캠퍼스 소개</li>
                    <li>인사말</li>
                </ol>
            </div>

            <div class="contents">
                <div class="left_content"><img src="<c:url value='/resources/img/sub_img/인사말_img.png' />" alt="인사말"></div>
                <div class="right_content r_content1">
                    <h3>창업의 미래를 여는 기업,<br>여러분들과 함께하겠습니다.</h3>
                    <ul>
                        <li>
                            <h4>하남스타트업캠퍼스는</h4>
                            <p>하남시-한국산업은행-하남도시공사가 함께 협력하여 스타트업이 가속성장 할 수 있도록 지원하여 국내를 넘어 세계적인 기업으로 성장하는데 기여하고자 설립되었습니다.
                            </p>
                        </li>
                        <li>
                            <h4>캠퍼스는 모두에게 열려 있습니다.</h4>
                            <p>저희 캠퍼스는 바이오헬스 분야 스타트업의 공간뿐만 아니라  관련분야의 모든 사람들이 함께 의견을 나눌 수 있는 공유오피스 공간도 준비되어 있습니다.</p>
                        </li>
                        <li>
                            <h4>경쟁력을 마련하겠습니다.</h4>
                            <p>국경 없는 무한경쟁 시대에 대비하여 국제 경쟁력을 갖는 스타트업의 성장을 위해 사업화 지원사업, 전문교육, 바이오헬스 실증 및 체험 클러스터 협의회 등 다양한 사업을 제공하고 있습니다.</p>
                        </li>
                        <li>
                            <h4>창업에서 성공까지 함께 하겠습니다.</h4>
                            <p>
                                캠퍼스는 창업준비, 기술개발, 제품개발, 생산준비, 본격생산을 통해 기업공개까지 창업기업 성장 全단계에 걸쳐 함께할 것이며 도움이 필요한 모든 스타트업에게 열려있습니다.
                                <span>-창업에서 성공까지 함께하는 캠퍼스가 되겠습니다.-</span>
                            </p>
                        </li>
                    </ul>
                </div>
            </div><!--contents-->
        </main>
	</div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	
	<!-- extension end -->
	

</body>
</html>