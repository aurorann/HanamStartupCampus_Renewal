package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardDTO")
public class BoardDTO {
	
	private int seqId;
	private int writerId;
	private String writerIp;
	private String writerName;
	private String title;
	private String content;
	private int viewCount;
	private String createdAt;
	private String updatedAt;
	private String filePath;
	private String fileName;
	
	
	
	public BoardDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content,
			int viewCount, String createdAt, String updatedAt, String filePath, String fileName) {
		super();
		this.seqId = seqId;
		this.writerId = writerId;
		this.writerIp = writerIp;
		this.writerName = writerName;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.filePath = filePath;
		this.fileName = fileName;
	}
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "BoardDTO [seqId=" + seqId + ", writerId=" + writerId + ", writerIp=" + writerIp + ", writerName="
				+ writerName + ", title=" + title + ", content=" + content + ", viewCount=" + viewCount + ", createdAt="
				+ createdAt + ", updatedAt=" + updatedAt + ", filePath=" + filePath + ", fileName=" + fileName + "]";
	}

	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public String getWriterIp() {
		return writerIp;
	}
	public void setWriterIp(String writerIp) {
		this.writerIp = writerIp;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
