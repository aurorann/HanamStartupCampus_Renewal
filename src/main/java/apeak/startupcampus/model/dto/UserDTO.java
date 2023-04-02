package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("userDTO")
public class UserDTO {
	
	public UserDTO(int seqId, String accountId, String accountPw, String businessName, String name, String ceoName,
			String homepage, String profileImage, MultipartFile profileImageFile, String email, String contract,
			String introduce, String lastLogin, String activate, String roomName, String createdAt, String updatedAt) {
		super();
		this.seqId = seqId;
		this.accountId = accountId;
		this.accountPw = accountPw;
		this.businessName = businessName;
		this.name = name;
		this.ceoName = ceoName;
		this.homepage = homepage;
		this.profileImage = profileImage;
		this.profileImageFile = profileImageFile;
		this.email = email;
		this.contract = contract;
		this.introduce = introduce;
		this.lastLogin = lastLogin;
		this.activate = activate;
		this.roomName = roomName;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private int seqId;
	private String accountId; 
	private String accountPw; 
	private String businessName;
	private String name;
	private String ceoName;
	private String homepage;
	private String profileImage;
	private MultipartFile profileImageFile;
	private String email;
	private String contract;
	private String introduce;
	private String lastLogin;
	private String activate;
	private String roomName;
	private String createdAt;
	private String updatedAt;
	
	@Override
	public String toString() {
		return "UserDTO [seqId=" + seqId + ", accountId=" + accountId + ", accountPw=" + accountPw + ", businessName="
				+ businessName + ", name=" + name + ", ceoName=" + ceoName + ", homepage=" + homepage
				+ ", profileImage=" + profileImage + ", profileImageFile=" + profileImageFile + ", email=" + email
				+ ", contract=" + contract + ", introduce=" + introduce + ", lastLogin=" + lastLogin + ", activate=" + activate
				+ ", roomName=" + roomName + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCeoName() {
		return ceoName;
	}
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
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
