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
    
                    <div class="col-lg-12 r-contents">

						<div class="col-lg-12" style="margin:0; padding:0;">
	                        <h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png' />">&nbsp;&nbsp;홍보자료 수정</h3>
	                    </div>
						<form id="galleryForm" onsubmit="return false">
                        	<table class="table board-table">
	                            <thead>
	                                <tr>
	                                    <td>
	                                        <div class="board-title">
												<div class="title-label">
	                                                <h5>제목</h5>
	                                                <input type="text" class="board-input" id="post_title" name="title" value="${TITLE}">
	                                            </div>
	                                            <div class="title-label">
	                                            	<h5>대표 이미지</h5>
	                                                <input type="file"
														class="board-input" id="representImageFile" name="representImageFile"
														accept=".jpg,.png,.gif" />
													<input type="hidden" value="${REPRESENT_IMAGE}" name="representImage" />
													<h5>첨부 파일</h5>
													<input class="board-input" multiple="multiple" type="file" name="file" id="file" style="display: inline-block;width: 200px;"/>
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
									    	<div class="gallery-represent-wrapper">
									    		<img id="representImageExample" src="<c:url value='/upload/gallery-represent/promotion' />/${REPRESENT_IMAGE}" onerror="this.src='<c:url value='/resources/img/default.png' />'" />
									    	</div>
									    </td>
									</tr>
	                                <tr>
	                                    <td class="board-contents">
	                                        <textarea class="fomr-control" id="post_editor" name="content">${CONTENT}</textarea>
	                                    </td>
	                                </tr>
	                            </tbody>
                        	</table>
    					</form>
                        <c:forEach items="${fileNames}" varStatus="status">

                        <form id="attachForm${status.index}" action="${pageContext.request.contextPath}/file/download" method="post" style="display: none;">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	<input type="hidden" name="fileName" value="${fileNames[status.index]}"/>
                        	<input type="hidden" name="filePath" value="${filePaths[status.index]}"/>
                        </form>
                        
                        </c:forEach>
                        <!-- <button type="button" class="search-btn mg-top-30" onClick="location.href='sub2-1.html'">목록</button> -->
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="
						    margin-top: 30px;
						">
						      <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="
								    margin-top: 30px;
								">
								      <div class="btn-group" role="group">
								      	<button type="button" class="btn btn-default" onclick="editPost();">게시글 수정</button>
								      </div>
								      <div class="btn-group" role="group" style="margin-top: 10px">
								      	<button type="button" class="btn btn-default" onclick="location.href='<c:url value='/gallery/promotion/view' />/${SEQ_ID}';">돌아가기</button>
								      </div>
									
								    </div>
						      
						      
						    </div>
    
                    </div><!-- r-contents div 끝 -->
                </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script  src="<c:url value='/resources/vendor/ckeditor/ckeditor.js' />"></script>
	<script >
		$(function() {	// DOM init
			$('#representImageFile').on('change', function() {				
				var reader = new FileReader();
				var fileName = this.files[0].name;
				var fileSize = this.files[0].size;
				var inputEl = this;
				
				reader.onload = function(e) {
					var maxSize = 10 * 1024 * 1024; // 제한 용량
					if(e.target.result) {
						if (!((fileName.endsWith('.jpg')
								|| fileName.endsWith('.png')
								|| fileName.endsWith('.gif')
							)
						&& fileSize <= maxSize
						)) {
							alert('대표 이미지는 10MB 이하의 jpg, png, gif 파일만 가능합니다.');
							inputEl.value = "";
							return false;	 
						} else {
							$('#representImageExample').attr('src',e.target.result);
						}
					}
				}
				reader.readAsDataURL(this.files[0]);
			});
			
			// CKEditor init start
			CKEDITOR.replace('post_editor', {
				height: 450,
				filebrowserUploadUrl: '<c:url value="/admin/promotion/upload/image" />',
						
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
		
		function editPost() {
			var title = document.querySelector('#post_title').value;
			var content = CKEDITOR.instances.post_editor.getData();
			var representImageFile = $("#representImageFile").prop('files');
			
			// Validation start
			if(title.trim() === '' || title.length > 50) {
				alert('제목을 50자 이내로 작성해주세요.');
				return false;
			} else if(content.trim() === '') {
				alert('게시글 내용을 작성해주세요.');
				return false;
			} else if(representImageFile && representImageFile[0]) {
				var maxSize = 10 * 1024 * 1024; // 제한 용량
				if (!((representImageFile[0].name.endsWith('.jpg')
						|| representImageFile[0].name.endsWith('.png')
						|| representImageFile[0].name.endsWith('.gif')
					)
				&& representImageFile[0].size <= maxSize
				)) {
					alert('대표 이미지는 10MB 이하의 jpg, png, gif 파일만 가능합니다.');
					return false;	 
				}
			} else {
				if(!confirm("새 대표 이미지를 업로드하지 않으면 기존 대표 이미지가 유지됩니다. 게시글 수정을 진행하시겠습니까?")) {
					return false;
				}
			}
			// Validation end
			$('textarea[name="content"]').val(CKEDITOR.instances.post_editor.getData());
			
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
			
			var gall = new FormData(galleryForm);
			
			gall.append('fileName',fileName);
			gall.append('filePath',filePath);
			
			if(confirm('게시글을 수정하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/gallery/promotion/post/edit" />/${SEQ_ID}',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					processData : false,
					contentType : false,
					data: gall,
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
							location.href = '<c:url value="/gallery/promotion/view" />/${SEQ_ID}';	
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