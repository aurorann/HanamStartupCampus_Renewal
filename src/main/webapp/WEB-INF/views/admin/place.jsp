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
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/sub/sub-pvt5.css' />">
	
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
                	<br/>

				    <!-- 
                	<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
                		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">회의실 예약 캘린더</a>
                   		<a href="<c:url value='/admin/book/history' />" class="btn btn-default" role="button">회의실 예약현황</a>      
				    </div>
				     -->
					
						<div class="pvt_wrap" style="border-bottom:none">
							<ul class="pvt_btns mgr_btns mgr_btns1" id="you-are-here">
							    <li><button class="active" onclick="location.href='javascript:void(0);' ">회의실 예약 캘린더</button></li>
							    <li><button onclick="location.href='<c:url value='/admin/book/history' />' ">회의실 예약현황</button></li>
							</ul>
						</div>
		                
		                <div class="content_wrap" style="border-bottom:none">
			                <div class="meeting2">
			                    <div>
			                        <div class="img_box"><img src="<c:url value='/resources/img/sub_img/회의실_img1.png' />" alt="회의실 1"></div>
			                        <div class="text_box">
			                            <h3>회의실 1</h3>
			                            <ul>
			                                <li><span>가로(m) x 세로(m)</span>6.420 x 4.200</li>
			                                <li><span>면적(m²)</span>26.963</li>
			                                <li><span>비고</span>8인석</li>
			                            </ul>
			                            <a href="<c:url value="/admin/book/place/form/1" />" class="metting_btn">예약하기</a>
			                        </div>
			                    </div>
			                    <div>
			                        <div class="img_box"><img src="<c:url value='/resources/img/sub_img/회의실_img2.png' />" alt="회의실 2(외부회의실)"></div>
			                        <div class="text_box">
			                            <h3>회의실 2 (외부회의실)</h3>
			                            <ul>
			                                <li><span>가로(m) x 세로(m)</span>8.500 x 8.700</li>
			                                <li><span>면적(m²)</span>73.949</li>
			                                <li><span>비고</span>이용시 운영사무실과 별도 협의 필요</li>
			                            </ul>
			                            <a href="<c:url value="/admin/book/place/form/2" />" class="metting_btn">예약하기</a>
			                        </div>
			                    </div>
			                </div><!--meeting2-->
		                </div>
		            </div><!--container_wrap-->
					
					
					
					
					
					


                </div><!-- r-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script src="<c:url value='/resources/js/booking.dev.js'/>?ver=1.2"></script>
	<!-- extension end -->
	
	<script>
	
		var insideMenu = '회의실 예약 및 현황';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");

	</script>
	

</body>
</html>