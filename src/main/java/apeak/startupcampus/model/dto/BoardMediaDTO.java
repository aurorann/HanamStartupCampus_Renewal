package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardMediaDTO")
public class BoardMediaDTO extends BoardDTO {

	public BoardMediaDTO(String youtubeId) {
		super();
		this.youtubeId = youtubeId;
	}

	public BoardMediaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardMediaDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}

	private String youtubeId;

	public String getYoutubeId() {
		return youtubeId;
	}

	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}
	
	@Override
	public String toString() {
		return super.toString() + " / BoardMediaDTO [youtubeId=" + youtubeId + "]";
	}
	
}
