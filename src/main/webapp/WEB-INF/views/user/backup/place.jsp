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
                	<div class="btn-group btn-group-justified" role="group" aria-label="Justified button group"  style="padding-bottom: 20px;">
                		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">회의실 예약 캘린더</a>
                   		<a href="<c:url value='/book/history' />" class="btn btn-default" role="button">회의실 예약현황</a>      
				    </div>
                
                    <div class="col-lg-5 mg-top-30">
                        <img src="<c:url value='/resources/img/room/book/corridor.jpg' />" style="max-width: 340px" alt="캠퍼스 내부 복도">
                    </div>

                    <div class="col-lg-7 mg-top-30">
                        <h3 class="b-title">입주기업을 위한 회의 장소 대관</h3>
                        <p class="b-text">하남 스타트업 캠퍼스 입주 기업을 위한 회의 장소 대관 서비스를 제공합니다.<br/>
                            신청하실 회의실과 시간을 선택해 장소를 대관하실 수 있습니다.<br/>
                            예약 현황을 확인해 보세요.</p>
                            <img src="<c:url value='/resources/img/sub/sub4-1.png' />">
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

                            <button type="button" class="btn-pink mg-top-30" onclick="location.href='<c:url value="/book/place/form/1" />' ">예약하기</button>

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

                            <button type="button" class="btn-pink mg-top-30" onclick="location.href='<c:url value="/book/place/form/2" />' ">예약하기</button>

                        </div>

                        <%-- <div class="col-lg-4 vartical-box pink-bar mg-top-60">
                            <div class="vartical-thumbnail">
                                <img src="<c:url value='/resources/img/room/room_meeting1.png' />">
                            </div>

                            <h3 class="b-title">회의실 3</h3>
                            
                            <ul>
                                <li>가로(m) x 세로(m)<span>3.110 x 4.200</span></li>
                                <li>면적(m²)<span>13,062</span></li>
                                <li>비고<span>6인석</span></li>
                            </ul>

                            <button type="button" class="btn-pink mg-top-30" onclick="location.href='<c:url value="/book/place/form/3" />' ">예약하기</button>

                        </div> --%>
                    </div>

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<!-- extension end -->
	

</body>
</html>