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
    
    <!-- Extention Start -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/datepicker/css/datepicker.min.css' />">
    <script  src="<c:url value='/resources/vendor/datepicker/js/datepicker.min.js' />"></script>
    <!-- Extention End -->
    
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

			<div class="container_wrap">
			    <%@ include file="./include/inside-menu.jsp"%>
			    
            <div class="container_txt">
                <h3 data-post-element="title">${TITLE}</h3>
                <ul>
                    <li>작성자<span>${WRITER_NAME}</span></li>
                    <li>등록일<span data-post-element="contractEndAt" >${CREATED_AT}</span></li>
                    <li>조회수<span data-post-element="viewCount">${VIEW_COUNT}</span></li>
                </ul>
            </div>
            
            <div class="container_wrap">
                <div class="content_wrap">
                    <div class="content_text">
						${CONTENT}
						
						<c:if test="${not empty FILE_NAME}">
							<c:set var="fileNames" value="${fn:split(FILE_NAME,':')}" />
							<c:set var="filePaths" value="${fn:split(FILE_PATH,':')}" />
							<ul class="file_wrap">
								<c:forEach items="${fileNames}" varStatus="status">
									<li>
										<a href="#">
											<img src="<c:url value='/resources/img/sub_img/file_ico.png' />" id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();" alt="파일">
											<span id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();">${fileNames[status.index]}</span>
										</a>
									</li>
									<form id="attachForm${status.index}" action="${pageContext.request.contextPath}/file/download" method="post" style="display: none;">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<input type="hidden" name="fileName" value="${fileNames[status.index]}"/>
										<input type="hidden" name="filePath" value="${filePaths[status.index]}"/>
									</form><br/>
								</c:forEach>
							</ul>
						</c:if>
                    </div>
                </div><!--content_wrap 콘텐츠-->
            </div><!--container_wrap-->
            
            <div class="page_btn_wrap">
            	<div class="back_btn">
            		<a href="<c:url value="/admin/partner/file/list" />">목록</a>
            	</div>
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<div class="function_btns">
						<a href="<c:url value="/admin/partner/file/edit/form/" />${SEQ_ID}" class="modify_btn">수정</a>
	                    <a href="#" class="delet_btn" onclick="deleteNoticePost(${SEQ_ID})">삭제</a>
	                </div>
            	</sec:authorize>
            </div>
            
            
            <!-- 
            <div class="back_btn"><a href="<c:url value="/admin/partner/file/list" />">목록</a></div>

			<sec:authorize ifAnyGranted="ROLE_ADMIN">
				<button type="button" class="search-btn mg-top-30" onclick="location.href='<c:url value="/admin/partner/file/edit/form/" />${SEQ_ID}';" style="margin-right: 10px;">수정</button>
				<button type="button" class="search-btn mg-top-30" onclick="deleteNoticePost(${SEQ_ID});" style="margin-right: 10px;">삭제</button>
			</sec:authorize>
			 -->
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script >
		$(function() {	// DOM 객체 init
			if("${error}" !== "") {
				alert("게시물을 찾을 수 없습니다.");
				location.href = "<c:url value='/' />";
			}
		});
		
		var insideMenu = '서식 자료실';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
		
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			function deleteNoticePost(seqId) {
				if(confirm("해당 게시물을 삭제하시겠습니까?")) {
					$.ajax({
						type : 'POST',
						cache: false,
						url : '<c:url value="/admin/partner/file/post/remove" />/' + seqId,
						headers : {
							'${_csrf.headerName}' : '${_csrf.token}'
						},
						success : function(result) {
							if(result.count > 0) {
								alert(result.message);
								location.href = '<c:url value="/admin/partner/file/list" />';	
							} else {
								alert('작성 실패, 관리자에게 문의해주세요.');
							}
						},
						error : function(error) {
							alert('게시글 삭제 실패, 관리자에게 문의해주세요.');
						},
						statusCode : {
							302 : function(res, statTxt, jqXHR) {
								alert('로그인이 필요한 기능입니다.');
								return false;
							}
						}
					});
				} else {
					return;
				}
			}
		</sec:authorize>
	</script>
	<!-- extension end -->
	

</body>
</html>