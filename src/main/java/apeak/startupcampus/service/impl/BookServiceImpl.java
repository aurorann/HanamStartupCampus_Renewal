package apeak.startupcampus.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import apeak.startupcampus.model.dao.BookMapper;
import apeak.startupcampus.model.dto.BookListDTO;
import apeak.startupcampus.model.dto.BookPlaceDTO;
import apeak.startupcampus.service.BookService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("bookService")
public class BookServiceImpl extends EgovAbstractServiceImpl implements BookService {
	private static final Logger LOGGER = LoggerFactory.getLogger(BookServiceImpl.class);
	
	@Resource(name="bookMapper")
	private BookMapper bookMapper;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	
	public BookPlaceDTO getBookPlaceInfo(int seqId) throws Exception {
		BookPlaceDTO bookPlaceInfo = bookMapper.selectBookPlaceInfo(seqId);
		LOGGER.debug("BOOK PLACE INFO: " + bookPlaceInfo.toString());
		return bookPlaceInfo;
	}
	
	public Map<String, Object> searchBookListMonthly(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> result = (Map<String, Object>) searchOption.get("result");
		LOGGER.info(result.toString());
		try {
			result.put("calendar", bookMapper.selectBookCalendarMonthly(searchOption));
			LOGGER.info(result.toString());
			result.put("bookList", bookMapper.selectBookListMonthly(searchOption));
			LOGGER.info(result.toString());
			return result;
		} catch(Exception e) {
			LOGGER.error(e.getMessage().toString());
			return null;
		}
	}
	
	public int getDailyBookCount(BookListDTO bookListDTO) throws Exception {
		return bookMapper.selectDailyBookCountByUserId(bookListDTO);
	}
	
	public int editBookMaxValueOne(BookPlaceDTO bookPlaceDTO) {
		try {
			return bookMapper.updateBookMaxValueOne(bookPlaceDTO);
		} catch(Exception error) {
			LOGGER.error(error.getMessage());
			error.printStackTrace();
			return 0;
		}
	}
	
	public int bookingPlaceOne(BookListDTO bookListDTO) {
		try {
			String bookDateString = bookListDTO.getBookDate();
			Date bookDate = dateFormat.parse(bookDateString);
			Date today = dateFormat.parse(dateFormat.format(new Date()));
			
			LOGGER.debug(bookDate.toString() + " " + today.toString());
			
			if(bookDate.compareTo(today) < 0) {
				return -1;
			} else {
				return bookMapper.insertBookListOne(bookListDTO);
			}
		} catch(Exception error) {
			LOGGER.error(error.getMessage());
			error.printStackTrace();
			return 0;
		}
	}
	
	public int deleteBookHistoryOne(BookListDTO bookListDTO) {
		try {
			String bookDateString = bookListDTO.getBookDate();
			Date bookDate = dateFormat.parse(bookDateString);
			Date today = dateFormat.parse(dateFormat.format(new Date()));
			
			LOGGER.debug(bookDate.toString() + " " + today.toString());
			
			if(bookDate.compareTo(today) < 0) {
				return -1;
			} else {
				return bookMapper.deleteBookHistoryOne(bookListDTO);
			}
		} catch(Exception error) {
			LOGGER.error(error.getMessage());
			error.printStackTrace();
			return 0;
		}
	}
	
	public int deleteBookHistoryOneForAdmin(BookListDTO bookListDTO) throws Exception {
		return bookMapper.deleteBookHistoryOneForAdmin(bookListDTO);
	}
	
}