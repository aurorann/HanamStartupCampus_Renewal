package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardCommentDTO")
public class BoardCommentDTO {
	
	private int seqId;
	private int writerId;
	private String writerIp;
	private String writerName;
	private String content;
	private int postId;
	private int commentGroup;
	private String createdAt;
	private String updatedAt;

	
	
	
	public BoardCommentDTO(int seqId, int writerId, String writerIp, String writerName,String content,
			int postId, int commentGroup, String createdAt, String updatedAt) {
		super();
		this.seqId = seqId;
		this.writerId = writerId;
		this.writerIp = writerIp;
		this.writerName = writerName;
		this.content = content;
		this.postId = postId;
		this.commentGroup = commentGroup;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public BoardCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "BoardDTO [seqId=" + seqId + ", writerId=" + writerId + ", writerIp=" + writerIp + ", writerName="
				+ writerName + ", content=" + content + ", postId=" + postId + ", commentGroup=" + commentGroup + ", createdAt="
				+ createdAt + ", updatedAt=" + updatedAt + "]";
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getCommentGroup() {
		return commentGroup;
	}
	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
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

	
}
