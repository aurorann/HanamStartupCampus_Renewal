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
                   		<a href="<c:url value='/admin/partner/list' />" class="btn btn-default" role="button">입주기업 정보 관리</a>
                   		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">회의실 예약 및 현황</a>
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
				    
				    
                	<br/>
                	<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
                		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">회의실 예약 캘린더</a>
                   		<a href="<c:url value='/admin/book/history' />" class="btn btn-default" role="button">회의실 예약현황</a>      
				    </div>

                    <div class="col-lg-12" style="margin:0; padding:0;">

                        <div class="col-lg-5 vartical-box pink-bar mg-top-60">
                            <div class="vartical-thumbnail">
                                <img src="<c:url value='/resources/img/room/book/meeting01.jpg' />" style="max-width: 100%" alt="회의실 1">
                            </div>

                            <h3 class="b-title">회의실 1</h3>
                            
                            <ul>
                                <li>가로(m) x 세로(m)<span>6.420 x 4.200</span></li>
                                <li>면적(m²)<span>26.963</span></li>
                                <li>비고<span>8인석</span></li>
                            </ul>

                            <button type="button" class="btn-pink mg-top-30" onclick="location.href='<c:url value="/admin/book/place/form/1" />' ">예약하기</button>

                        </div>


                        <div class="col-lg-5 vartical-box pink-bar mg-top-60">
                            <div class="vartical-thumbnail">
                                <img src="<c:url value='/resources/img/room/book/meeting02.jpg' />" style="max-width: 100%" alt="회의실 2">
                            </div>

                            <h3 class="b-title">회의실 2 (외부회의실)</h3>
                            
                            <ul>
                                <li>가로(m) x 세로(m)<span>8.500 x 8.700</span></li>
                                <li>면적(m²)<span>73.949</span></li>
                                <li>비고<span>이용 시 운영사무실과 별도 협의 필요</span></li>
                            </ul>

                            <button type="button" class="btn-pink mg-top-30" onclick="location.href='<c:url value="/admin/book/place/form/2" />' ">예약하기</button>

                        </div>
						
                    </div>

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script src="<c:url value='/resources/js/booking.dev.js'/>?ver=1.2"></script>
	<!-- extension end -->
	

</body>
</html>