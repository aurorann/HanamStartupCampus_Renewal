package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("familySiteDTO")
public class FamilySiteDTO {
	
	public FamilySiteDTO(int seqId, String name, String pageAddress) {
		super();
		this.seqId = seqId;
		this.name = name;
		this.pageAddress = pageAddress;
	}
	
	public FamilySiteDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private int seqId;
	private String name;
	private String pageAddress;
	
	@Override
	public String toString() {
		return "FamilySiteDTO [seqId=" + seqId + ", name=" + name + ", pageAddress=" + pageAddress + "]";
	}
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPageAddress() {
		return pageAddress;
	}
	public void setPageAddress(String pageAddress) {
		this.pageAddress = pageAddress;
	}	
	
}