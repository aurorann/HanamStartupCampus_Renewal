package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("bookCalendarDTO")
public class BookCalendarDTO {
	
	public BookCalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookCalendarDTO(int placeId, int bookCount, int bookTimeCount, String bookDate) {
		super();
		this.placeId = placeId;
		this.bookCount = bookCount;
		this.bookTimeCount = bookTimeCount;
		this.bookDate = bookDate;
	}
	
	private int placeId;
	private int bookCount;
	private int bookTimeCount;
	private String bookDate;
	
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	
	public int getBookTimeCount() {
		return bookTimeCount;
	}
	public void setBookTimeCount(int bookTimeCount) {
		this.bookTimeCount = bookTimeCount;
	}
}
