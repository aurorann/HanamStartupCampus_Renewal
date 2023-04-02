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
                        <div class="vartical-thumbnail">
                            <img src="<c:url value='/resources/img/room/room_meeting2.png'/>">
                        </div>
                    </div>

                    <div class="col-lg-7 mg-top-30">
                        <h3 class="b-title"><strong>회의실 3 예약하기</strong></h3>
                        <div class="b-text">
                            <ul>
                                <li>
                                    <span><strong>가로(m) x 세로(m)</strong></span>
                                    <span>3.110 x 4.200</span>
                                </li>
                                <li>
                                    <span><strong>면적(m²)</strong></span>
                                    <span>13,062</span>
                                </li>
                                <li>
                                    <span><strong>비고</strong></span>
                                    <span>6인석</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-12 mg-top-60">

                        <div class="col-lg-7" style="padding:0;">
                            <h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png'/>">&nbsp;&nbsp;대관 날짜 선택</h3>

                            <div class="carendar-title">
                                <div class="c-title-box">
                                    <button class="calendar-previous-month" type="button"><img src="<c:url value='/resources/img/sub/arrow-c-left.png'/>"></button>
                                    <h3 class="d-title calendar-current-month-container">2021년 1월</h3>
                                    <button class="calendar-next-month" type="button"><img src="<c:url value='/resources/img/sub/arrow-c-right.png'/>"></button>
                                </div>

                                <ul>
                                    <li>
                                        <span class="blue-label"></span>&nbsp; 예약 가능
                                    </li><li>
                                        <span class="gray-label"></span>&nbsp; 예약 불가
                                    </li>
                                </ul>
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

                        <div class="col-lg-5 time-select" style="">
                            <h3 class="m-title"><img src="<c:url value='/resources/img/sub-title.png'/>">&nbsp;&nbsp;대관 시간 선택</h3>

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
                                <tbody>
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
                                <thead>
                                    <tr>
                                        <th>
                                            시설 사용 용도 <small style="float:right; color:#999999;"></small>
                                            <textarea id="description" placeholder="*시설 사용 용도를 간략히 적어주세요." maxlength="200"></textarea>
                                        </th>
                                    </tr>
                                </thead>
                            </table>

                        </div><!--col-lg-5 div 끝-->
                    	
                    	<div class="col-lg-12 mg-top-30 book-list-wrapper" style="width:100%;">
	                        <h3 class="book-list-title"><strong>사용 일정</strong></h3>
	                        <div class="book-list-text">
	                            <ul class="book-list-text-head">
	                                <li>
										<span class="time"><strong>예약 시간</strong></span>
	                                    <span class="name"><strong>시설 사용자</strong></span>
										<span class="description"><strong>시설 사용 용도</strong></span>
	                                </li>
	                            </ul>
	                            <ul class="book-list-text-body">
	                                <!-- <li>
										<span class="time">09:00 ~ 18:00</span>
	                                    <span class="name">일반 사용자</span>
										<span class="description">내부 회의</span>
	                                </li> -->
	                            </ul>
	                        </div>
	                    </div>

                        <div class="col-lg-12 mg-top-30 reservation-all">
                            <h3 class="b-title"><strong>
                                <span>선택된 예약 시간 없음.</span>
                            </strong></h3>
                        </div>

                        <div class="reservation-btn">
                            <ul>
                                <li><a href="<c:url value="/book/place" />" class="gray-btn">뒤로</a></li>
                                <li><a href="javascript:openModal('reservation-modal');" class="default-btn">예약하기</a></li>
                            </ul>
        					
                        </div>
                          
                        <div id="r-modal"></div>
                        <div class="modal-con reservation-modal">
                            <a href="javascript:;" class="close"><img src="<c:url value='/resources/img/close-btn.png'/>"></a>
                            <div class="modal-title">
                                <h3><img src="<c:url value='/resources/img/sub-title.png'/>">&nbsp;&nbsp;시설/공간 예약 확인</h3>
                            </div>
                            <div class="con">
                                <p>장소, 날짜, 시간을 확인해 주세요. 해당 시설을 예약하시겠습니까?</p>
                                <div class="reservation-all mg-top-30">
                                    <h3 class="b-title"><strong>
                                        <span>선택된 예약 시간 없음.</span>
                                    </strong></h3>
                                </div>
                                <div class="reservation-btn">
                                    <ul>
                                        <li><a href="#" class="gray-btn">취소</a></li>
                                        <li><a id="bookSubmit" href="javascript:void(0);" class="default-btn">예약하기</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                     </div><!--col-lg-12 div 끝-->
                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script src="<c:url value='/resources/js/booking.js'/>?ver=1.2"></script>
	<!-- extension end -->
	

</body>
</html>