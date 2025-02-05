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

<!-- Extention Start -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/datepicker/css/datepicker.min.css' />">
	<script src="<c:url value='/resources/vendor/datepicker/js/datepicker.min.js' />"></script>
<!-- Extention End -->


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
						    <li><button onclick="location.href='<c:url value='/book/place' />' ">회의실 예약 캘린더</button></li>
						    <li><button class="active" onclick="location.href='javascript:void(0);' ">회의실 예약현황</button></li>
						</ul>
					</div>
					
					
				    
	                <div class="search_wrap">
	                    <div class="search_form" id="searchForm">
                            <select id="placeId">                                
                                <option value="1">회의실 1</option>
                                <option value="2">회의실 2</option>
                            </select>
                            
                            <input type="text" class="datepicker-here" id="dateString" name="keyword"
                            	data-min-view="months" data-view="months"
								autocomplete="on" data-format='yyyy-mm' data-language="kor"/>
								
                            <button type="submit" class="search-btn serch_btn" onclick="getBookListMonthly();">검색</button>
	                    </div>
	                </div><!--search_wrap-->
	                
	                <table>
	                    <thead>
	                        <tr>
                                <th width="15%">시설명</th>
                                <th width="25%">입주사</th>
                                <th width="25%">예약기간</th>
                                <th width="35%">시설 사용 용도</th>
	                        </tr>
	                    </thead>
	
	                    <tbody id="book-list">
	                    	<!-- 
	                        <tr>
	                            <td class="board_numb">1</td>
	                            <td class="board_title">
	                                <a href="#">신규 고정 공지사항 게시판입니다.</a>
	                            </td>
	                            <td class="board_view">관리자1</td>
	                            <td class="board_start">2024.04.05</td>
	                            <td class="board_end">200</td>
	                            <td class="board_check"><input type="checkbox"></td>
	                        </tr>
	                         -->
	                    </tbody>
	                </table><!--board_wrap 게시판-->
                </div>
			</div><!-- right-contents div 끝 -->
        </main>
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

						var dateTimeString = book.bookDate + "   " + sTime + " ~ " + eTime; 
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