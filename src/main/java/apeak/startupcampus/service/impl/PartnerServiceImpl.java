package apeak.startupcampus.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import apeak.startupcampus.model.dao.PartnerMapper;
import apeak.startupcampus.service.PartnerService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("partnerService")
public class PartnerServiceImpl extends EgovAbstractServiceImpl implements PartnerService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PartnerServiceImpl.class);
	
	@Resource(name="partnerMapper")
	private PartnerMapper partnerMapper;

	public Map<String, Object> getPartnerInformationList() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		resultMap.put("post", partnerMapper.selectPartnerInformationList());
		return resultMap;
	}
	
	public Map<String, Object> getGraduatePartnerInformationList() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		resultMap.put("post", partnerMapper.selectGraduatePartnerInformationList());
		return resultMap;
	}
	
	public Map<String, Object> getPartnerInformation(int seqId) throws Exception {
		return partnerMapper.selectPartnerInformationOne(seqId);
	}
	
	public Map<String, Object> getPartnerInformationListForAdmin() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "success");
		resultMap.put("post", partnerMapper.selectAdminPartnerInformationList());
		return resultMap;
	}

	public Map<String, Object> getPartnerInformationForAdmin(int seqId) throws Exception {
		return partnerMapper.selectAdminPartnerInformationOne(seqId);
	}
	

}
