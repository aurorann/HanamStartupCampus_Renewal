package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardPartnerNewsDTO")
public class BoardPartnerNewsDTO extends BoardGalleryDTO {

	public BoardPartnerNewsDTO(String viewApprove) {
		super();
		this.viewApprove = viewApprove;
	}
	
	public BoardPartnerNewsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardPartnerNewsDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}
	
	private String viewApprove;
	
	public String getViewApprove() {
		return viewApprove;
	}
	public void setViewApprove(String viewApprove) {
		this.viewApprove = viewApprove;
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardPartnerNewsDTO [viewApprove=" + viewApprove + "]";
	}
	
}
