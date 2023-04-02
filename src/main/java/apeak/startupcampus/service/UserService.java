package apeak.startupcampus.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import apeak.startupcampus.model.dto.AuthorityDTO;
import apeak.startupcampus.model.dto.LoginHistoryDTO;
import apeak.startupcampus.model.dto.UserDTO;

public interface UserService {
	
	public int addUserLoginHistory(LoginHistoryDTO loginHistoryDTO) throws Exception;
	
	public int renewUserLoginDate(int userId) throws Exception;
	
	public UserDTO getUserByAccountId(String accountId) throws Exception;
	
	public LoginHistoryDTO isUserLoginSuccess(boolean isSuccess, HttpServletRequest req);
	
	public List<AuthorityDTO> getUserAuthorityByAccountId(int userId) throws Exception;

	public int updatePasswordByOldPassword(String newPassword, String oldPassword, int seqId) throws Exception;
	
}
