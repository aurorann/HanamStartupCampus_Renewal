package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("popUpDTO")
public class PopUpDTO {
	
	private int num;
	private String title;
	private String link;
	private String contents;
	private int contentsWidth;
	private int contentsHeight;
	private String displayYn;
	private String displayDate;
	private int displayPositionX;
	private int displayPositionY;
	private String createdAt;
	private String updatedAt;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getContentsWidth() {
		return contentsWidth;
	}
	public void setContentsWidth(int contentsWidth) {
		this.contentsWidth = contentsWidth;
	}
	public int getContentsHeight() {
		return contentsHeight;
	}
	public void setContentsHeight(int contentsHeight) {
		this.contentsHeight = contentsHeight;
	}
	public String getDisplayYn() {
		return displayYn;
	}
	public void setDisplayYn(String displayYn) {
		this.displayYn = displayYn;
	}
	public String getDisplayDate() {
		return displayDate;
	}
	public void setDisplayDate(String displayDate) {
		this.displayDate = displayDate;
	}
	public int getDisplayPositionX() {
		return displayPositionX;
	}
	public void setDisplayPositionX(int displayPositionX) {
		this.displayPositionX = displayPositionX;
	}
	public int getDisplayPositionY() {
		return displayPositionY;
	}
	public void setDisplayPositionY(int displayPositionY) {
		this.displayPositionY = displayPositionY;
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
	
	public PopUpDTO(int num, String title, String link, String contents, int contentsWidth, int contentsHeight,
			String displayYn, String displayDate, int displayPositionX, int displayPositionY, String createdAt,
			String updatedAt) {
		super();
		this.num = num;
		this.title = title;
		this.link = link;
		this.contents = contents;
		this.contentsWidth = contentsWidth;
		this.contentsHeight = contentsHeight;
		this.displayYn = displayYn;
		this.displayDate = displayDate;
		this.displayPositionX = displayPositionX;
		this.displayPositionY = displayPositionY;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public PopUpDTO() {
		super();
	}
	
	
}