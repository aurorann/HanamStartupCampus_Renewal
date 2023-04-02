package apeak.startupcampus.model.dao;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.AuthorityDTO;
import apeak.startupcampus.model.dto.LoginHistoryDTO;
import apeak.startupcampus.model.dto.UserDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMapper")
public interface UserMapper {

	public List<UserDTO> selectUserListAll() throws Exception;
	public UserDTO selectUserByAccountId(String accountId) throws Exception;
	
	// Login
	public int insertUserLoginHistory(LoginHistoryDTO loginHistoryDTO) throws Exception;
	public int updateUserLastLogin(int userId) throws Exception;
	public List<AuthorityDTO> selectUserAuthorityByAccountId(int userId) throws Exception;
	
	public String selectUserPasswordBySeqId(int seqId) throws Exception;
	public int updatePasswordBySeqId(Map<String, Object> pwMap) throws Exception;
	
}
