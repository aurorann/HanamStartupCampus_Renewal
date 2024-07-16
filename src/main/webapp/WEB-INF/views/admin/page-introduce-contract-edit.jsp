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
		                <ul class="mgr_btns mgr_btns1">
		                    <li><button onclick="location.href='<c:url value='/admin/webpage/introduce/profile/edit/form' />' ">캠퍼스 개요 수정</button></li>
		                    <li><button class="active" onclick="location.href='javascript:void(0);' ">조직도 수정</button></li>
		                </ul>
	                     
		                <div class="board_write_wrap">
		                    <div class="board_write_post board-contents">
								<input type="hidden" id="level" value="${LEVEL}"/>
								<textarea class="fomr-control" id="post_editor" name="content">${CONTENT}</textarea>
		                    </div>
		                </div>
     					
                        <div class="board_wrap_btn"><a href="#" onclick="editPost();">페이지 수정</a></div>

				</div><!-- r-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script  src="<c:url value='/resources/vendor/ckeditor/ckeditor.js' />"></script>
	<script >
		$.fn.datepicker.language['kor'] = {
			days: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			daysShort: ['일', '월', '화', '수', '목', '금', '토'],
			daysMin: ['일', '월', '화', '수', '목', '금', '토'],
			months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			today: '오늘',
			clear: '새로고침',
			dateFormat: 'yyyy-mm-dd',
			timeFormat: 'hh:ii AA',
			firstDay: 0
		};
	
		$(function() {	// DOM init
			// CKEditor init start
			CKEDITOR.replace('post_editor', {
				height: 450,
				filebrowserUploadUrl: '<c:url value="/admin/web-content/upload/image" />',
						
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
			
			$('[name="notice_level"][value="${LEVEL}"]').attr("checked", "true");
		})
		
		function editPost() {
			var noticeLevel = document.querySelector('#level').value;
			var content = CKEDITOR.instances.post_editor.getData();
			
			// Validation start
			if(content.trim() === '') {
				alert('페이지 내용을 작성해주세요.');
				return false;
			}
			// Validation end
			
			var data = {
				content: content,
				level: noticeLevel
			}
			
			if(confirm('페이지를 수정하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/webpage/introduce/contract/edit" />',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					data: data,
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
						} else {
							alert('수정 실패, 관리자에게 문의해주세요.');
						}
					},
					error : function(error) {
						alert('수정 실패, 관리자에게 문의해주세요.');
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