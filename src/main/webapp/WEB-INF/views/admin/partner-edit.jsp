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
	                    
	                    
						<form id="galleryForm" onsubmit="return false">
			                <div class="board_write_wrap">
			                    <div class="board_write_title">
			                        <div class="titleWrap search_form">
										<label for="title">기업 입주 여부</label>
											<select class="board-input" name="activate" id="activate" style="width: 180px">
												<option value="PARTNER">입주기업 (공개)</option>
												<option value="GRADUATE">졸업기업 (공개)</option>
												<option value="EMPTY">공실 (비공개)</option>
											</select>
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">입주기업명</label>
			                            <input type="text" id="name" name="name" value="${NAME}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">업종구분</label>
			                            <input type="text" id="businessName" name="businessName" value="${BUSINESS_NAME}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">기업 대표자명</label>
			                            <input type="text" id="ceoName" name="ceoName" value="${CEO_NAME}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">입주실 이름</label>
			                            <input type="text" id="roomName" name="roomName" value="${ROOM_NAME}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">웹사이트</label>
			                            <input type="text" id="homepage" name="homepage" value="${HOMEPAGE}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">연락처</label>
			                            <input type="text" id="contract" name="contract" value="${CONTRACT}">
			                        </div>
			                        <div class="titleWrap">
			                            <label for="title">패스워드 초기화</label>
			                            <input type="password" class="board-input" id="accountPw" name="accountPw" maxlength="100" required placeholder="공란인 경우, 기존 패스워드가 유지됩니다.">
			                        </div>
									<div class="fileWrap">
			                            <label for="imgFile">입주기업 대표 이미지</label>
										<input type="file" class="board-input" id="representImageFile" name="profileImageFile" accept=".jpg,.png,.gif" />
										<input type="hidden" value="${PROFILE_IMAGE}" name="profileImage" />
									</div>
			                    </div>
			                    
			                    <div class="board_write_content">
						    		<img id="representImageExample" src="<c:url value='/upload/partner-represent' />/${PROFILE_IMAGE}" onerror="this.src='<c:url value='/resources/img/default.png' />';" />
			                    </div>
				
			                    <div class="board_write_post board-contents">
									<textarea class="fomr-control" id="post_editor" name="introduce">${INTRODUCE}</textarea>
			                    </div>
			                    
			                </div>
						
							<!-- 
	                        <table class="table board-table">
	                            <thead>
	                                <tr>
	                                    <td>
	                                        <div class="board-title">
	                                        	<div class="title-label">
	                                                <h5>기업 입주 여부</h5>
	                                                <select class="board-input" name="activate" id="activate">
	                                                	<option value="PARTNER">입주기업 (공개)</option>
	                                                	<option value="GRADUATE">졸업기업 (공개)</option>
	                                                	<option value="EMPTY">공실 (비공개)</option>
	                                                </select>
	                                            </div>
	                                        	<div class="title-label">
	                                                <h5>입주기업명</h5>
	                                                <input type="text" class="board-input" id="name" name="name" value="${NAME}" maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>업종구분</h5>
	                                                <input type="text" class="board-input" id="businessName" name="businessName" value="${BUSINESS_NAME}" maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>기업 대표자명</h5>
	                                                <input type="text" class="board-input" id="ceoName" name="ceoName" value="${CEO_NAME}"  maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>입주실 이름</h5>
	                                                <input type="text" class="board-input" id="roomName" name="roomName" value="${ROOM_NAME}"  maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>웹사이트</h5>
	                                                <input type="text" class="board-input" id="homepage" name="homepage" value="${HOMEPAGE}"  maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>연락처</h5>
	                                                <input type="text" class="board-input" id="contract" name="contract" value="${CONTRACT}" maxlength="100" required>
	                                            </div>
	                                            <div class="title-label">
	                                                <h5>패스워드 초기화</h5>
	                                                <input type="password" class="board-input" id="accountPw" name="accountPw" maxlength="100" required placeholder="공란인 경우, 기존 패스워드가 유지됩니다.">
	                                            </div>
	                                            <div class="title-label">
	                                            	<h5>입주기업 대표 이미지</h5>
	                                                <input type="file"
														class="board-input" id="representImageFile" name="profileImageFile"
														accept=".jpg,.png,.gif" />
													<input type="hidden" value="${PROFILE_IMAGE}" name="profileImage" />
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
									<tr><td> ※ 입주사 대표 이미지 미리보기</td></tr>
	                                <tr>
	                                    <td class="board-contents">
	                                        <textarea class="fomr-control" id="post_editor" name="introduce">${INTRODUCE}</textarea>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
							 -->




                        </form>
    
    
    					<!-- 
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="margin-top: 30px;">
							<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="margin-top: 30px;">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-default" onclick="editPost();">정보 수정</button>
								</div>
								<div class="btn-group" role="group" style="margin-top: 10px">
									<button type="button" class="btn btn-default" onclick="location.href='<c:url value='/admin/partner/list' />';">돌아가기</button>
								</div>
							</div>
					    </div>
					     -->
					     
						<div class="board_wrap_btn">
							<a href="#" onclick="editPost();">게시글 수정</a>
							<a href="#" onclick="location.href='<c:url value='/admin/partner/list' />/${SEQ_ID}';">돌아가기</a>
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
			$("select#activate").val("${ACTIVATE}");
			
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
				filebrowserUploadUrl: '<c:url value="/admin/partner/upload/image" />',
						
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
		
		var insideMenu = '입주기업 정보 관리';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
		
		function editPost() {
			var password = document.querySelector('#accountPw').value;
			var name = document.querySelector('#name').value;
			var businessName = document.querySelector('#businessName').value;
			var roomName = document.querySelector('#roomName').value;
			var homepage = document.querySelector('#homepage').value;
			var ceoName = document.querySelector('#ceoName').value;
			var contract = document.querySelector('#contract').value;
			var introduce = CKEDITOR.instances.post_editor.getData();
			var representImageFile = $("#representImageFile").prop('files');
			var content = CKEDITOR.instances.post_editor.getData();
			
			// Validation start
			if(name.trim() === '' || name.length > 100) {
				alert('입주기업명을 100자 이내로 작성해주세요.');
				return false;
			} else if(businessName.trim() === '' || businessName.length > 100) {
				alert('업종구분을 100자 이내로 작성해주세요.');
				return false;
			} else if(ceoName.trim() === '' || ceoName.length > 100) {
				alert('대표자 이름을 100자 이내로 작성해주세요.');
				return false;
			} else if(roomName.trim() === '' || roomName.length > 100) {
				alert('입주실 이름를 100자 이내로 작성해주세요.');
				return false;
			} else if(homepage.trim() === '' || homepage.length > 100) {
				alert('웹사이트 주소를 100자 이내로 작성해주세요.');
				return false;
			} else if(contract.trim() === '' || contract.length > 100) {
				alert('연락처를 100자 이내로 작성해주세요.');
				return false;
			} else if(password.trim() !== '') {
				if(!confirm('패스워드 입력값이 존재하여 해당 입주기업 계정의 로그인 패스워드가 변경됩니다. 계속 진행하시겠습니까?')) {
					return false
				}
			} else if(content.trim() === '') {
				alert('입주기업 소개를 작성해주세요.');
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
			$('textarea[name="introduce"]').val(CKEDITOR.instances.post_editor.getData());
			
			if(confirm('게시글을 수정하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/partner/information/edit" />/${SEQ_ID}',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					processData : false,
					contentType : false,
					data: new FormData(galleryForm),
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
							location.href = '<c:url value="/admin/partner/list" />';	
						} else {
							alert('입주기업 정보를 수정할 수 없습니다, 관리자에게 문의해주세요.');
						}
					},
					error : function(error) {
						alert('입주기업 정보를 수정할 수 없습니다, 관리자에게 문의해주세요.');
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
	</script>
	
	<!-- extension end -->
	

</body>
</html>