package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("partnerDTO")
public class PartnerDTO {
	
	public PartnerDTO(int seqId, String accountPw, String businessName, String ceoName, String name,
			String homepage, String contract, String profileImage, MultipartFile profileImageFile, String introduce,
			String lastLogin, String activate, String roomName) {
		super();
		this.seqId = seqId;
		this.accountPw = accountPw;
		this.businessName = businessName;
		this.ceoName = ceoName;
		this.name = name;
		this.homepage = homepage;
		this.contract = contract;
		this.profileImage = profileImage;
		this.profileImageFile = profileImageFile;
		this.introduce = introduce;
		this.lastLogin = lastLogin;
		this.activate = activate;
		this.roomName = roomName;
	}
	
	public PartnerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private int seqId;
	private String accountPw;
	private String businessName;
	private String ceoName;
	private String name;
	private String homepage;
	private String contract;
	private String profileImage;
	private MultipartFile profileImageFile;
	private String introduce;
	private String lastLogin;
	private String activate;
	private String roomName;
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public String getAccountPw() {
		return accountPw;
	}
	public void setAccountPw(String accountPw) {
		this.accountPw = accountPw;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getCeoName() {
		return ceoName;
	}
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public MultipartFile getProfileImageFile() {
		return profileImageFile;
	}
	public void setProfileImageFile(MultipartFile profileImageFile) {
		this.profileImageFile = profileImageFile;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getActivate() {
		return activate;
	}
	public void setActivate(String activate) {
		this.activate = activate;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	@Override
	public String toString() {
		return "PartnerDTO [seqId=" + seqId + ", accountPw=" + accountPw
				+ ", businessName=" + businessName + ", CeoName=" + ceoName + ", name=" + name + ", homepage="
				+ homepage + ", contract=" + contract + ", profileImage=" + profileImage + ", profileImageFile=" + profileImageFile
				+ ", introduce=" + introduce + ", lastLogin=" + lastLogin + ", activate=" + activate + ", roomName="
				+ roomName + "]";
	}
	
}
