<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

	<script>
		window._VARS = {};
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
			
		} catch(error) {
			console.log("place id not found");
		}
		
		_VARS.ACTIONS = {
			getBookList: "<c:url value='/book/list'/>",
			addBookPlace: "<c:url value='/book/place'/>/"
		}
		
		_VARS.CSRF = {
			'${_csrf.headerName}': '${_csrf.token}' 
		}
	</script>
	