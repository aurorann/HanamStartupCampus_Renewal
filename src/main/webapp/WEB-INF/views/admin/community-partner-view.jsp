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
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub-pvt3.css' />">
	
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
                    <li>작성자<span>
						<c:choose> 
							<c:when test="${WRITER_NAME == null}">
								익명
							</c:when> 
							<c:otherwise>
								${WRITER_NAME}
							</c:otherwise> 
						</c:choose> 
                    </span></li>
                    <li>등록일<span data-post-element="contractEndAt" >${CREATED_AT}</span></li>
                    <li>조회수<span data-post-element="viewCount">${VIEW_COUNT}</span></li>
                </ul>
            </div>
            
            <div class="container_wrap">
                    <div class="content_text">
						${CONTENT}
						
						<c:if test="${not empty FILE_NAME}">
							<c:set var="fileNames" value="${fn:split(FILE_NAME,':')}" />
							<c:set var="filePaths" value="${fn:split(FILE_PATH,':')}" />
							<ul class="file_wrap">
								<c:forEach items="${fileNames}" varStatus="status">
									<a href="#">
										<img src="<c:url value='/resources/img/sub_img/file_ico.png' />" id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();" alt="파일">
										<span id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();">${fileNames[status.index]}</span>
									</a>
									<form id="attachForm${status.index}" action="${pageContext.request.contextPath}/file/download" method="post" style="display: none;">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<input type="hidden" name="fileName" value="${fileNames[status.index]}"/>
										<input type="hidden" name="filePath" value="${filePaths[status.index]}"/>
									</form><br/>
								</c:forEach>
							</ul>
						</c:if>
                    </div>
                    
                <div class="content_comment">
                    <div class="comment_write">
                        <strong><img src="<c:url value='/resources/img/sub_img/comment_ico.png' />" alt="댓글">댓글<span>&nbsp; ${postCnt}</span></strong>
                        <form action="<c:url value='/admin/community/comment/post/${SEQ_ID}' />" method="post">
                        	<input type="hidden" name="postId" value="${SEQ_ID}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="text" name="content" placeholder="댓글을 입력하세요.">
                            <button type="submit">댓글달기</button>
                        </form>
                    </div>
                    <div class="comment_talk_wrap">
                    
					    <c:forEach items="${post}" var="post">
						<div class="comment_talk_box">
							<c:if test="${post.seqId eq post.commentGroup}">
	                            <div class="comment_talk">
	                                <div class="talk1">
	                                    <h4>${post.writerName}</h4>
	                                    <time datetime="${post.createdAt}">${fn:substring(post.createdAt, 0, 16)}</time>
	                                </div>
	                                <div class="talk2">
	                                    <p>${post.content}</p>
	                                    <div class="talk2_btns">
	                                        <button class="write2_btn">답글쓰기</button>
							            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
			                                	<button class="delet2_btn" onclick="deleteCommentPost(${post.seqId})">삭제</button>
							            	</sec:authorize>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="comment_write comment_wwrite">
	                                <form action="<c:url value='/user/community/comment/post/${SEQ_ID}' />" method="post">
										<input type="hidden" name="postId" value="${SEQ_ID}">
										<input type="hidden" name="commentGroup" value="${post.commentGroup}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                                    
										<input type="text" name="content" placeholder="댓글을 입력하세요.">
	                                    <div class="talk2_btns"><button type="submit">답글쓰기</button></div>
	                                </form>
	                            </div><!--답글쓰기-->
							</c:if>
                        
							<c:if test="${post.seqId ne post.commentGroup}">
	                           <div class="comment_ttalk">
	                               <div class="talk1">
	                                   <h4>${post.writerName}</h4>
	                                   <time datetime="${post.createdAt}">${fn:substring(post.createdAt, 0, 16)}</time>
	                               </div>
	                               <div class="talk2">
	                                   <p>${post.content}</p>
	                                   <div class="talk2_btns">
	                                       <button class="write2_btn">답글쓰기</button>
							            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
			                                	<button class="delet2_btn" onclick="deleteCommentPost(${post.seqId})">삭제</button>
							            	</sec:authorize>
	                                   </div>
	                               </div>
	                           </div>
	                           <div class="comment_write comment_wwrite">
	                                <form action="<c:url value='/user/community/comment/post/${SEQ_ID}' />" method="post">
										<input type="hidden" name="postId" value="${SEQ_ID}">
										<input type="hidden" name="commentGroup" value="${post.commentGroup}">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                                    
										<input type="text" name="content" placeholder="댓글을 입력하세요.">
	                                    <div class="talk2_btns"><button type="submit">답글쓰기</button></div>
	                                </form>
	                           </div><!--답글쓰기-->
							</c:if>
						</div>
					    </c:forEach>
                </div><!--content_comment-->
            </div><!--container_wrap-->
                    
            </div><!--container_wrap-->
            
            
            <div class="page_btn_wrap">
            	<div class="back_btn">
            		<a href="<c:url value="/admin/user/community/list" />">목록</a>
            	</div>
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
            		<c:if test="${WRITER_ID eq VIEWER_ID}">
		            	<div class="function_btns">
							<a href="<c:url value="/admin/community/edit/form/" />${SEQ_ID}" class="modify_btn">수정</a>
		                    <a href="#" class="delet_btn" onclick="deleteNoticePost(${SEQ_ID})">삭제</a>
		                </div>
	                </c:if>
            	</sec:authorize>
            	<sec:authorize ifAnyGranted="ROLE_ADMIN">
	            	<div class="function_btns">
	                    <a href="#" class="delet_btn" onclick="deleteNoticePost(${SEQ_ID})">삭제</a>
	                </div>
            	</sec:authorize>
            </div>
			</div>
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
		
		var insideMenu = '입주기업 커뮤니티';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
		
		<sec:authorize ifAnyGranted="ROLE_ADMIN">
			function deleteNoticePost(seqId) {
				if(confirm("해당 게시물을 삭제하시겠습니까?")) {
					$.ajax({
						type : 'POST',
						cache: false,
						url : '<c:url value="/admin/user/community/post/remove" />/' + seqId,
						headers : {
							'${_csrf.headerName}' : '${_csrf.token}'
						},
						success : function(result) {
							if(result.count > 0) {
								alert(result.message);
								location.href = '<c:url value="/admin/user/community/list" />';	
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
			
			
			
			function deleteCommentPost(seqId) {
				if(confirm("해당 작성하신 댓글을 삭제하시겠습니까?")) {
					$.ajax({
						type : 'POST',
						cache: false,
						url : '<c:url value="/admin/community/comment/post/remove" />/' + seqId,
						headers : {
							'${_csrf.headerName}' : '${_csrf.token}'
						},
						success : function(result) {
							if(result.count > 0) {
								alert(result.message);
								location.href = '<c:url value="/admin/user/community/list" />';	
							} else {
								alert('삭제 실패, 관리자에게 문의해주세요.');
							}
						},
						error : function(error) {
							alert('댓글 삭제 실패, 관리자에게 문의해주세요.');
							console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
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