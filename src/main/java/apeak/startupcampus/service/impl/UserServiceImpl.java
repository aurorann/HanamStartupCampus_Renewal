package apeak.startupcampus.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dao.UserMapper;
import apeak.startupcampus.model.dto.AuthorityDTO;
import apeak.startupcampus.model.dto.LoginHistoryDTO;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.UserService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int addUserLoginHistory(LoginHistoryDTO loginHistoryDTO) throws Exception {
		return userMapper.insertUserLoginHistory(loginHistoryDTO);
	}
	
	public int renewUserLoginDate(int userId) throws Exception {
		return userMapper.updateUserLastLogin(userId);
	}
	
	public UserDTO getUserByAccountId(String accountId) throws Exception {
		return userMapper.selectUserByAccountId(accountId);
	}
	
	public LoginHistoryDTO isUserLoginSuccess(boolean isSuccess, HttpServletRequest req) {
		LoginHistoryDTO loginHistory = new LoginHistoryDTO();
		
		if(isSuccess == false) {
			loginHistory.setAccountId(req.getParameter("accountId"));
			loginHistory.setIpAddr(req.getRemoteAddr());
			loginHistory.setDevice(Utils.getUserDeviceInfo(req));
			loginHistory.setSuccess("fail");
		} else {
			UserDTO userDTO = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			loginHistory.setUserId(userDTO.getSeqId());
			loginHistory.setAccountId(userDTO.getAccountId());
			loginHistory.setIpAddr(req.getRemoteAddr());
			loginHistory.setDevice(Utils.getUserDeviceInfo(req));
			loginHistory.setSuccess("success");
		}
		
		return loginHistory;
	}
	
	public List<AuthorityDTO> getUserAuthorityByAccountId(int userId) throws Exception {
		return userMapper.selectUserAuthorityByAccountId(userId);
	}
	
	public int updatePasswordByOldPassword(String oldPassword, String newPassword, int seqId) throws Exception {
		Map<String, Object> pwMap = new HashMap<String, Object>();
		String storedPassword = userMapper.selectUserPasswordBySeqId(seqId);
		LOGGER.debug(storedPassword);
		if(passwordEncoder.matches(oldPassword, storedPassword)) {
			LOGGER.debug("OLD PW CHECK");
			pwMap.put("newPassword", passwordEncoder.encode(newPassword));
			pwMap.put("seqId", seqId);
			return userMapper.updatePasswordBySeqId(pwMap);
		} else {
			return 0;
		}
	}
	
}
