package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("newsletterDTO")
public class NewsletterDTO extends BoardDTO {

	public NewsletterDTO(String newsletterUrl) {
		super();
		this.newsletterUrl = newsletterUrl;
	}

	public NewsletterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NewsletterDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}

	private String newsletterUrl;

	public String getNewsletterUrl() {
		return newsletterUrl;
	}

	public void setNewsletterUrl(String newsletterUrl) {
		this.newsletterUrl = newsletterUrl;
	}
	
	@Override
	public String toString() {
		return super.toString() + " / NewsletterDTO [newsletterUrl=" + newsletterUrl + "]";
	}
	
}
