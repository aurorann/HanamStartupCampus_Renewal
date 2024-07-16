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
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plugin/bootstrap.min.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/bootstrap.min.js' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/sub.js' />">
	
</head>


<body class="animsition restyle-index">
	
	
	<!-- # common: header-menu start -->
    <%@ include file="/WEB-INF/header-menu.jsp"%>
    <!-- # common: header-menu end -->   
	
	<div class="modal_dummy"></div><!--modal_dummy 검색뒷배경-->
	
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

					<div class="pvt_wrap">
						<ul class="pvt_btns mgr_btns mgr_btns1" id="you-are-here">
						    <li><button class="active" onclick="location.href='<c:url value='/admin/book/place' />' ">회의실 예약 캘린더</button></li>
						    <li><button onclick="location.href='<c:url value='/admin/book/history' />' ">회의실 예약현황</button></li>
						</ul>
					</div>
                	
	                <div class="meeting3">
	                    <div class="img_box"><img src="<c:url value='/resources/img/sub_img/회의실_img2.png' />" alt="회의실 2"></div>
	                    <div class="text_box">
	                        <h3>회의실 2</h3>
	                        <ul>
	                            <li><span>가로(m) x 세로(m)</span>8.500 x 8.700</li>
	                            <li><span>면적(m²)</span>73.949</li>
	                            <li><span>비고</span>이용 시, 운영사무실과 별도 협의 필요</li>
	                        </ul>
	                    </div>
	                </div><!--meeting3-->

                    <div class="calender_wrap">
                        <div>
                            <h3>대관 날짜 선택</h3>
	                        <div class="" style="padding:0;">
                            	<div class="carendar-title">
	                                <div class="c-title-box">
	                                    <button class="calendar-previous-month" type="button"><img src="<c:url value='/resources/img/sub_img/arrow-c-right.png'/>"></button>
	                                    <h3 class="d-title calendar-current-month-container">2021년 1월</h3>
	                                    <button class="calendar-next-month" type="button"><img src="<c:url value='/resources/img/sub_img/arrow-c-right.png'/>"></button>
	                                </div>
	                                <ul>
	                                    <li>
	                                        <span class="blue-label"></span>&nbsp; 예약 가능
	                                    </li><li>
	                                        <span class="gray-label"></span>&nbsp; 예약 불가
	                                    </li>
	                                </ul>
								</div>
                            </div>

                            <table class="table reservation-table calendar-contents calendar-days">
                                <thead>
                                    <tr>
                                        <th style="color:#ed5f5f">일</th>
                                        <th>월</th>
                                        <th>화</th>
                                        <th>수</th>
                                        <th>목</th>
                                        <th>금</th>
                                        <th style="color:#264e9c">토</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div> <!--col-lg-7 div 끝-->

                        <div>
                            <h3>대관 시간 선택</h3>
	                        <div class="col-lg-5 time-select" style="">

	                            <div class="carendar-title">
	                                <div>
	                                    <h3 class="d-title">시간대 선택</h3>
	                                </div>
	
	                                <ul style="width:100%;">
	                                    <li style="width:100%;">
	                                        * 일일 최대 ${maxDailyCnt}시간 예약 가능.
	                                    </li>
	                                </ul>
	                            </div>

                            <table class="table reservation-table time-contents">
                                <thead>
                                    <tr>
                                        <th>시간 선택</th>
                                    </tr>
                                </thead>
                                <tbody class="time">
                                    <tr class="booked" data-start-time="09:00" data-end-time="10:00"  data-time-index=0 data-time-col-name="H09">
									    <td>09:00 ~ 10:00</td>
									</tr>
									<tr class="booked" data-start-time="10:00" data-end-time="11:00" data-time-index=1 data-time-col-name="H10">
									    <td>10:00 ~ 11:00</td>
									</tr>
									<tr class="booked" data-start-time="11:00" data-end-time="12:00" data-time-index=2 data-time-col-name="H11">
									    <td>11:00 ~ 12:00</td>
									</tr>
									<tr class="booked" data-start-time="12:00" data-end-time="13:00" data-time-index=3 data-time-col-name="H12">
									    <td>12:00 ~ 13:00</td>
									</tr>
									<tr class="booked" data-start-time="13:00" data-end-time="14:00" data-time-index=4 data-time-col-name="H13">
									    <td>13:00 ~ 14:00</td>
									</tr>
									<tr class="booked" data-start-time="14:00" data-end-time="15:00" data-time-index=5 data-time-col-name="H14">
									    <td>14:00 ~ 15:00</td>
									</tr>
									<tr class="booked" data-start-time="15:00" data-end-time="16:00" data-time-index=6 data-time-col-name="H15">
									    <td>15:00 ~ 16:00</td>
									</tr>
									<tr class="booked" data-start-time="16:00" data-end-time="17:00" data-time-index=7 data-time-col-name="H16">
									    <td>16:00 ~ 17:00</td>
									</tr>
									<tr class="booked" data-start-time="17:00" data-end-time="18:00" data-time-index=8 data-time-col-name="H17">
									    <td>17:00 ~ 18:00</td>
									</tr>
									<!-- <tr class="booked" data-time-string="18:00" data-time-index=9 data-time-col-name="H18">
									    <td>18:00</td>
									</tr> -->
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th>
                                            시설 사용 용도 <small style="float:right; color:#999999;"></small>
                                            <textarea id="description" placeholder="*시설 사용 용도를 간략히 적어주세요." maxlength="200"></textarea>
                                        </th>
                                    </tr>
                                </thead>
                            </table>

							</div><!--col-lg-5 div 끝-->
                        </div>
                     </div><!--calender_wrap-->
                     
                     
                   	<div class="check_wrap book-list-wrapper">
                        <h3 class="book-list-title check_title"><strong>사용 일정</strong></h3>
                            <ul class="book-list-text-body">
                                <li>
									<span class="time"style="width:15%">예약 시간</span>
                                    <span class="name"style="width:15%">시설 사용자</span>
									<span class="description"style="width:50%">시설 사용 용도</span>
									<span class="delete"style="width:19%"></span>
                                </li>
                            </ul>
                            <!-- 
                            <ul class="book-list-text-body">
                                <li>
									<span class="time">09:00 ~ 18:00</span>
                                    <span class="name">일반 사용자</span>
									<span class="description">내부 회의</span>
                                </li>
                            </ul>
                             -->
	                        <div class="col-lg-12 mg-top-30 reservation-all check_article">
								<!-- 선택된 예약 시간 없음 -->
	                        </div>
	
	                        <div class="reservation-btn check_btns">
	                        	<a href="<c:url value='/book/place' />">뒤로</a>
	                            <a href="javascript:openModal('metting_modal');" class="metting_btn">예약하기</a>
	                        </div>
                    </div>
                    
				    <div class="metting_modal">
				        <div class="top_metting_modal">
				            <h3>시설/공간 예약 확인</h3>
				            <button class=><img src="<c:url value='/resources/img/back_ico.png'/>" alt="뒤로가기"></button>            
				        </div>
				        <div class="btm_metting_modal">
				            <p>장소, 날짜, 시간을 확인해 주세요. 해당 시설을 예약하시겠습니까?</p>
				            <div class="reservation-all check_article">
					            	회의실 1 / 2024년 6월 28일 / 13:00 ~ 14:00

				            </div>
				            <div class="check_btns">
				                <a href="" class="gray-btn">취소</a>
				                <a id="bookSubmit" href="javascript:void(0);" class="metting_btn">예약하기</a>
				            </div>
				        </div>
				    </div><!--metting_modal-->
                </div><!-- r-contents div 끝 -->
        </main>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script src="<c:url value='/resources/js/booking.js'/>?ver=1.2"></script>
	<script src="<c:url value='/resources/js/sub.js'/>"></script>
	<!-- extension end -->
	
	<script>
	
		var insideMenu = '회의실 예약 및 현황';
		
		$("ul#you-are-here li button[data-location-insub= '" + insideMenu + "'").addClass("active");

	</script>
	

</body>
</html>