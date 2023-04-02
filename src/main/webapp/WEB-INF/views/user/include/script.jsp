<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

	<script>
		window._VARS = {};
		
		_VARS.searchOption = {
			boardType: "${searchOption.boardType}",
			searchType: "${searchOption.searchType}",
			keyword: "${searchOption.keyword}",
			curPage: Number("${searchOption.curPage}"),
		};
		
		try {
			_VARS.page = JSON.parse('${page}');	
		} catch (error) {
			console.log("page object not found");
		}
		
		_VARS.NAME_ARRAY = {
			TIME_NAME: [
				"09:00 ~ 10:00",
				"10:00 ~ 11:00",
				"11:00 ~ 12:00",
				"12:00 ~ 13:00",
				"13:00 ~ 14:00",
				"14:00 ~ 15:00",
				"15:00 ~ 16:00",
				"16:00 ~ 17:00",
				"17:00 ~ 18:00"
			],
			COL_NAME: [
				"H09",
				"H10",
				"H11",
				"H12",
				"H13",
				"H14",
				"H15",
				"H16",
				"H17"
			]
		};
	
		try {
			_VARS.BOOK_FORM = {
				PLACE_ID             : Number('${placeId}'),
				MAX_DAILY_CNT        : Number('${maxDailyCnt}'),
				MAX_AVAIL_DAY        : Number('${maxAvailDay}'),
				SELECTED_DATE        : undefined,
				SELECTED_DATE_STRING : undefined,
				START_TIME           : undefined,
				END_TIME             : undefined
			};
			
			_VARS.USER_ID = Number('${userId}');
			
		} catch(error) {
			console.log("place id not found");
		}
		
		_VARS.ACTIONS = {
			getBookList: "<c:url value='/book/list'/>",
			addBookPlace: "<c:url value='/book/place'/>/",
			removeBookHistoryOne: "<c:url value='/book/place/history/remove'/>/"
		}
		
		_VARS.CSRF = {
			'${_csrf.headerName}': '${_csrf.token}' 
		}
		
		function pagenation(page) { // 파라메터 page 객체로 변경하면서 모듈도 수정해야
			if(page) {
				
				var pageContent = "";
			
				pageContent += '<ul class="pagination">';
				if(page.curRange!=1) {
					pageContent += 
						'<li class="page-item">' +
				         '<a class="page-link" href="javascript:getPostList(' + (page.startPage-page.rangeSize) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				for(i=page.startPage;i<=page.endPage;i++){
					if(i!=page.curPage) {
						pageContent+='<li class="page-item"><a class="page-link" href="javascript:getPostList(' + i + ')">' + i + '</a></li>';
					}
					if(i==page.curPage) {
						pageContent+='<li class="page-item active"><a class="page-link" href="javascript:void(0);">' + i + '</a></li>';
					}
				}
				if(page.curRange!=page.rangeCnt) {
					pageContent += 
						'<li class="page-item">' +
						  '<a class="page-link" href="javascript:getPostList(' + (page.curRange*page.rangeSize+1) + ')" aria-label="Next">' +
				            '<span aria-hidden="true"><img src="<c:url value='/resources/img/arrow_right_sm.png' />"></span>' +
				          '</a>' +
				        '</li>';
				}
				pageContent += '</ul>';
				
				return pageContent;	
			} else {
				return '';
			}
		}
	</script>
	