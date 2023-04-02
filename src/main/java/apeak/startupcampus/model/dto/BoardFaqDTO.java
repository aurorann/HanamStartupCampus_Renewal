package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardFaqDTO")
public class BoardFaqDTO extends BoardDTO {

	public BoardFaqDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFaqDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardFaqDTO []";
	}
	
}
