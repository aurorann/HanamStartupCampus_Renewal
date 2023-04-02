package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("loginHistoryDTO")
public class LoginHistoryDTO {
	
	public LoginHistoryDTO(int seqId, int userId, String accountId, String ipAddr, String device, String success,
			String loginDatetime) {
		super();
		this.seqId = seqId;
		this.userId = userId;
		this.accountId = accountId;
		this.ipAddr = ipAddr;
		this.device = device;
		this.success = success;
		this.loginDatetime = loginDatetime;
	}
	
	public LoginHistoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private int seqId;
	private int userId;
	private String accountId;
	private String ipAddr;
	private String device;
	private String success;
	private String loginDatetime;
	
	public int getSeqId() {
		return seqId;
	}
	public void setSeqId(int seqId) {
		this.seqId = seqId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getLoginDatetime() {
		return loginDatetime;
	}
	public void setLoginDatetime(String loginDatetime) {
		this.loginDatetime = loginDatetime;
	}
		
}
