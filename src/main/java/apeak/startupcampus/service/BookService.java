package apeak.startupcampus.service;

import java.util.Map;

import apeak.startupcampus.model.dto.BookListDTO;
import apeak.startupcampus.model.dto.BookPlaceDTO;

public interface BookService {
	
	public BookPlaceDTO getBookPlaceInfo(int seqId) throws Exception;
	
	public Map<String, Object> searchBookListMonthly(Map<String, Object> searchOption) throws Exception;
	
	public int getDailyBookCount(BookListDTO bookListDTO) throws Exception;
	
	public int bookingPlaceOne(BookListDTO bookListDTO);
	public int editBookMaxValueOne(BookPlaceDTO bookPlaceDTO);
	
	public int deleteBookHistoryOne(BookListDTO bookListDTO);
	public int deleteBookHistoryOneForAdmin(BookListDTO bookListDTO) throws Exception;
	
}