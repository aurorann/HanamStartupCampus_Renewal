package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardCommunityDTO")
public class BoardCommunityDTO extends BoardDTO {

	public BoardCommunityDTO(int commentCnt) {
		super();
		this.commentCnt = commentCnt;
	}
	
	public BoardCommunityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardCommunityDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}
	
	private int commentCnt;
	
	
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardFaqDTO [comment=" + commentCnt + "]";
	}
	
}
