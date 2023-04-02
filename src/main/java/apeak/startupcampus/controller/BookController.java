package apeak.startupcampus.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dto.BookListDTO;
import apeak.startupcampus.model.dto.BookPlaceDTO;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.BookService;

@Controller
@Secured({"ROLE_USER", "ROLE_ADMIN"})
@RequestMapping("/book")
public class BookController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BookController.class);
	
	@Resource(name = "bookService")
	private BookService bookService;
	
	// 회의실 소개뷰 이동
	@RequestMapping(value = "/place")
	public String goToBookPlaceList(Model model) {
		Utils.setPageViewLocation(model, "입주기업 전용공간", "회의실 예약 및 현황");
		return "user/place";
	}
	
	// 회의실 예약폼 이동
	@RequestMapping(value = "/place/form/{placeId}")
	public String goToBookPlaceForm(@PathVariable("placeId") int placeId, Model model, Authentication auth) throws Exception {
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		BookPlaceDTO bookPlaceInfo = bookService.getBookPlaceInfo(placeId);
		LOGGER.debug("MAX DAILY COUNT: " + bookPlaceInfo.getMaxDailyCnt() + " / MAX DAILY COUNT:" + bookPlaceInfo.getMaxAvailDay());
		model.addAttribute("placeId", bookPlaceInfo.getSeqId());
		model.addAttribute("maxDailyCnt", bookPlaceInfo.getMaxDailyCnt());
		model.addAttribute("maxAvailDay", bookPlaceInfo.getMaxAvailDay());
		model.addAttribute("userId", userDTO.getSeqId());
		Utils.setPageViewLocation(model, "입주기업 전용공간", "회의실 예약 및 현황");
		return "user/book-write" + bookPlaceInfo.getSeqId();
	}
	
	// 회의실 예약 현황뷰 이동
	@RequestMapping(value = "/history")
	public String goToBookHistory(Model model) {
		Utils.setPageViewLocation(model, "입주기업 전용공간", "회의실 예약 및 현황");
		return "user/book-history";
	}
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> searchMonthlyBookList(String year, String month, int placeId) throws Exception {
		LOGGER.debug("year: " + year + " / month: " + month + " / placeId: " + placeId);
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("year", year);
		searchOption.put("month", month);
		searchOption.put("placeId", placeId);
		
		searchOption.put("result", new HashMap<String, Object>());
		return bookService.searchBookListMonthly(searchOption);
	}
	
	@RequestMapping(value = "/place/{placeId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bookingPlace(
		@PathVariable("placeId") int placeId, @ModelAttribute BookListDTO bookListDTO, Authentication auth
	) throws Exception {
		LOGGER.debug(bookListDTO.toString());
		Map<String, Object> rMap = new HashMap<String, Object>();
		BookPlaceDTO bookPlaceDTO = bookService.getBookPlaceInfo(placeId);
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		bookListDTO.setPlaceId(bookPlaceDTO.getSeqId());
		bookListDTO.setUserId(userDTO.getSeqId());
		bookListDTO.setUserName(userDTO.getName());
		
		// 일일 최대 예약 시간 체크
		int bookSeqCnt;
		int dailyBookCnt = bookService.getDailyBookCount(bookListDTO);
		if(bookListDTO.getEndIndex() == null) {
			bookSeqCnt = 1;
			bookListDTO.setEndIndex(bookListDTO.getStartIndex());
		} else {
			bookSeqCnt = (bookListDTO.getEndIndex() - bookListDTO.getStartIndex()) + 1;
		}
		
		if(dailyBookCnt + bookSeqCnt > bookPlaceDTO.getMaxDailyCnt()) {
			rMap.put("result", -1);
			rMap.put("message", "일일 최대 예약 시간을 초과한 예약은 불가합니다. 관리자에게 문의 바랍니다.");
			return rMap;
		}
		
		// 최대 예약 가능 기간 체크
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String bookDateString = bookListDTO.getBookDate();
		Date bookDate = dateFormat.parse(bookDateString);
		Date today = dateFormat.parse(dateFormat.format(new Date()));
		
		int diff = (int)( (bookDate.getTime() - today.getTime()) / (1000 * 60 * 60 * 24) );
		
		if(diff > bookPlaceDTO.getMaxAvailDay()) {
			rMap.put("result", -1);
			rMap.put("message", "예약 가능 기간을 벗어난 예약은 불가합니다. 관리자에게 문의 바랍니다.");
			return rMap;
		}
		
		bookListDTO.setBookSeq(
				Utils.getSeqAsc(bookListDTO.getStartIndex(), bookListDTO.getEndIndex())
		);
		LOGGER.debug(bookListDTO.toString());
		
		rMap.put("result", bookService.bookingPlaceOne(bookListDTO));
		return rMap;
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value = "/place/history/remove/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removeBookingPlace(
			@PathVariable("seqId") int seqId, @ModelAttribute BookListDTO bookListDTO,
			Authentication auth
			) throws Exception {
		LOGGER.debug(bookListDTO.toString());
		Map<String, Object> rMap = new HashMap<String, Object>();
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		bookListDTO.setSeqId(seqId);
		bookListDTO.setUserId(userDTO.getSeqId());
		
		rMap.put("result", bookService.deleteBookHistoryOne(bookListDTO));
		return rMap;
	}
	
}