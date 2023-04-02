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

<!-- Extention Start -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/datepicker/css/datepicker.min.css' />">
	<script src="<c:url value='/resources/vendor/datepicker/js/datepicker.min.js' />"></script>
<!-- Extention End -->


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
                		<a href="<c:url value='/book/place' />" class="btn btn-default" role="button">회의실 예약 캘린더</a>
                   		<a href="javascript:void(0);" class="btn btn-default you-are-here" role="button">회의실 예약현황</a>      
				    </div>
                
                    <div class="sm-main-box pink-bar flex-end">
                        <div>
                            <select id="placeId">                                
                                <option value="1">회의실 1</option>
                                <option value="2">회의실 2</option>
                            </select>

                            <input type="text" class="datepicker-here" id="dateString"
                            	data-min-view="months" data-view="months"
								autocomplete="on" data-format='yyyy-mm' data-language="kor"/>
								
                            <button type="button" class="search-btn" onclick="getBookListMonthly();">검색</button>
                        </div>
        
                    </div>

                    <table class="table col-lg-12 mg-top-30">
                        <thead>
                            <tr>
                                <th width="10%">시설명</th>
                                <th width="25%">입주사</th>
                                <th width="25%">예약기간</th>
                                <th width="40%">시설 사용 용도</th>
                            </tr>
                        </thead>
                        <tbody id="book-list">
                            <!-- <tr>
                                <td>소회의실1</td>
                                <td>홍길동</td>
                                <td>2020.01.15 11:00 ~ 2020.01.05 13:00</td>
                                <td><span class="blue-label">예약 완료</span></td>
                            </tr> -->
                        </tbody>
                    </table>

                </div><!-- r-contents div 끝 -->
            </div><!-- right-contents div 끝 -->
        </div>
    </div>
	<!-- footer start -->
	<%@ include file="/WEB-INF/footer.jsp"%>
	<!-- footer end -->
	
	<!-- extension start -->
	<script>
		$(function() {
			$("#dateString").val(moment().format("yyyy-MM"));
			getBookListMonthly();
		});
		
		$.fn.datepicker.language['kor'] = {
			days: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			daysShort: ['일', '월', '화', '수', '목', '금', '토'],
			daysMin: ['일', '월', '화', '수', '목', '금', '토'],
			months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			today: '오늘',
			clear: '새로고침',
			dateFormat: 'yyyy-mm',
			timeFormat: 'hh:ii AA',
			firstDay: 0
		};
		
		function getBookListMonthly() {
			var placeId = $("#placeId").val();
			
			if(placeId == 0) {
				alert("조회할 시설을 선택해주세요.");
				return;
			}
			
			var dateArr = $("#dateString").val().split("-");
			var data = {
				placeId: placeId,
				year : dateArr[0],
				month: dateArr[1]
			}
			
			$.ajax({
				method: "get",
				cache: false,
				url: _VARS.ACTIONS.getBookList,
				data: data,
				success: function(data) {
					var elArr = [];
					if(data.bookList && data.bookList.length <= 0) {
						$("tbody#book-list").html(
							'<tr>' +
		                        '<td colspan="4">예약 이력이 존재하지 않습니다.</td>' +
		                    '</tr>'
						);
						return;
					}
					
					data.bookList.every(function(book, index) {
						var sTime, eTime, temp;
						
						var hArr = [book.h09, book.h10, book.h11, book.h12, book.h13, book.h14, book.h15, book.h16, book.h17];
						
						hArr.every(function(h, hIndex) {
							if(h === 1) {
								if(typeof sTime === "undefined") {
									sTime = _VARS.NAME_ARRAY.TIME_NAME[hIndex].split(" ~ ")[0];
									temp = hIndex;
								} else {
									eTime = _VARS.NAME_ARRAY.TIME_NAME[hIndex].split(" ~ ")[1];
								}
							}
							
							if(typeof eTime !== "undefined") {
								return false;
							} else {
								if(hIndex === hArr.length-1) {
									eTime = _VARS.NAME_ARRAY.TIME_NAME[temp].split(" ~ ")[1];
									temp = undefined;
								} 
								return true;
							}
						})

						var dateTimeString = "<strong>" + book.bookDate + "</strong>   " + sTime + " ~ " + eTime; 
						var html = '<tr>' +
	                        '<td>회의실 ' + book.placeId + '</td>' +
	                        '<td>' + book.userName + '</td>' +
	                        '<td>' + dateTimeString + '</td>' +
	                        '<td>' + filterXSS(book.description) + '</td>' +
	                    '</tr>';
	                    elArr.push(html);
	                    return true
					});
					
					$("#book-list").html(elArr.join(""));
				},
				error: function(error) {
					console.log();
				}
			})
		}	
	</script>
	<!-- extension end -->
	

</body>
</html>