package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Alias("bookListDTO")
public class BookListDTO {
	private static final Logger LOGGER = LoggerFactory.getLogger(BookListDTO.class);
	
	public BookListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookListDTO(int seqId, int userId, String userName, int placeId, String description, String status,
			String bookDate, Integer h09, Integer h10, Integer h11, Integer h12, Integer h13, Integer h14, Integer h15,
			Integer h16, Integer h17, Integer startIndex, Integer endIndex, String createdAt, String updatedAt,
			int bookCount, UserDTO userDTO) {
		super();
		this.seqId = seqId;
		this.userId = userId;
		this.userName = userName;
		this.placeId = placeId;
		this.description = description;
		this.status = status;
		this.bookDate = bookDate;
		this.h09 = h09;
		this.h10 = h10;
		this.h11 = h11;
		this.h12 = h12;
		this.h13 = h13;
		this.h14 = h14;
		this.h15 = h15;
		this.h16 = h16;
		this.h17 = h17;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.bookCount = bookCount;
		this.userDTO = userDTO;
	}
	
	private int seqId;
	private int userId;
	private String userName;
	private int placeId;
	private String description;
	private String status;
	private String bookDate;
	private Integer h09;
	private Integer h10;
	private Integer h11;
	private Integer h12;
	private Integer h13;
	private Integer h14;
	private Integer h15;
	private Integer h16;
	private Integer h17;
	private Integer startIndex;
	private Integer endIndex;
	private String createdAt;
	private String updatedAt;
	
	// Associate
	private int bookCount;
	private UserDTO userDTO;
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public Integer getH09() {
		return h09;
	}
	public void setH09(Integer h09) {
		this.h09 = h09;
	}
	public Integer getH10() {
		return h10;
	}
	public void setH10(Integer h10) {
		this.h10 = h10;
	}
	public Integer getH11() {
		return h11;
	}
	public void setH11(Integer h11) {
		this.h11 = h11;
	}
	public Integer getH12() {
		return h12;
	}
	public void setH12(Integer h12) {
		this.h12 = h12;
	}
	public Integer getH13() {
		return h13;
	}
	public void setH13(Integer h13) {
		this.h13 = h13;
	}
	public Integer getH14() {
		return h14;
	}
	public void setH14(Integer h14) {
		this.h14 = h14;
	}
	public Integer getH15() {
		return h15;
	}
	public void setH15(Integer h15) {
		this.h15 = h15;
	}
	public Integer getH16() {
		return h16;
	}
	public void setH16(Integer h16) {
		this.h16 = h16;
	}
	public Integer getH17() {
		return h17;
	}
	public void setH17(Integer h17) {
		this.h17 = h17;
	}
	public Integer getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	public Integer getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	public UserDTO getUserDTO() {
		return userDTO;
	}
	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}
	
	public void setBookSeq(int[] seqArr) {
		for(int i = 0; i < seqArr.length; i++) {
			int timeIndex = seqArr[i];
			switch (timeIndex) {
				case 0:
					this.setH09(1);
					break;
				case 1:
					this.setH10(1);
					break;
				case 2:
					this.setH11(1);
					break;
				case 3:
					this.setH12(1);
					break;
				case 4:
					this.setH13(1);
					break;
				case 5:
					this.setH14(1);
					break;
				case 6:
					this.setH15(1);
					break;
				case 7:
					this.setH16(1);
					break;
				case 8:
					this.setH17(1);
					break;
			}
		}
	}
	@Override
	public String toString() {
		return "BookListDTO [seqId=" + seqId + ", userId=" + userId + ", userName=" + userName + ", placeId=" + placeId
				+ ", description=" + description + ", status=" + status + ", bookDate=" + bookDate + ", h09=" + h09
				+ ", h10=" + h10 + ", h11=" + h11 + ", h12=" + h12 + ", h13=" + h13 + ", h14=" + h14 + ", h15=" + h15
				+ ", h16=" + h16 + ", h17=" + h17 + ", startIndex=" + startIndex + ", endIndex=" + endIndex
				+ ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", bookCount=" + bookCount + ", userDTO="
				+ userDTO + "]";
	}
	
}
