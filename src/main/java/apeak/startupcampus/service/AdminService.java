package apeak.startupcampus.service;

import java.util.List;

import apeak.startupcampus.model.dto.UserDTO;

public interface AdminService {
	
	public List<UserDTO> selectUserList() throws Exception;
	
}
