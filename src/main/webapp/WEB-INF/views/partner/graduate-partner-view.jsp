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
			<!-- # include: title-box start -->
			<%@ include file="./include/title-box.jsp"%>
			<!-- # include: title-box end -->
			
            <div class="container_txt">
                <h3>${NAME}</h3>
                <ul>
                    <li>대표자<span class="txt_blue">${CEO_NAME}</span></li>
                    <li>입주실<span class="txt_blue">${ROOM_NAME}</span></li>
                    <li>웹사이트<span><a href="${HOMEPAGE}" class="txt_blue">${HOMEPAGE}</a></span></li>
                    <li>연락처<span class="txt_blue">${CONTRACT}</span></li>
                </ul>
            </div><!--container_txt-->

            <div class="container_wrap">
                <div class="content_wrap">
                    <div class="content_text">
			    		<img id="representImageExample" src="<c:url value='/upload/partner-represent' />/${PROFILE_IMAGE}" onerror="this.src='<c:url value='/resources/img/default.png' />';" />
			    		${INTRODUCE}
                    </div>
                </div><!--content_wrap-->
            </div><!--container_wrap-->
            
            <div class="page_btn_wrap">
            	<div class="back_btn">
            		<a href="<c:url value="/partner/list" />">목록</a>
            	</div>
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<div class="function_btns">
						<a href="<c:url value="/admin/partner/edit/form/" />${SEQ_ID}" class="modify_btn">수정</a>
	                </div>
            	</sec:authorize>
            </div>
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function() {	// DOM 객체 init
			if("${error}" !== "") {
				alert("게시물을 찾을 수 없습니다.");
				location.href = "<c:url value='/' />";
			}
		});
	</script>
	<!-- extension end -->
	

</body>
</html>