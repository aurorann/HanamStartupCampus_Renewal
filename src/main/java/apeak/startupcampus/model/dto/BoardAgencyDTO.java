package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("boardAgencyDTO")
public class BoardAgencyDTO extends BoardDTO {
	
	public BoardAgencyDTO(String agencyName) {
		super();
		this.agencyName = agencyName;
	}

	public BoardAgencyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardAgencyDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}

	private String agencyName;

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

	@Override
	public String toString() {
		return super.toString() + " / BoardAgencyDTO [agencyName=" + agencyName + "]";
	}
	
}
