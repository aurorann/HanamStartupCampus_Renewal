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
                    	<!-- 
						<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
					      <a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">공지사항 글쓰기</a>
					      <a href="<c:url value='/admin/announce/announcement/write/form' />" class="btn btn-default" role="button">사업공고 글쓰기</a>
					      <a href="<c:url value='/admin/announce/press/write/form' />" class="btn btn-default" role="button">보도자료 글쓰기</a>
					      <a href="<c:url value='/admin/announce/faq/write/form' />" class="btn btn-default" role="button">자주 묻는 질문 글쓰기</a>
					    </div>
					     -->
		                <ul class="mgr_btns mgr_btns2">
		                    <li><button onclick="location.href='<c:url value='/admin/announce/notice/write/form' />'">공지사항 글쓰기</button></li>
		                    <li><button class="active" onclick="location.href='javascript:void(0);'">사업공고 글쓰기</button></li>
		                    <li><button onclick="location.href='<c:url value='/admin/announce/press/write/form' />' ">보도자료 글쓰기</button></li>
		                    <li><button onclick="location.href='<c:url value='/admin/announce/faq/write/form' />' ">자주 묻는 질문 글쓰기</button></li>
		                </ul>
		                
		                <div class="board_write_wrap">
		                    <div class="board_write_title">
		                        <div class="labelWrap">
		                            <input type="radio" id="Ggongo" name="notice_level" value="101" checked="checked">
		                            <label for="Ggongo" class="board_label board_label_Ggongo">주요공고</label>
		                            <input type="radio" id="gongo" name="notice_level" value="103">
		                            <label for="gongo" class="board_label board_label_gongo">공고</label>
		                        </div>
		                        <div class="titleWrap">
		                            <label for="title">제목</label>
		                            <input type="text" id="post_title">
		                        </div>
								<div class="fileWrap">
									<form id="fileForm" method="post" enctype="multipart/form-data">
										<label for="startEnd">게시일 / 종료일</label>
										<input type="text" class="board-input datepicker-here" id="post_date_string" autocomplete="off" data-range="true"
												data-multiple-dates-separator=" ~ " data-format='yyyy-mm-dd' data-language="kor" class="datepicker-here" />
			                            <div class="not_box"></div>
										<label for="file">파일찾기</label>
										<input type="file" name="file" id="file" multiple="multiple" style="display: inline-block;"/>
									</form>
								</div>
		                    </div>
		                            

		                    <div class="board_write_post board-contents">
								<textarea class="fomr-control" id="post_editor" name="content">${CONTENT}</textarea>
		                    </div>
		                </div>
		                <!-- 
                        <table class="table board-table">
                            <thead>
                                <tr>
                                    <td>
                                        <div class="board-title">
                                            <div class="bd-example">			
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="notice_level" id="noticeLevel100" value="100" checked="checked">
												  <label class="pink-label" for="noticeLevel0">주요공지</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="notice_level" id="noticeLevel101" value="101">
												  <label class="yellow-label" for="noticeLevel1">주요공고</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="notice_level" id="noticeLevel102" value="102">
												  <label class="white-label" for="noticeLevel2">공지</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="notice_level" id="noticeLevel103" value="103">
												  <label class="white-label" for="noticeLevel3">공고</label>
												</div>
											</div>
											
											<div class="title-label">
                                                <h5>제목</h5>
                                                <input type="text" class="board-input" id="post_title">
                                            </div>
											
											<form id="fileForm" method="post" enctype="multipart/form-data">
                                            <div class="start-end-label">
                                                <h5>게시일 / 종료일
                                                <input type="text" class="board-input datepicker-here" id="post_date_string" autocomplete="off" data-range="true"
													data-multiple-dates-separator=" ~ " data-format='yyyy-mm-dd'
													data-language="kor"
													class="datepicker-here" />
													
												첨부 파일 : 
                                                 
                                                	<input type="file" name="file" id="file" multiple="multiple" style="display: inline-block;"/>
                                                
                                                </h5>
                                                 -->
                                                <!-- <h5>종료일 <input type='text' class="form-control" id='to' name="to" autocomplete="off" /></h5> -->
                                                <!-- 
                                            </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="board-contents">
                                        <textarea class="fomr-control" id="post_editor" name="content"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                         -->
    
                        <!-- <button type="button" class="search-btn mg-top-30" onClick="location.href='sub2-1.html'">목록</button>
                        <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group" style="margin-top: 30px;">
						      <div class="btn-group" role="group">
						        <button type="button" class="btn btn-default" onclick="writeNewPost()">게시글 작성</button>
						      </div>
							
						    </div>
						 -->
                        <div class="board_wrap_btn"><a href="#" onclick="writeNewPost();">게시글 작성</a></div>
    
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
			$("#post_date_string").val(moment().format("yyyy-MM-DD") + " ~ " + moment().format("yyyy-MM-DD"))
			
			// CKEditor init start
			CKEDITOR.replace('post_editor', {
				height: 450,
				filebrowserUploadUrl: '<c:url value="/admin/announcement/upload/image" />',
						
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
			var dateStrArr = document.querySelector('#post_date_string').value.split(" ~ ");
			var noticeLevel = document.querySelector('[name="notice_level"]:checked').value;
			
			// Validation start
			if(title.trim() === '' || title.length > 50) {
				alert('게시글 제목을 50자 이내로 작성해주세요.');
				return false;
			} else if(content.trim() === '') {
				alert('게시글 내용을 작성해주세요.');
				return false;
			} else if(typeof noticeLevel === "undefined" ||noticeLevel === '') {
				alert('게시글 타입을 정해주세요.');
				return false;
			} else if(dateStrArr.length < 2) {
				alert('등록일 및 종료일을 선택해주세요.');
				return false;
			} else if(moment(dateStrArr[0]) > moment(dateStrArr[1])) {
				alert('종료일은 등록일 이전으로 선택할 수 없습니다.');
				return false;
			}
			// Validation end
			
			var fileName = '';
			var filePath = '';
			
			if($('#file').val()){
				var formData = new FormData($('#fileForm')[0]); 
				
				$.ajax({
					type: "POST", 
					enctype: 'multipart/form-data', // 필수 
					url: '<c:url value="/admin/announcement/upload/file" />', 
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
				level: noticeLevel,
				contractStartAt: dateStrArr[0],
				contractEndAt: dateStrArr[1],
				fileName: fileName,
				filePath: filePath
			}
			
			if(confirm('게시글을 작성하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					cache: false,
					url : '<c:url value="/admin/announce/announcement/post/write" />',
					headers : {
						'${_csrf.headerName}' : '${_csrf.token}'
					},
					data: data,
					success : function(result) {
						if(result.count > 0) {
							alert(result.message);
							location.href = '<c:url value="/announce/announcement/list" />';	
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
	</script>
	
	<!-- extension end -->
	

</body>
</html>