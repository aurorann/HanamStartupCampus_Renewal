package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("newsletterDTO")
public class NewsletterDTO extends BoardDTO {

	public NewsletterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NewsletterDTO(int seqId, int writerId, String writerIp, String writerName, String title, String content, int viewCount,
			String createdAt, String updatedAt,String fileName,String filePath) {
		super(seqId, writerId, writerIp, writerName, title, content, viewCount, createdAt, updatedAt,fileName,filePath);
		// TODO Auto-generated constructor stub
	}
	
	public NewsletterDTO(String representImage, MultipartFile representImageFile) {
		super();
		this.representImage = representImage;
		this.representImageFile = representImageFile;
	}
	private String representImage;
	private MultipartFile representImageFile;
	
	@Override
	public String toString() {
		return super.toString() + " / NewsletterDTO [representImage=" + representImage + ", representImageFile="
				+ representImageFile + "]";
	}
	public String getRepresentImage() {
		return representImage;
	}
	public void setRepresentImage(String representImage) {
		this.representImage = representImage;
	}
	public MultipartFile getRepresentImageFile() {
		return representImageFile;
	}
	public void setRepresentImageFile(MultipartFile representImageFile) {
		this.representImageFile = representImageFile;
	}
	
}
