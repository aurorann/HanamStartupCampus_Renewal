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
                <p>하남스타트업캠퍼스의 졸업기업을 소개합니다.</p>

                <div class="content_wrap">
                    <div class="ent_introduce_list" id="partner-list">
                    <!-- 
                        <div class="ent_introduce_wrap">
                            <a href="#">
                                <div class="img_box"><img src="img/sub_img/(주)스카이런_logo.png" alt="(주)스카이런"></div>
                                <div class="text_box">
                                    <h3>(주)스카이런</h3>
                                    <ul>
                                        <li><span>대표자</span>장욱</li>
                                        <li><span>업종구분</span>태양광 발전소드론 열화상 촬...</li>
                                        <li><span>호수</span>입주실 1호</li>
                                        <li><span>웹사이트</span>-</li>
                                        <li><span>연락처</span>-</li>
                                    </ul>
                                </div>
                            </a>
                        </div>
                        <div class="ent_introduce_wrap">
                            <a href="#">
                                <div class="img_box"></div>
                                <div class="text_box">
                                    <h3>날리</h3>
                                    <ul>
                                        <li><span>대표자</span>강병준</li>
                                        <li><span>업종구분</span>긱워커(프리랜서)들을 위한 음...</li>
                                        <li><span>호수</span>입주실 2호</li>
                                        <li><span>웹사이트</span>-</li>
                                        <li><span>연락처</span>-</li>
                                    </ul>
                                </div>
                            </a>
                        </div>
                        <div class="ent_introduce_wrap">
                            <a href="#">
                                <div class="img_box"><img src="img/sub_img/(주)고릴라금고_logo.png" alt="(주)고릴라금고"></div>
                                <div class="text_box">
                                    <h3>(주)고릴라금고</h3>
                                    <ul>
                                        <li><span>대표자</span>이진우</li>
                                        <li><span>업종구분</span>향정신성 의약품 전용 스마트 금고</li>
                                        <li><span>호수</span>입주실 3호</li>
                                        <li><span>웹사이트</span>-</li>
                                        <li><span>연락처</span>-</li>
                                    </ul>
                                </div>
                            </a>
                        </div>
                         -->
                    </div><!--ent_introduce_list-->
                </div><!--content_wrap-->
            </div><!--container_wrap-->
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
				url : "<c:url value='/partner/graduate/information/post/list' />",
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
						
						var commonHTML = 
							'<div class="ent_introduce_wrap">' +
	                            '<a href="<c:url value='/partner/view' />/' + el.seqId + '">' +
	                                '<div class="img_box">' +
	                            		'<img src="<c:url value='/upload/partner-represent' />/' + el.profileImage + '" onerror="this.src=\'<c:url value='/resources/img/default.png' />\'" alt="기업 대표 이미지">' +
	                            	'</div>' +
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