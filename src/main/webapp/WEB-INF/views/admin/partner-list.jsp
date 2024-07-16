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
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub-ent.css' />">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/mgr.css' />">

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
				<div class="content_wrap">
					<div class="ent_introduce_list" id="partner-list">
					    <!-- 회사 시작 -->
						<!-- 회사 끝 -->
				    </div>
			    </div>
			</div>
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script >
		$(function() {
			
			var insideMenu = '입주기업 정보 관리';
			
			$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");
			
			$.ajax({
				type : 'GET',
				cache: false,
				url : "<c:url value='/admin/partner/information/post/list' />",
				success : function(res) {
					var commonPost = res.post;
					var commonArr = [];
					
					commonPost.every(function(el) {
						var urlString = (el.homepage.length > 18) ?
								el.homepage.slice(0, 18) + "..."
								: el.homepage;
								
						var businessString = (el.businessName.length > 12) ?
								el.businessName.slice(0, 12) + "..."
								: el.businessName;
						
						var commonHTML = 
										'<div class="ent_introduce_wrap">' +
				                            '<strong>계정명 : ' + el.accountId + '</strong>' +
				                            '<a href="<c:url value='/admin/partner/edit/form' />/' + el.seqId + '\">' +
				                                '<div class="img_box"><img src="<c:url value='/upload/partner-represent' />/' + el.profileImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'" alt="기업 대표 이미지" style="width:100px;"></div>';
		
				                                (el.activate === "PARTNER")
				    							? commonHTML += '<div class="in_open">입주기업(공개)</div>'
				    							: (el.activate === "GRADUATE")
				    								? commonHTML += '<div class="out_open">졸업기업(공개)</div>'
				    								: commonHTML += '<div class="room_nopen">졸업기업(비공개)</div>'; 
				    								
				    		commonHTML += 
				                                '<div class="text_box">' +
				                                    '<h3>' + el.name + '</h3>' +
				                                    '<ul>' +
				                                        '<li><span>대표자</span>' + el.ceoName + '</li>' +
				                                        '<li><span>업종구분</span>' + businessString + '</li>' +
				                                        '<li><span>호수</span>' + el.roomName + '</li>' +
				                                        '<li><span>웹사이트</span>' + urlString + '</li>' +
				                                        '<li><span>연락처</span>' + el.contract + '</li>' +
				                                    '</ul>' +
				                                '</div>' +
				                            '</a>' +
				                            '<button onclick="location.href=\'<c:url value='/admin/partner/edit/form' />/' + el.seqId + '\'"' + '>수정하기</button>' +
				                        '</div>';
	                            
	                            
	                            
	                            
	                            
	                            
	                        
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