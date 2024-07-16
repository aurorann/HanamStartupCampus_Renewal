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
            <div class="right-contents col-lg-9">
                <!-- # include: title-box start -->
                <%@ include file="./include/title-box.jsp"%>
                <!-- # include: title-box end -->

               <div class="container_wrap">
					<div class="pvt_wrap">
						<ul class="pvt_btns mgr_btns mgr_btns1" id="you-are-here">
						    <li><button class="active" onclick="location.href='javascript:void(0);' ">회의실 예약 캘린더</button></li>
						    <li><button onclick="location.href='<c:url value='/book/history' />' ">회의실 예약현황</button></li>
						</ul>
					</div>
					
                	
               		<!-- 
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
                     -->
	                <div class="meeting1">
	                    <div class="left_content">
	                        <img src="<c:url value='/resources/img/sub_img/회의실_img.png' />" alt="회의장소 대관">
	                    </div>
	                    <div class="right_content">
	                        <h3>입주기업을 위한 회의장소 대관</h3>
	                        <p>
	                            하남 스타트업 캠퍼스 입주 기업을 위한 회의 장소 대관 서비스를 제공합니다.<br>
	                            신청하실 회의실과 시간을 선택해 장소를 대관하실 수 있습니다.<br>
	                            예약 현황을 확인해 보세요.
	                        </p>
	                        <img src="<c:url value='/resources/img/sub_img/회의실.png' />" alt="회의실 예약 방법">
	                    </div>
	                </div><!--meeting1-->
	                
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
	                            <a href="<c:url value="/book/place/form/1" />" class="metting_btn">예약하기</a>
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
	                            <a href="<c:url value="/book/place/form/2" />" class="metting_btn">예약하기</a>
	                        </div>
	                    </div>
	                </div><!--meeting2-->
	                
                    
                    
                    
					<!-- 
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
                    </div>
                    -->

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<!-- extension end -->
	

</body>
</html>