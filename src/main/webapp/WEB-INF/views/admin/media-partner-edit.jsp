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
				    
	                <div class="board_write_wrap">
	                    <div class="board_write_title">
	                        <div class="titleWrap">
	                            <label for="title">제목</label>
	                            <input type="text" id="post_title" name="title" value="${TITLE}">
	                        </div>
	                        <div class="fileWrap">
	                            <label>Youtube 영상 ID</label>
								<input type="text" class="board-input" id="youtubeId" value='${YOUTUBE_ID}' placeholder="예시) https://youtu.be/(Youtube 영상 ID)"/>
                                    <button type="button" class="btn btn-default" aria-label="Left Align" onclick="setYoutubeLink();">
                                    	미리보기
                                    </button>
								<form id="fileForm" method="post" enctype="multipart/form-data">
									<div class="not_box"></div>
		                            <label for="file">파일찾기</label>
									<input class="board-input" type="file" name="file" id="file" multiple="multiple" style="display: inline-block; width: 300px"/>
								</form>
	                        </div>
	                        <p>※ 새로운 첨부파일 등록 시, 기존 파일 목록을 대체합니다.</p>
	                    </div>
	                    
						<c:if test="${not empty FILE_NAME}">
							<c:set var="fileNames" value="${fn:split(FILE_NAME,':')}" />
							<c:set var="filePaths" value="${fn:split(FILE_PATH,':')}" />
								<ul class="file_wrap">
									<c:forEach items="${fileNames}" varStatus="status">
										<li>
											<a href="#" id="attach" data-post-element="file" onclick="document.getElementById('attachForm${status.index}').submit();" style="color: gray;">
												<img src="<c:url value='/resources/img/sub_img/file_ico.png' />" alt="파일">
												${fileNames[status.index]}
											</a>
											<form id="attachForm${status.index}" action="${pageContext.request.contextPath}/file/download" method="post" style="display: none;">
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<input type="hidden" name="fileName" value="${fileNames[status.index]}"/>
												<input type="hidden" name="filePath" value="${filePaths[status.index]}"/>
											</form>
										</li>
									</c:forEach>
								</ul>
						</c:if> 
	                    
	                    <div class="board_write_content">
	                    	<div class="youtube_link">
					    		<iframe id="embededYoutubePlayer" src="https://www.youtube.com/embed//${YOUTUBE_ID}" frameborder="0" allowfullscreen=""></iframe>
				    		</div>
	                    </div>
	                    <div class="board_write_post board-contents">
	                        <textarea name="content fomr-control" id="post_editor" name="content">${CONTENT}</textarea>
	                    </div>
	                    
	                </div>
                    

						<!-- 
                        <table class="table board-table">
                            <thead>
                                <tr>
                                    <td>
                                        <div class="board-title">
											<div class="title-label">
                                                <h5>제목</h5>
                                                <input type="text" class="board-input" id="post_title" value="${TITLE}">
                                            </div>
                                            <div class="title-label">
                                            	<h5>Youtube 영상 ID</h5>
                                                <input type="text" class="board-input" id="youtubeId" value='${YOUTUBE_ID}' placeholder="예시) https://youtu.be/(Youtube 영상 ID)"/>
                                                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="setYoutubeLink();">
                                                	미리보기
                                                </button>
                                            </div>
                                            <div class="start-end-label">
                                                <h5>첨부 파일 : 
                                                
                                               	<input type="file" name="file" id="file" multiple="multiple" style="display: inline-block;width: 200px;"/>

	                                            </h5>
	                                            <br/><br/><small>※ 새로운 첨부파일 등록 시, 기존 파일 목록을 대체합니다.</small>
		                                    </div>
                                        </div>
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
                            </thead>
                            <tbody>
                            	<tr>
								    <td>
								    	<div class="embed-container">
								    		<iframe id="embededYoutubePlayer" src="https://www.youtube.com/embed//${YOUTUBE_ID}" frameborder="0" allowfullscreen="">
								    		</iframe>
								    	</div>
								    </td>
								</tr>
								<tr><td> ※ 유튜브 재생영상 미리보기</td></tr>
                                <tr>
                                    <td class="board-contents">
                                        <textarea class="fomr-control" id="post_editor" name="content">${CONTENT}</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
    
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="margin-top: 30px;">
						      <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="margin-top: 30px;">
								      <div class="btn-group" role="group">
								      	<button type="button" class="btn btn-default" onclick="editPost();">게시글 수정</button>
								      </div>
								      <div class="btn-group" role="group" style="margin-top: 10px">
								      	<button type="button" class="btn btn-default" onclick="location.href='<c:url value='/partner/media/view' />/${SEQ_ID}';">돌아가기</button>
								      </div>
								</div>
						    </div>
						     -->
						     
						<div class="board_wrap_btn">
							<a href="#" onclick="editPost();">게시글 수정</a>
							<a href="#" onclick="location.href='<c:url value='/partner/media/view' />/${SEQ_ID}';">돌아가기</a>
						</div>
						    
						    
						    

                    </div><!-- r-contents div 끝 -->
                </div><!-- right-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script  src="<c:url value='/resources/vendor/ckeditor/ckeditor.js' />"></script>
	<script >
		$(function() {	// DOM init
			// CKEditor init start
			CKEDITOR.replace('post_editor', {
				height: 450,
				filebrowserUploadUrl: '<c:url value="/admin/partner-media/upload/image" />',
						
				format_tags: 'p;h1;h2;h3;pre',
	
				allowedContent : true,
				extraPlugins: 'image,uploadimage',
				toolbar : [
						[ 'NewPage', 'Preview', 'Bold', 'Italic', 'Underline',
								'Strike', '-', 'Subscript', 'Superscript', '-',
								'-', 'JustifyLeft', 'JustifyCenter',
								'JustifyRight', 'JustifyBlock', '-', 'Outdent',
								'Indent', 'HorizontalRule', 'Link', 'Unlink', '-',
								'Find', 'Replace', 'SelectAll', 'Image', 'Flash',
								'Table', 'SpecialChar' ], '/',
						[ 'Styles', 'Format', 'Font', 'FontSize', ' Undo', 'Redo' ],
						[ 'TextColor', 'BGColor' ],
						[ 'Cut', 'Copy', 'Paste', 'PasteText' ], [ 'Source' ] ],
			});
		
			CKEDITOR.instances.post_editor.on('fileUploadRequest', function( evt ) {
			    var xhr = evt.data.fileLoader.xhr;
			    xhr.setRequestHeader( '${_csrf.headerName}', '${_csrf.token}' );
			    xhr.withCredentials = true;
			} );
			// CKEditor init end
		})
		var insideMenu = '소개영상 글쓰기';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
		
		
		function editPost() {
			var title = document.querySelector('#post_title').value;
			var content = CKEDITOR.instances.post_editor.getData();
			var youtubeId = document.querySelector('#youtubeId').value;
			
			// Validation start
			if(title.trim() === '' || title.length > 200) {
				alert('제목을 50자 이내로 작성해주세요.');
				return false;
			} else if(content.trim() === '') {
				alert('게시글 내용을 작성해주세요.');
				return false;
			} else if(youtubeId.trim() === '') {
				alert('Youtube 영상의 ID를 입력해주세요. (영상 정상재생 확인 필요)');
				return false;
			}
			
			// Validation end		
			
			var fileName = '${FILE_NAME}';
			var filePath = '${FILE_PATH}';
			
			if($('#file').val()){
				var formData = new FormData(); 
				//formData.append('file',$('#file')[0].files[0]);
				$.each($("#file")[0].files, function(i, file) {
					formData.append('file', file);
				});
				
				$.ajax({
					type: "POST", 
					enctype: 'multipart/form-data', // 필수 
					url: '<c:url value="/admin/notice/upload/file" />', 
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					async : false,
					data: formData, // 필수 
					dataType: "json",
					processData: false, // 필수 
					contentType: false, // 필수 
					cache: false, 
					success: function (result) { 
						console.log("성공")
						console.log(result);
						
						fileName=result.originName;
						filePath=result.url;
					}, 
					error: function (e) { 
						console.log(e);
					}
				});
			}
			
			var data = {
				title: title,
				content: content,
				youtubeId: youtubeId,
				fileName: fileName,
				filePath: filePath
			};
			
			if(confirm('게시글을 수정하시겠습니까? (영상 정상재생 확인 필요)')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/partner/media/post/edit" />/${SEQ_ID}',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					data: data,
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
							location.href = '<c:url value="/partner/media/view" />/${SEQ_ID}';	
						} else {
							alert('게시글을 수정할 수 없습니다, 관리자에게 문의해주세요.');
						}
					},
					error : function(error) {
						alert('게시글을 수정할 수 없습니다, 관리자에게 문의해주세요.');
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
		
		function setYoutubeLink() {
			$("#embededYoutubePlayer").attr("src", "https://www.youtube.com/embed//" + $("#youtubeId").val());
		}
	</script>
	
	<!-- extension end -->
	

</body>
</html>