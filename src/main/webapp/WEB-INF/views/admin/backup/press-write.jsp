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
                    	<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
					      <a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">보도자료 글쓰기</a>
					      <a href="<c:url value='/admin/gallery/promotion/write/form' />" class="btn btn-default" role="button">홍보자료 글쓰기</a>
					      <a href="<c:url value='/admin/gallery/bio-info/write/form' />" class="btn btn-default" role="button">바이오 소식 글쓰기</a>
					    </div>
							<form id="galleryForm" onsubmit="return false" enctype="multipart/form-data">
	                        	<table class="table board-table">
		                            <thead>
		                                <tr>
		                                    <td>
		                                        <div class="board-title">
													<div class="title-label">
		                                                <h5>제목</h5>
		                                                <input type="text" class="board-input" name="title" id="post_title">
		                                            </div>
		                                            
		                                            <div class="title-label">
		                                            	<h5>대표 이미지</h5>
		                                                <input type="file"
															class="board-input" id="representImageFile" name="representImageFile"
															accept=".jpg,.png,.gif" />
														<h5>첨부 파일</h5>
														<input class="board-input" type="file" name="file" id="file" multiple="multiple" style="display: inline-block;"/>
		                                            </div>
		                                            
		                                        </div>
		                                    </td>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            	<tr>
										    <td>
										    	<div class="gallery-represent-wrapper">
										    		<img id="representImageExample" onerror="this.src='<c:url value='/resources/img/default.png' />'" src="<c:url value='/resources/img/default.png' />" />
										    	</div>
										    </td>
										</tr>
		                                <tr>
		                                    <td class="board-contents">
		                                        <textarea class="fomr-control" id="post_editor" name="content"></textarea>
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
							</form>
    					
                        <!-- <button type="button" class="search-btn mg-top-30" onClick="location.href='sub2-1.html'">목록</button> -->
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="
						    margin-top: 30px;
						">
						      <div class="btn-group" role="group">
						        <button type="button" class="btn btn-default" onclick="writeNewPost();">게시글 작성</button>
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
				filebrowserUploadUrl: '<c:url value="/admin/press/upload/image" />',
						
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
		
		function writeNewPost() {
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
				alert('대표 이미지가 필요합니다. (10MB 이하의 jpg, png, gif 파일만 가능)');
				return false;
			}
			// Validation end
			$('textarea[name="content"]').val(CKEDITOR.instances.post_editor.getData());
			
			var fileName = '';
			var filePath = '';
			
			if($('#file').val()){
				var formData = new FormData(); 
				//formData.append('file',$('#file')[0].files);
				
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
			
			if(confirm('게시글을 작성하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/gallery/press/post/write" />',
					processData : false,
					contentType : false,
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					cache : false,
					enctype : 'multipart/form-data',
					data: gall,
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
							location.href = '<c:url value="/gallery/press/list" />';	
						} else {
							alert('작성 실패, 관리자에게 문의해주세요.');
						}
					},
					error : function(error) {
						alert('작성 실패, 관리자에게 문의해주세요.');
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