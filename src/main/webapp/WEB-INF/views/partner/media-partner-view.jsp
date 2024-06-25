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
	
	<style>
   		.embed-container {
   			position: relative;
   			padding-bottom: 56.25%;
   			height: 0;
   			overflow: hidden;
   			max-width: 100%;
   		}
   		.embed-container iframe, .embed-container object, .embed-container embed {
   			position: absolute;
   			top: 0;
   			left: 0;
   			width: 100%;
   			height: 100%;
   		}
   	</style>
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
                                    	<span class="white-label">입주기업 소개 영상</span>
                                        <h1 class="title-text" data-post-element="title">${TITLE}</h1>

                                        <div class="start-end-label">
                                            <h5>등록일 <small data-post-element="contractStartAt">${CREATED_AT}</small></h5>
                                            <h5>조회수 <small data-post-element="viewCount">${VIEW_COUNT}</small></h5>
                                            
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
							    <td>
							    	<div class="embed-container">
							    		<iframe id="embededYoutubePlayer" src="https://www.youtube.com/embed//${YOUTUBE_ID}" allowfullscreen="">
							    		</iframe>
							    	</div>
							    </td>
							</tr>
                            <tr>
                                <td class="board-contents" data-post-element="content">
                                    <!-- board content -->
                                    ${CONTENT}
                                </td>
                            </tr>
                            <c:if test="${not empty FILE_NAME}">
								<c:set var="fileNames" value="${fn:split(FILE_NAME,':')}" />
								<c:set var="filePaths" value="${fn:split(FILE_PATH,':')}" />
								<tr>
									<td class="board-contents" style="padding: 10px;">
										<c:forEach items="${fileNames}" varStatus="status">
											<img src="<c:url value='/resources/img/sub/icon_file.gif' />" style="display: inline-table;">
											<small id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();" style="color: gray;">${fileNames[status.index]}</small>
											<form id="attachForm${status.index}" action="${pageContext.request.contextPath}/file/download" method="post" style="display: none;">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<input type="hidden" name="fileName" value="${fileNames[status.index]}"/>
												<input type="hidden" name="filePath" value="${filePaths[status.index]}"/>
											</form><br/>
										</c:forEach>
									</td>
								</tr>
							</c:if>
                        </tbody>
                    </table>

                    <button type="button" class="search-btn mg-top-30" onclick="location.href='<c:url value="/partner/media/list" />'" style="margin-right: 10px;">목록</button>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
						<button type="button" class="search-btn mg-top-30" onclick="location.href='<c:url value="/admin/partner/media/edit/form/" />${SEQ_ID}';" style="margin-right: 10px;">수정</button>

						<button type="button" class="search-btn mg-top-30" onclick="deleteNoticePost(${SEQ_ID});" style="margin-right: 10px;">삭제</button>
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
		
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			function deleteNoticePost(seqId) {
				if(confirm("해당 게시물을 삭제하시겠습니까?")) {
					$.ajax({
						type : 'POST',
						cache: false,
						url : '<c:url value="/admin/partner/media/post/remove" />/' + seqId,
						headers : {
							'${_csrf.headerName}' : '${_csrf.token}'
						},
						success : function(result) {
							if(result.count > 0) {
								alert(result.message);
								location.href = '<c:url value="/partner/media/list" />';	
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