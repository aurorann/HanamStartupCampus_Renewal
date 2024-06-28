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
					<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
                   		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">입주기업 정보 관리</a>
                   		<a href="<c:url value='/admin/book/place' />" class="btn btn-default" role="button">회의실 예약 및 현황</a>
						<a href="<c:url value='/admin/partner/notice/list' />" class="btn btn-default" role="button">입주기업 공지사항</a>
						<a href="<c:url value='/admin/partner/notice/write/form' />" class="btn btn-default" role="button">입주기업 공지사항 글쓰기</a>	      
				    </div>
				    <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
				    	<a href="<c:url value='/admin/webpage/partner/management/edit/form' />" class="btn btn-default" role="button">기업 실적 수정</a>
						<a href="<c:url value='/admin/partner/media/write/form' />" class="btn btn-default" role="button">소개 영상 글쓰기</a>
						<a href="<c:url value='/admin/partner/activity/write/form' />" class="btn btn-default" role="button">기업 활동 글쓰기</a>
						<a href="<c:url value='/admin/user/community/list' />" class="btn btn-default" role="button">입주기업 커뮤니티</a>
				    </div>
				    <div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
						<a href="<c:url value='/admin/partner/file/list' />" class="btn btn-default" role="button">서식 자료실</a>
						<a href="<c:url value='/admin/partner/file/write/form' />" class="btn btn-default" role="button">서식 자료실 글쓰기</a>
				    </div>
 
                    <div class="col-lg-12" id="partner-list">
                        <!-- 회사 시작 -->
						<!-- 회사 끝 -->
                    </div>
                </div>
			</div><!-- right-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script >
		$(function() {
			$.ajax({
				type : 'GET',
				cache: false,
				url : "<c:url value='/admin/partner/information/post/list' />",
				success : function(res) {
					var commonPost = res.post;
					var commonArr = [];
					
					commonPost.every(function(el) {
						var urlString = (el.homepage.length > 25) ?
								el.homepage.slice(0, 22) + "..."
								: el.homepage;
								
						var businessString = (el.businessName.length > 18) ?
								el.businessName.slice(0, 16) + "..."
								: el.businessName;
						
						var commonHTML = '<div class="col-lg-4 col-md-4 col-sm-6 ent-box" style="font-size: 0.93em;"' + 
						//'style="cursor: pointer;" onclick="location.href=\'<c:url value='/admin/partner/edit/form' />/' + el.seqId + '\'"' +
						'>' +
							'<h3 class="b-title"><strong>계정명 : ' + el.accountId + '</strong></h3>' +
	                        '<table class="table">' +
	                        	'<thead style="opacity: 0; border: 0 none; height: 0;"><tr style="margin: 0; padding: 0; border: 0 none; height: 0px;"><th width="30%" style="margin: 0; padding: 0; border: 0 none; height: 0px;"></th><th width="70%" style="margin: 0; padding: 0; border: 0 none; height: 0px;"></th></tr></thead>'+
	                            '<tbody><tr><td colspan="2"><div class="ent-logo">' +
	                            '<div class="ent-logo-detail">' +
	                            '<img src="<c:url value='/upload/partner-represent' />/' + el.profileImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'" alt="기업 대표 이미지"></div></div></td></tr>';
						(el.activate === "PARTNER")
							? commonHTML += '<tr><th colspan="2" style="background: #edb234;">입주기업(공개)</th><tr>'
							: (el.activate === "GRADUATE")
								? commonHTML += '<tr><th colspan="2" style="background: #99cbff;">졸업기업(공개)</th><tr>'
								: commonHTML += '<tr><th colspan="2" style="background: darkgray;">공실(비공개)</th><tr>'; 
	                    commonHTML += '<tr><th>기업명</th>' +
			                        '<td>' + el.name + '</td></tr>' +
			                        '<tr><th>업종구분</th>' +
	                                '<td>' + businessString + '</td></tr>' +
			                        '<tr><th>대표자</th>' +
	                                '<td>' + el.ceoName + '</td></tr>' +
	                                '<tr><th>호수</th>' +
	                                '<td>' + el.roomName + '</td></tr>' +
	                                '<tr><th>웹사이트</th>' +
	                                '<td>' + urlString + '</td></tr>' +
	                                '<tr><th>연락처</th>' +
	                                '<td>' + el.contract + '</td></tr>' +
	                                '<tr><td colspan="2" style="padding: 0px;">' +
	                                '<button type="button" class="default-btn" style="width: 100%;height: 45px;" onclick="location.href=\'<c:url value='/admin/partner/edit/form' />/' + el.seqId + '\'"' + '>수정하기</button></td></tr>' +
	                            '</tbody></table></div>';
	                        
	                    commonArr.push(commonHTML);
		                return true;
					});
					
					$("div#partner-list").html(commonArr.join(""));

				},
				error : function(error) {
					alert('입주기업 목록을 불러오지 못했습니다, 관리자에게 문의해주세요.');
				}
			});
		})
	</script>
	
	<!-- extension end -->
	

</body>
</html>