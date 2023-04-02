package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardWebpageDTO")
public class BoardWebpageDTO extends BoardDTO {

	public BoardWebpageDTO(String level) {
		super();
		this.level = level;
	}
	
	public BoardWebpageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardWebpageDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}
	
	private String level;
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardWebpageDTO [level=" + level + "]";
	}
	
}
