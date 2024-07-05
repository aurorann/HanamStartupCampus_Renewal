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
    
			<div class="col-lg-12 r-contents">
				<div class="ent-title mg-top-30">
					<h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png' />" alt="소제목 아이콘">&nbsp;&nbsp;입주기업 소개</h3>
					<p>하남 스타트업 캠퍼스의 입주 기업을 소개합니다.</p>
				</div>

				<div class="col-lg-12" id="partner-list">
					<!-- 회사 시작 -->
					<!-- 회사 끝 -->
				</div>
			</div>
		</main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function() {
			$.ajax({
				type : 'GET',
				cache: false,
				url : "<c:url value='/partner/information/post/list' />",
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
						
						var commonHTML = '<div class="col-lg-4 col-md-4 col-sm-6 ent-box"' + 
						'style="cursor: pointer; font-size: 0.93em;" onclick="location.href=\'<c:url value='/partner/view' />/' + el.seqId + '\'"' +
						'>' +
	                        '<table class="table">' +
	                        	'<thead style="opacity: 0; border: 0 none; height: 0;"><tr style="margin: 0; padding: 0; border: 0 none; height: 0px;"><th width="30%" style="margin: 0; padding: 0; border: 0 none; height: 0px;"></th><th width="70%" style="margin: 0; padding: 0; border: 0 none; height: 0px;"></th></tr></thead>'+
	                            '<tbody><tr><td colspan="2"><div class="ent-logo">' +
	                            '<div class="ent-logo-detail">' +
	                            '<img src="<c:url value='/upload/partner-represent' />/' + el.profileImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'" alt="기업 대표 이미지"></div></div></td></tr>';
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