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
    <script>
    	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
    </script>
	<!-- # include: stylesheet start -->
	<%@ include file="./include/stylesheet.jsp"%>
	<!-- # include: stylesheet end -->
</head>

<style>
label{
	margin-top: 10px;
	font-size: 13px;
}
.text-primary{ 
	font-size: 20px;
}
</style>
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
					<form id="product_insert_form" method="POST" enctype="multipart/form-data" action="<c:url value='/popUp/updatePopUp?${_csrf.parameterName}=${_csrf.token}' />" onsubmit="return updatePopup(this);">
							<div class="row">
								<div class="col-lg-4">
									<input type="hidden">
									<div class="card">
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">팝업 정보</h6>
										</div>
										<div class="card-body">
											<div class="form-group">
											
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											
												<input type="hidden" name="prevDisplay" value="Y">
												
												<input type="hidden" name="num" value="${dto.num}">
												
												<label for="title">팝업명</label> 
												
												<input class="form-control mb-4" data-valid="title" type="text" id="title" name="title" required="required" value="${dto.title}"> 
												
												<label for="link">팝업 링크</label>
												
												<input type="text" name="link" id="link" class="form-control mb-4" value="${dto.link}">
												
												<label for="contents_width" style="display: block;">팝업 크기</label>
												
												<input type="number" name="contentsWidth" id="contents_width" min="100" class="form-control mb-4" max="1920" style="width: 30%;display: inline-block;" value="${dto.contentsWidth}" required="" placeholder="너비">
												
												,
												
												<input type="number" name="contentsHeight" id="contents_height" min="100" class="form-control mb-4" max="1080" style="width: 30%;display: inline-block;" value="${dto.contentsHeight}" required="" placeholder="높이">
												
												<input type="button" class="btn btn-primary" style="margin-left: 10px;" id="resize" value="적용">
												
												<label for="display_position_x" style="display: block;">팝업 위치</label>
												
												<input type="number" name="displayPositionX" id="display_position_x" min="0" max="1920" class="form-control mb-4" value="${dto.displayPositionX}" style="width: 30%;display: inline-block;" required="" placeholder="X좌표">
												
												,
												
												<input type="number" name="displayPositionY" id="display_position_y" min="0" max="1080" class="form-control mb-4" value="${dto.displayPositionY}" style="width: 30%;display: inline-block;" required="" placeholder="Y좌표">
				
												<label for="display_date" style="display: block;">표출 기한</label>
												
												<input type="text" name="displayDate" id="display_date" class="form-control mb-4" readonly="readonly" reuired="required" value="${dto.displayDate}"  style="cursor: pointer; background-color: white;">
				

												<div class="card" style="margin-top: 20px;">
													<div class="card-header py-3">
														<h6 class="m-0 font-weight-bold text-primary">표시 여부</h6>
													</div>
													<div class="card-body">
														<div class="form-check form-check-inline mr-4">
															<input type="radio" name="displayYn" id="display_y" value="Y" <c:if test="${dto.displayYn eq 'Y'}">checked="checked"</c:if> > <label class="form-check-label" for="display_y">표출</label>
														</div>
														<div class="form-check form-check-inline mr-4">
															<input type="radio" name="displayYn" id="display_n" value="N" <c:if test="${dto.displayYn eq 'N'}">checked="checked"</c:if> > <label class="form-check-label" for="display_n">감추기</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="row">
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header py-3">
													<h6 class="m-0 font-weight-bold text-primary" style="margin-bottom: 15px;">팝업 내용</h6>
												</div>
												<div class="card-body">
													<textarea name="contents" placeholder="팝업 내용" data-valid="spec" id="insert_popup_editor" style="width: 500px; height: 450px; display: none;" class="input-sm form-full" aria-required="true">${dto.contents}</textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mt-4">
									<button type="button" class="btn btn-danger float-left" id="cancel" style="margin-right: 10px;">수정 취소</button>
									
									<button type="button" class="btn btn-danger float-left" id="removePopup">팝업 삭제</button>
									
									<button type="submit" class="btn btn-primary float-right" style="float: right;">수정하기</button>
									<button type="button" class="btn btn-primary float-right" style="margin-right: 10px;float: right;" id="sample">미리 보기</button>
								</div>
							</div>
						</form>

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->

	<!-- extension end -->
	<script src="<c:url value='/resources/se2/js/HuskyEZCreator.js' />" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />
	<script src="<c:url value='/resources/js/bootstrap-datepicker.kr.js' />"></script>
	
	<script>
		$(function() {
			window.editorUpdateContents = [];

			window.editorInsertContents = [];
			
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : editorInsertContents,
				elPlaceHolder : "insert_popup_editor",
				sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2",
				htParams : {
					fOnBeforeUnload : function() {
					}
				}
			});
			
			$('#display_date').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '-0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+60d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "kr"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
			    
			});//datepicker end
			
			$('#resize').on('click',function(){
				
				editorInsertContents.getById["insert_popup_editor"].exec("UPDATE_CONTENTS_FIELD", []);
				
				//var prevContent = 
				
				//alert(prevContent);
				
				$('iframe').remove();
				
				var contents_width = $('#contents_width').val();
				
				var contents_height = $('#contents_height').val();
				
				$('#insert_popup_editor').css('width',contents_width);
				$('#insert_popup_editor').css('height',contents_height);
				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : editorInsertContents,
					elPlaceHolder : "insert_popup_editor",
					sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
					fCreator : "createSEditor2",
					htParams : {
						fOnBeforeUnload : function() {
						}
					}
				});
				
				$('iframe').attr("scrolling", "yes");
			})
			
			function rtnDomainName(url){
				 url = url.split('//');
				 url = url[1].substr(0,url[1].indexOf('/'));

				 return url;
			}
			
			$('#sample').on('click',function(){
				//var popUrl = "http://hosting.apeak.co.kr/apeak_vinostech/admin/sample.html"	//팝업창에 출력될 페이지 URL
				
				var popWidth = $('#contents_width').val();
				var popHeight = $('#contents_height').val();
				var left = $('#display_position_x').val();
				var top = $('#display_position_y').val();
				
				if(top<0 || left<0){
					alert('유효하지 않은 위치입니다.');
					return;
				}
				
				if(popWidth<100 || popHeight<100){
					alert('유효하지 않은 크기입니다.')
					return;
				}
					
				var popOption = "width="+popWidth+", height="+popHeight+", left="+left+" , top="+top+", resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

				openWin = window.open("","popupSample",popOption);
				
				editorInsertContents.getById["insert_popup_editor"].exec("UPDATE_CONTENTS_FIELD", []);
				
				openWin.document.getElementsByTagName("body")[0].style.overflow = "hidden";
				
				openWin.document.getElementsByTagName("body")[0].innerHTML = document.getElementById("insert_popup_editor").value +
				'<div id="div_laypopup" style="text-align: right;background-color: black;color: white;height: 30px;font-size: 13px;position: absolute;width: 100%;bottom: 0px;left: 0px;">'
				+ '<a style="color: white;float: left;margin-left: 10px; margin-top:5px;" href="javascript:window.close()" >[바로가기]</a>'
				+ '<div style="margin-top: 5px;margin-right: 10px;"><input type="checkbox" name="close" value="OK" onclick="javascript:window.close();"><span>하루동안 이 창을 열지 않음  </span>'
				+ '<a style="color: white; margin-left: 10px;margin-top: 5px;" href="javascript:void(0);" onclick="javascript:window.close();">[닫기]</a></div>'
				+ '</div></div>';
				
				openWin.document.getElementsByTagName("head")[0].innerHTML = "<title>"+$('#title').val()+"</title><style>img{max-width:100%}body{margin:0px !important}</style>"
								
				var imgCnt = $(openWin.document).find('img').length;

				var url = location.href;
				url = rtnDomainName(url);

				
				for(var i=0;i<imgCnt;i++){
					$(openWin.document).find('img:eq('+i+')').attr('src', window.location.protocol + "//"+url+$(openWin.document).find('img:eq('+i+')').attr('src'));
				}
			})
			
			
			updatePopup = function(form) {		
				
				
	            if(confirm("팝업을 수정하시겠습니까?")) {
	            	editorInsertContents.getById["insert_popup_editor"].exec("UPDATE_CONTENTS_FIELD", []);
	                return true;
	            } else {
	                return false;
	            }
        	}
			
			$('#cancel').on('click',function(){
				if(confirm("수정을 취소하고 목록으로 돌아갈까요?")) {
					location.href = "${pageContext.request.contextPath}/popUp/popUpList";
				} else {
					return;
				}
			})
			
			$('#removePopup').on('click',function(){
				if(confirm("정말 해당 팝업을 삭제할까요?")) {
					location.href = "${pageContext.request.contextPath}/popUp/deletePopUp?num=${dto.num}";
				} else {
					return;
				}
			})
			
			setTimeout(function() {$("#resize").click();}, 1500)
		})
		
	</script>

</body>
</html>