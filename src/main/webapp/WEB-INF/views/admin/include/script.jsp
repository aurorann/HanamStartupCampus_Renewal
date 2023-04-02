<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

	<script >
	window._VARS = {};
	
	_VARS.searchOption = {
		boardType: "${searchOption.boardType}",
		searchType: "${searchOption.searchType}",
		keyword: "${searchOption.keyword}",
		curPage: Number("${searchOption.curPage}"),
	};
	
	_VARS.IS_ADMIN = true;
	
	try {
		_VARS.page = JSON.parse('${page}');	
	} catch(error) {
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
			MOD_MAX_DAILY_CNT    : Number('${maxDailyCnt}'), // 수정 값
			MOD_MAX_AVAIL_DAY    : Number('${maxAvailDay}'), // 수정 값
			MAX_DAILY_CNT        : 9, // 적용 값
			MAX_AVAIL_DAY        : 9999, // 적용 값
			SELECTED_DATE        : undefined,
			SELECTED_DATE_STRING : undefined,
			START_TIME           : undefined,
			END_TIME             : undefined
		};
		
		$(function() {
			if(_VARS.BOOK_FORM && _VARS.BOOK_FORM.PLACE_ID !== 0) {
				$('select[name="maxDailyCnt"] > option[value="' + _VARS.BOOK_FORM.MOD_MAX_DAILY_CNT + '"]').attr("selected", true);
				$('input[name="maxAvailDay"]').val(_VARS.BOOK_FORM.MOD_MAX_AVAIL_DAY);
			}
		})()
		
	} catch(error) {
		console.log("place id not found");
	}
	
	_VARS.ACTIONS = {
		getBookList: "<c:url value='/book/list'/>",
		addBookPlace: "<c:url value='/admin/book/place'/>/"
	}
	
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
		_VARS.SECURED_FUNCTION = function(seqId) {
			if(confirm("해당 예약을 취소처리 하시겠습니까?")) {
				$.ajax({
					cache: false,
					method: "post",
					url: "<c:url value='/admin/book/place/history/remove'/>/" + seqId,
					headers : _VARS.CSRF,
					success: function(data) {
						if(data.result > 0) {
							alert("해당 예약이 취소되었습니다.");
							location.reload();
						} else {
							alert("예약 취소가 불가능 합니다. 관리자에게 문의바랍니다.");
						}
					},
					error: function(error) {
						alert("예약 취소가 불가능 합니다. 관리자에게 문의바랍니다.");
						console.log(error);
					}
				});
			}
		}
		
		_VARS.SECURED_MAXVAL_FUNCTION = function() {
			if(confirm("해당 예약 제한요소를 적용 하시겠습니까?")) {
				var pObj = {
					seqId: _VARS.BOOK_FORM.PLACE_ID,
					maxDailyCnt: $('select[name="maxDailyCnt"]').val(),
					maxAvailDay: $('input[name="maxAvailDay"]').val()
				}
				$.ajax({
					cache: false,
					method: "post",
					url: "<c:url value='/admin/book/place/max-value/edit'/>/" + pObj.seqId,
					data: pObj,
					headers : _VARS.CSRF,
					success: function(data) {
						if(data.result > 0) {
							alert("적용 사항이 반영되었습니다.");
							location.reload();
						} else {
							alert("적용 사항이 반영되지 않았습니다. 관리자에게 문의바랍니다.");
						}
					},
					error: function(error) {
						alert("적용 사항이 반영되지 않았습니다. 관리자에게 문의바랍니다.");
						console.log(error);
					}
				});
			}
		}
	</sec:authorize>
	
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
	