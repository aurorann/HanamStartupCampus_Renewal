package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("bookPlaceDTO")
public class BookPlaceDTO {

	public BookPlaceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookPlaceDTO(int seqId, String title, String description, String displayImg, int maxDailyCnt,
			int maxAvailDay) {
		super();
		this.seqId = seqId;
		this.title = title;
		this.description = description;
		this.displayImg = displayImg;
		this.maxDailyCnt = maxDailyCnt;
		this.maxAvailDay = maxAvailDay;
	}
	
	private int seqId = 0;
	private String title;
	private String description;
	private String displayImg;
	private int maxDailyCnt;
	private int maxAvailDay;
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDisplayImg() {
		return displayImg;
	}
	public void setDisplayImg(String displayImg) {
		this.displayImg = displayImg;
	}
	public int getMaxDailyCnt() {
		return maxDailyCnt;
	}
	public void setMaxDailyCnt(int maxDailyCnt) {
		this.maxDailyCnt = maxDailyCnt;
	}
	public int getMaxAvailDay() {
		return maxAvailDay;
	}
	public void setMaxAvailDay(int maxAvailDay) {
		this.maxAvailDay = maxAvailDay;
	}
	
	@Override
	public String toString() {
		return "BookPlaceDTO [seqId=" + seqId + ", title=" + title + ", description=" + description + ", displayImg="
				+ displayImg + ", maxDailyCnt=" + maxDailyCnt + ", maxAvailDay=" + maxAvailDay + "]";
	}

}
