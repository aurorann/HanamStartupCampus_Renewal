package apeak.startupcampus.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import apeak.startupcampus.model.dao.UserMapper;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.AdminService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("adminService")
public class AdminServiceImpl extends EgovAbstractServiceImpl implements AdminService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Resource(name="userMapper")
	private UserMapper userMapper;
	
	public List<UserDTO> selectUserList() throws Exception {
		LOGGER.info("ADMIN SERVICE HERE");
		LOGGER.info(userMapper.toString());
		try {
			List<UserDTO> newList = userMapper.selectUserListAll();
			return newList;
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			return new ArrayList<UserDTO>();
		}
	}

}
