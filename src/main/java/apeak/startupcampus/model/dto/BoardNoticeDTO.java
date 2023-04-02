package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardNoticeDTO")
public class BoardNoticeDTO extends BoardDTO {

	public BoardNoticeDTO(String level, String contractStartAt, String contractEndAt) {
		super();
		this.level = level;
		this.contractStartAt = contractStartAt;
		this.contractEndAt = contractEndAt;
	}
	
	public BoardNoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardNoticeDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}
	
	private String level;
	private String contractStartAt;
	private String contractEndAt;
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getContractStartAt() {
		return contractStartAt;
	}
	public void setContractStartAt(String contractStartAt) {
		this.contractStartAt = contractStartAt;
	}
	public String getContractEndAt() {
		return contractEndAt;
	}
	public void setContractEndAt(String contractEndAt) {
		this.contractEndAt = contractEndAt;
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardNoticeDTO [level=" + level + ", contractStartAt=" + contractStartAt
				+ ", contractEndAt=" + contractEndAt + "]";
	}
	
}
