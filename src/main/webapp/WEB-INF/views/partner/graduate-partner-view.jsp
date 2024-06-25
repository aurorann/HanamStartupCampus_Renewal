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
                    
                    <table class="table board-table">
                        <thead>
                            <tr>
                                <td>
                                    <div class="board-title">
                                        <h1 class="title-text" data-post-element="title">${NAME}</h1>

                                        <div class="start-end-label">
                                            <h5>대표자 <small >${CEO_NAME}</small></h5>
                                            <h5>입주실 <small >${ROOM_NAME}</small></h5>
                                            <h5 onclick="location.href='${HOMEPAGE}'" style="cursor: pointer;">웹사이트 <small >${HOMEPAGE}</small></h5>
                                            <h5>연락처 <small >${CONTRACT}</small></h5>
                                            
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
							    <td>
							    	<div class="gallery-represent-wrapper">
							    		<img id="representImageExample" src="<c:url value='/upload/partner-represent' />/${PROFILE_IMAGE}" onerror="this.src='<c:url value='/resources/img/default.png' />';" />
							    	</div>
							    </td>
							</tr>
                            <tr>
                                <td class="board-contents" data-post-element="content">
                                    <!-- board content -->
                                    ${INTRODUCE}
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <button type="button" class="search-btn mg-top-30" onclick="location.href='<c:url value="/partner/graduate/list" />'" style="margin-right: 10px;">목록</button>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
						<button type="button" class="search-btn mg-top-30" onclick="location.href='<c:url value="/admin/partner/edit/form/" />${SEQ_ID}';" style="margin-right: 10px;">수정</button>
					</sec:authorize>

                </div><!-- r-contents div 끝 -->
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