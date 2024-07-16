$(document).ready(function(){
	$("a#bookSubmit").on("click", function() {
		sendBookForm();
	});
	
/*	var left_arrow = '<object><?xml version="1.0" encoding="UTF-8" standalone="no"?><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50" viewBox="0 0 50 50"><path id="dp_path001" fill="none" fill-rule="evenodd" stroke="rgb(250, 250, 250)" stroke-width="4.5" stroke-linejoin="round" d="M 9.35467,25 L 38.0107,8.01467 L 28.8267,25 L 38.012,41.988 Z "/></svg></object>';

	var right_arrow = '<object><?xml version="1.0" encoding="UTF-8" standalone="no"?><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50" viewBox="0 0 50 50"><path id="dp_path001" fill="none" fill-rule="evenodd" stroke="rgb(250, 250, 250)" stroke-width="4.5" stroke-linejoin="round" d="M 38.016,25.0027 L 9.36,8.01733 L 18.544,25.0027 L 9.35867,41.9907 Z "/></svg></object>';*/

//	$('.calendar-previous-month').html(left_arrow);
//	$('.calendar-next-month').html(right_arrow);
	
	//Set the height of the days and the month selection buttons
//	setDayHeight();
//	setMonthButtonSize();

	//Create an array of the months of the year (Zero-based to correspond with DateTime returns)
	var months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

	//Create an array of the table cells (days of month)
	var calendarDaysArray = $('.calendar-days td').toArray();

	//Store the current date, and each part
	var	currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var currentMonth = currentDate.getMonth();
	var currentDay = currentDate.getDate();
	var currentDayOfWeek = currentDate.getDay();

	//DEBUG Functionality (Zero-based, remember)
	//currentYear = 2015;
	//currentMonth = 0;
	//currentDay = 2;

	//Store the user selected date, and each part
	var selectedYear = currentYear;
	var selectedMonth = currentMonth;

	calendarToday();

	/**********************************************************************************************/
	/**********************************************************************************************/
	/* Date functions */

	/**
	 * Updates the calendar to reflect the current date
	 */
	function calendarToday()
	{
		selectedMonth = currentMonth;
		selectedYear = currentYear;

		calendarUpdate();
	}

	/**
	 * Updates the calendar to reflect the selected date
	 */
	function calendarUpdate()
	{
		//Update the Calendar Month and Year
		calendarUpdateHeader(selectedMonth, selectedYear);

		//Get the first day of the current month
		//	(0-6, representing the day of first week that the current month starts on)
		var firstDayOfMonth = calendarGetFirstDayOfMonth(selectedMonth, selectedYear);

		//Get the number of days in the current month
		//	(28-31)
		var daysInMonth = calendarGetDaysInMonth(selectedMonth, selectedYear);

		//Get the last day of the current month
		//	(0-30, represnting the last index in the days array that belongs to the current month)
		var lastDayOfMonth = firstDayOfMonth + daysInMonth - 1;

		//Get the number of days in the last month, which will be used for the last month day-numbering
		//	(28-31)
		var daysInLastMonth = calendarGetDaysInMonth(selectedMonth - 1, selectedYear);

		//Get the last day of the week of last month
		//	(0-6, representing the day of the week that the last month ended on)
		var lastDayOfLastMonth = firstDayOfMonth - 1;
		
		//Counters for the various months/partials displayed
		var lastMonthDayCounter = daysInLastMonth - (lastDayOfLastMonth + 1);
		var currentMonthDayCounter = 0;
		var nextMonthDayCounter = 0;

		//Counters for the days in the next/previous months that are displayed on the calendar
		var daysInNextMonthDisplayed = 0;
		var daysInLastMonthDisplayed = 0;

		//Loop over each day, and determine whether or not it belongs to the current month
		for (var i = 0; i < 42; i++)
		{
			calendarDaysArray[i].onclick = undefined;
			
			//Style the background of the day according to whether or not it belongs to the selected month
			if (i >= firstDayOfMonth && i <= lastDayOfMonth)
			{
				
				var thisDate = selectedYear+"-"
				+String(selectedMonth+1).padStart(2,"0")+"-"
				+String(++currentMonthDayCounter).padStart(2,"0");
				var bookYnHTML = "<h5>" + (currentMonthDayCounter) + "</h5>";
				
				if(moment() > moment(thisDate+" 23:59")) {
					bookYnHTML += "<span class='reservation-off'></span>";
				} else {
					if(!_VARS.IS_ADMIN && moment(thisDate+" 23:59").diff(moment(), "days") > _VARS.BOOK_FORM.MAX_AVAIL_DAY) {
						bookYnHTML += "<span class='reservation-off'></span>";
					} else {
						bookYnHTML += "<span class='reservation-on'></span>";
					}
				}		
				
				$(calendarDaysArray[i]).removeClass().addClass('current-month');
				$(calendarDaysArray[i]).html(bookYnHTML);
				$(calendarDaysArray[i]).attr(
						"data-date-string",
						thisDate
				);
				$(calendarDaysArray[i]).attr(
						"data-date-format-string",
						selectedYear+"년 "
						+String(selectedMonth+1)+"월 "
						+String(currentMonthDayCounter)+"일"
				);
				$(calendarDaysArray[i]).attr(
						"data-day-format-string",
						String(selectedMonth+1)+"월 "
						+String(currentMonthDayCounter)+"일"
				);
				$(calendarDaysArray[i]).attr("data-day-string", currentMonthDayCounter)
			}
			else
			{
				$(calendarDaysArray[i]).removeClass().addClass('not-current-month');

				if(i < firstDayOfMonth)
				{
					$(calendarDaysArray[i]).html("<h5>" + (++lastMonthDayCounter) + "</h5>");
					daysInLastMonthDisplayed ++;
				}
				else if(i > lastDayOfMonth)
				{
					$(calendarDaysArray[i]).html("<h5>" + (++nextMonthDayCounter) + "</h5>");
					daysInNextMonthDisplayed ++;
				}
			}
		}

		//If the next/previous month is displayed, select the current date if it is still showing
		if ((selectedMonth == currentMonth - 1 && selectedYear == currentYear) ||
			((selectedMonth == 11 && currentMonth == 0) && (selectedYear == currentYear - 1)))
		{
			if (currentDay <= daysInNextMonthDisplayed)
			{
				$(calendarDaysArray[lastDayOfMonth + currentDay]).addClass('today-other-month');
			}
		}
		else if ((selectedMonth == currentMonth + 1 && selectedYear == currentYear) || 
			((selectedMonth == 0 && currentMonth == 11) && (selectedYear == currentYear + 1)))
		{
			if (daysInLastMonth - currentDay - 1 >= 0)
			{
				$(calendarDaysArray[daysInLastMonthDisplayed - 1 - (daysInLastMonth - currentDay)]).addClass('today-other-month');
			}
		}
		else if (selectedMonth == currentMonth && selectedYear == currentYear)
		{
			//Highlight the current day in the calendar
			(!_VARS.TODAY) && $(calendarDaysArray[firstDayOfMonth + currentDay - 1]).addClass('reservation-choice');
		}
		
		/*$('.debug1').text('currentDayOfWeek - ' + currentDayOfWeek);
		$('.debug2').text('firstDayOfMonth - ' + firstDayOfMonth);
		$('.debug3').text('daysInMonth - ' + daysInMonth);
		$('.debug4').text('lastDayOfMonth - ' + lastDayOfMonth);
		$('.debug5').text('daysInLastMonth - ' + daysInLastMonth);
		$('.debug6').text('lastDayOfLastMonth - ' + lastDayOfLastMonth);
		$('.debug7').text('lastMonthDayCounter - ' + lastMonthDayCounter);
		$('.debug8').text('currentMonthDayCounter - ' + currentMonthDayCounter);
		$('.debug9').text('nextMonthDayCounter - ' + nextMonthDayCounter);*/
		
		/**
		 * 해당 월 예약목록 조회
		 * @param  {string} dateString 날짜 문자열 (YYYY-MM)
		 * @param  {int} placeId 예약할 장소 ID
		 * @return {object} 
		 */
		
		var $bookTimeTables = $("table.reservation-table.time-contents tbody.time tr");
		$bookTimeTables.each(function(index, time) {
			time.onclick = selectTimeTable;
		});
		
		var $calendar = $("table.reservation-table.calendar-contents");
		var $calendarDisabledDays = $("td.not-current-month", $calendar);
		var $calendarDays = $("td.current-month", $calendar);
		$calendarDays.each(function(index, day) {
			day.onclick = function() {
				initBookForm(this);
			};
		});
		
		$calendarDisabledDays.each(function(index, day) {
			day.onclick = undefined;
			$(day).removeClass("reservation-choice");
		});
		
		$.ajax({
			cache: false,
			method: "get",
			url: _VARS.ACTIONS.getBookList,
			data: {
				year: selectedYear,
				month: (selectedMonth+1),
				placeId: _VARS.BOOK_FORM.PLACE_ID
			},
			success: function(data) {
				_VARS.BOOK_LIST_MONTHLY = data.bookList;
				_VARS.BOOK_CALENDAR     = data.calendar;
				var rCalendar = data.calendar;
				if(rCalendar.every(function(day) {
					var $day = $("[data-date-string='" + day.bookDate + "']", $calendar);
					var $day_date = $("h5", $day);
					var $day_avail = $("span", $day);
					
					if(day.bookTimeCount >= 9) {
						$day_avail.attr("class", "reservation-off");
					}
					$day_avail.text(day.bookCount + "건");
					// class="reservation-choice"
					return true;
				})) {
					(!_VARS.TODAY) ? (_VARS.TODAY = $("table.calendar-days .reservation-choice").click())
							: (_VARS.BOOK_FORM.SELECTED_DATE) && $("[data-date-string='" + _VARS.BOOK_FORM.SELECTED_DATE + "'].current-month").addClass('reservation-choice');
				}
			},
			error: function(error) {
				console.log();
			}
		})
	}
	
	function initBookForm(dayDOM) {
		_VARS.BOOK_FORM.SELECTED_DATE = undefined;
		_VARS.BOOK_FORM.SELECTED_DATE_STRING = undefined;
		_VARS.BOOK_FORM.START_TIME = undefined;
		_VARS.BOOK_FORM.END_TIME = undefined;
		
		var bookList = window._VARS.BOOK_LIST_MONTHLY;
		var $bookListWrapper = $("div.book-list-wrapper");
		var $bookListTitle = $("h3.book-list-title", $bookListWrapper);
		var $bookList = $("ul.book-list-text-body", $bookListWrapper);
		var timeNameArr = _VARS.NAME_ARRAY.TIME_NAME;
		var bookListHTML = "";
		var $calendar = $("table.reservation-table.calendar-contents");
		var $bookTimeTables = $("table.reservation-table.time-contents tbody.time tr");
		var $day = $(dayDOM);
		var selectedDate = $day.attr("data-date-string");
		var selectedDateFormat = $day.attr("data-date-format-string");
		var selectedDayFormat = $day.attr("data-day-format-string");
		
		emptyBookConfirm();
		
		$(".reservation-choice", $calendar).attr("class", "");
		$day.attr("class", "reservation-choice");
		
		_VARS.BOOK_FORM.SELECTED_DATE = selectedDate;
		_VARS.BOOK_FORM.SELECTED_DATE_STRING = selectedDateFormat;
		
		var $bookForm = $("#bookForm");
		
		$("#bookForm").val($day.attr("data-date-string"));

		$bookTimeTables.attr("class", "");
		
		bookListHTML =
					    '<li>' +
							'<span class="time"style="width:20%">예약 시간</span>' +
					        '<span class="name"style="width:20%">시설 사용자</span>' +
							'<span class="description"style="width:40%">시설 사용 용도</span>' +
							'<span class="delete"style="width:20%"></span>' +
					    '</li>';
			
			
		if(bookList.every(function(book, index) {
			if(book.bookDate === selectedDate) {
				bookListHTML += 
					'<li>'+
					'<span class="time"style="width:20%">' + timeNameArr[book.startIndex].split(" ~ ")[0] + ' ~ ' + timeNameArr[book.endIndex].split(" ~ ")[1] + '</span>'+
	                '<span class="name"style="width:20%">' + book.userName + '</span>'+
					'<span class="description"style="width:40%">' + filterXSS(book.description) + '</span>';
				if(_VARS.USER_ID === book.userId || _VARS.IS_ADMIN) {
					bookListHTML += '<span class="delete check_delete"><button onclick="_VARS.SECURED_FUNCTION(' 
						+ book.seqId + ', \'' + book.bookDate + '\', \''+ timeNameArr[book.startIndex].split(" ~ ")[0] + '\', \'' 
						+ timeNameArr[book.endIndex].split(" ~ ")[1] +'\');">예약 취소</span>';
				}
				bookListHTML += '</li>';
				
				var hArr = [book.h09, book.h10, book.h11, book.h12, book.h13, book.h14, book.h15, book.h16, book.h17];
				hArr.every(function(h, hIndex) {
					//$($bookTimeTables[hIndex]).onclick = selectTimeTable;
					if(h === 1) {
						$($bookTimeTables[hIndex]).attr("class", "booked");
					}
					return true;
				});
			}
			return true;
		})) {
			$bookListTitle.text(selectedDayFormat + " 사용 일정");
			$bookList.html(bookListHTML);
		}
	}
	
	function selectTimeTable() {
		var $time = $(this);
		if($time.attr("class").indexOf("booked") > -1) {
			return false;
		} else if(moment() > moment(_VARS.BOOK_FORM.SELECTED_DATE + " 23:59")) {
			alert("올바른 예약 정보가 아닙니다. 예약 일시를 확인해주세요.");
			return false;
		} else if(moment(_VARS.BOOK_FORM.SELECTED_DATE + " 23:59").diff(moment(), "days") > _VARS.BOOK_FORM.MAX_AVAIL_DAY) {
			alert("올바른 예약 정보가 아닙니다. 예약 일시를 확인해주세요.");
			return false;
		} else {
			var $bookTimeTable = $("table.reservation-table.time-contents tbody.time");
			var bookForm = _VARS.BOOK_FORM;
			
			if(bookForm.START_TIME === undefined) {
				bookForm.START_TIME = Number($time.attr("data-time-index"));
				$time.attr("class","reservation-choice");
				isBookFormReady();
				// if($("tr.reservation-choice", $bookTimeTable).length > 1) {
				// 	
				// }
			} else if(bookForm.END_TIME !== undefined) {
				bookForm.END_TIME = undefined, bookForm.START_TIME = undefined;
				$(".reservation-choice", $bookTimeTable).attr("class", "");
				
				bookForm.START_TIME = Number($time.attr("data-time-index"));
				$time.attr("class","reservation-choice");
				
				isBookFormReady();
			} else {
				if(bookForm.START_TIME == $time.attr("data-time-index")) {
					$time.attr("class", "");
					bookForm.START_TIME = undefined;
					emptyBookConfirm();
					return;
				} else {
					bookForm.END_TIME = Number($time.attr("data-time-index"));
				}
				if(getSeqAsc(bookForm.START_TIME, bookForm.END_TIME).every(function(val) {
					var $nestedTime = $("[data-time-index='" + val + "']", $bookTimeTable);
					if($nestedTime.attr("class").indexOf("booked") > -1) {
						return false;
					} else {
						$nestedTime.attr("data-nested-flag","");
						return true;
					}
				})) {
					$("[data-nested-flag]", $bookTimeTable).attr("class","reservation-choice").removeAttr("data-nested-flag");
					if(bookForm.START_TIME > bookForm.END_TIME) {
						var temp = bookForm.START_TIME;
						bookForm.START_TIME = bookForm.END_TIME;
						bookForm.END_TIME = temp;
					}
					isBookFormReady();
				} else {
					bookForm.END_TIME = undefined;
					$("[data-nested-flag]", $bookTimeTable).removeAttr("data-nested-flag");
					alert("다른 예약이 포함된 시간대 입니다. 다른 시간대를 선택해주세요.");				
				}
			}
		}
	}
	
	function emptyBookConfirm() {
		$("div.reservation-all").text("선택된 예약 시간 없음");
	}
	
	function isBookFormReady() {
		var bookForm = window._VARS.BOOK_FORM;
		var timeNameArr = window._VARS.NAME_ARRAY.TIME_NAME;
		
		if(bookForm.PLACE_ID === undefined && bookForm.SELECTED_DATE === undefined) {
			alert("올바른 예약 정보가 아닙니다. 예약 일시를 확인해주세요.");
			return false;
		} else {
			var $bookConfirm = $("div.reservation-all");
			
			if(bookForm.START_TIME !== undefined && bookForm.END_TIME === undefined) {
				var timeName = timeNameArr[bookForm.START_TIME].split(" ~ ");
				$bookConfirm.html(
						"회의실 " + bookForm.PLACE_ID
						+ " / " + bookForm.SELECTED_DATE_STRING
						+ " / "  + timeName[0]
						+ ' ~ ' + timeName[1]
				);
				return true;
			} else if(bookForm.START_TIME !== undefined && bookForm.END_TIME !== undefined) {
				$bookConfirm.html(
						"회의실 " + bookForm.PLACE_ID
						+ " / " + bookForm.SELECTED_DATE_STRING
						+ " / "  + timeNameArr[bookForm.START_TIME].split(" ~ ")[0]
						+ ' ~ ' + timeNameArr[bookForm.END_TIME].split(" ~ ")[1]
				);
				return true;
			}
		}
	}
	
	if(typeof _VARS.SECURED_FUNCTION === "undefined") {
		_VARS.SECURED_FUNCTION = function(seqId, bookDate, startTime, endTime) {
			if(moment(bookDate + " " + startTime) < moment()) {
				alert("이미 지난 시간대의 예약은 취소가 불가능합니다.");
				return false;
			}
			if(confirm("해당 예약을 취소하시겠습니까?")) {
				$.ajax({
					cache: false,
					method: "post",
					url: _VARS.ACTIONS.removeBookHistoryOne + seqId,
					headers : _VARS.CSRF,
					data: {
						bookDate: bookDate
					},
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
	}
	
	 function sendBookForm() {
		var bookForm = window._VARS.BOOK_FORM;
		var timeNameArr = _VARS.NAME_ARRAY.TIME_NAME;
		
		var description = $("textarea#description").val().trim();
		var thisMonthPlus = moment().add(1, "M").format('YYYY-MM');
		var selectedMonth = moment(bookForm.SELECTED_DATE).format('YYYY-MM');
		
		if(!isBookFormReady()) {
			return false;
		} else if(description === "") {
			alert("시설 사용 용도 작성이 반드시 필요합니다.");
			return false;
		} else if(description.length > 200) {
			alert("사용 용도는 200자 이내로 작성되어야 합니다.");
			return false;
		/*} else if(moment(thisMonthPlus) < moment(selectedMonth)) {
			alert("대관 예약 가능 기간은 최대 익월까지 입니다.");
			return false;*/
		} else if(moment(bookForm.SELECTED_DATE + " " + timeNameArr[bookForm.START_TIME].split(" ~ ")[0]) < moment()) {
			alert("지난 시간대는 예약이 불가합니다.");
			return false;
	 	} else {
			$.ajax({
				cache: false,
				method: "post",
				url: _VARS.ACTIONS.addBookPlace + bookForm.PLACE_ID,
				headers : _VARS.CSRF,
				data: {
					// userId: 1, // PLACE CODE
					// userName: "TESTING", // USER SEQ_ID
					description: $("textarea#description").val().trim(),
					status: 0,
					bookDate: bookForm.SELECTED_DATE,
					startIndex: bookForm.START_TIME,
					endIndex: bookForm.END_TIME
				},
				success: function(data) {
					if(data.result > 0) {
						alert("해당 시간대 시설 대관이 예약되었습니다.");
						location.reload();
					} else {
						if(data.message) {
							alert(data.message);
						} else {
							alert("예약이 불가능 합니다. 관리자에게 문의바랍니다.");
						}
					}
					calendarUpdate();
				},
				error: function(error) {
					alert("예약이 불가능 합니다. 관리자에게 문의바랍니다.");
					console.log(error);
				}
			});
		}
	}

	/**
	 * Update the calendar header to reflect the selected month and year
	 * @param  {int} month Integer that represents the month to be displayed
	 * @param  {int} year  Integer that represents the year to be displayed
	 */
	function calendarUpdateHeader(month, year)
	{
		$(".d-title.calendar-current-month-container").text(
				year + "년 " + months[month]
		)
//		$('.calendar-current-month').text();
//		$('.calendar-current-year').text();
	}

	/**
	 * Moves the calendar to display the next month
	 */
	function calendarNextMonth()
	{
		//If the next month is in the next year, reset the month to January and increment the year
		if(!(selectedMonth == 11 && selectedYear >= currentYear + 1))
		{	
			var compareMonth = (((selectedYear > currentYear) && selectedMonth === 0) ? 12 : selectedMonth);
			// n개월 이후 까지 달력을 표시
			if(selectedYear < currentYear || compareMonth - currentMonth < 4) {

				if (selectedMonth == 11)
				{
					
					selectedMonth = 0;
					selectedYear++;
				}
				else
				{
					selectedMonth++;
				}

				//Update the calendar to reflect the new month
				calendarUpdate();
			}
		}
	}
	
	/*
	function calendarNextMonth() {
		//If the next month is in the next year, reset the month to January and increment the year
		if(!(selectedMonth == 11 && selectedYear >= currentYear + 1)) {
			if(currentYear <= selectYear && currentMonth <= selectMonth &&
					( (selectedMonth === 0) ? 12 : selectedMonth) - currentMonth < 1) ) {
				return;
			} else {
				if(selectedMonth == 11) {
					selectedMonth = 0;
					selectedYear++;
				} else {
					selectedMonth++;
				}
				calendarUpdate();
			}
		}
	}*/


	/**
	 * Moves the calendar to display the previous month
	 */
	function calendarPreviousMonth()
	{
		//If the previous month is in the previous year, reset the month to December and decrement the year
		if (!(selectedMonth === 0 && selectedYear <= currentYear - 1))
		{
			if (selectedMonth === 0)
			{
				selectedMonth = 11;
				selectedYear--;
			}
			else
			{
				selectedMonth--;
			}

			//Update the calendar to reflect the new month
			calendarUpdate();
		}
	}

	/**
	 * Returns the zero-based day of the week of the first day of the specified month and year
	 * @param  {int} year  Integer that represents the month portion of the input date
	 * @param  {int} month Integer that represents the year portion of the input date
	 * @return {int}       Integer that represents the zero-based day of the week of the first day of the input month/year
	 */
	function calendarGetFirstDayOfMonth(month, year)
	{
		var date = new Date(year, month, 1);
		return date.getDay();
	}

	/**
	 * Returns the number of days in the specified month and year
	 * @param  {int} month Integer that represents the month portion of the input date
	 * @param  {int} year  Integer that represents the year portion of the input date
	 * @return {int}       Integer that represents the number of days in the specified month and year
	 */
	function calendarGetDaysInMonth(month, year)
	{
		return new Date(year, month + 1, 0).getDate();
	}


	/**********************************************************************************************/
	/* Click EVENTS */
	$('.calendar-previous-month').click(calendarPreviousMonth);
	$('.calendar-next-month').click(calendarNextMonth);
	$('.calendar-current-month-container').click(calendarToday);
});

//When the window resizes, reset the height of the days and month selector buttons
//$(window).resize(function()
//{
//	setDayHeight();
//	setMonthButtonSize();
//});

/**
 * Updates the height of the table cells to match their width
 */
function setDayHeight()
{
	var calendarDayWidth = $('.calendar-days td').width();
	$('.calendar-days td').css('height', calendarDayWidth);
}

/**
 * Updates the height and width of the month selector buttons to match the calendar header
 */
function setMonthButtonSize()
{
	var calendarHeaderHeight = $('.calendar-header').height();
	$('.calendar-previous-month').width(calendarHeaderHeight);	
	$('.calendar-previous-month').height(calendarHeaderHeight);
	$('.calendar-next-month').width(calendarHeaderHeight);
	$('.calendar-next-month').height(calendarHeaderHeight);
}