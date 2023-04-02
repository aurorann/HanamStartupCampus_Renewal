package apeak.startupcampus.model.dto;

import org.apache.ibatis.type.Alias;

@Alias("authorityDTO")
public class AuthorityDTO {
	
	public AuthorityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AuthorityDTO(int userId, String role) {
		super();
		this.userId = userId;
		this.role = role;
	}

	private int userId;
	private String role;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
