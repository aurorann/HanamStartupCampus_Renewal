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
			<div class="right-contents col-lg-9">
				<!-- # include: title-box start -->
				<%@ include file="./include/title-box.jsp"%>
				<!-- # include: title-box end -->
				<!-- 
				<a href="<c:url value='/resources/download/hanam_leaflet_1p.jpg' />" download>하남 리플렛 1p</a>
				<a href="<c:url value='/resources/download/hanam_leaflet_2p.jpg' />" download>하남 리플렛 2p</a>
				 -->
	            <div class="conts_text">
	                <ul class="file_wrap">
	                    <li>
	                        <a href="<c:url value='/resources/download/hanam_leaflet_1p.jpg' />" download><img src="<c:url value="/resources/img/sub_img/file_ico.png" />" alt="파일">하남 스타트업 캠퍼스 리플렛 1P</a>
	                    </li>
	                    <li>
	                        <a href="<c:url value='/resources/download/hanam_leaflet_2p.jpg' />" download><img src="<c:url value="/resources/img/sub_img/file_ico.png" />" alt="파일">하남 스타트업 캠퍼스 리플렛 2P</a>
	                    </li>
	                </ul>
	
	                <img src="<c:url value='/resources/img/sub_img/leaflet_img1.png' />" alt="홍보리플렛">
	                <img src="<c:url value='/resources/img/sub_img/leaflet_img2.png' />" alt="홍보리플렛">
	            </div><!--conts_text-->
			
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