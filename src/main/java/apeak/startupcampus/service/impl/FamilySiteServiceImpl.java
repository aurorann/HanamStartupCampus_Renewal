package apeak.startupcampus.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import apeak.startupcampus.model.dao.FamilySiteMapper;
import apeak.startupcampus.model.dto.FamilySiteDTO;
import apeak.startupcampus.service.FamilySiteService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("familySiteService")
public class FamilySiteServiceImpl extends EgovAbstractServiceImpl implements FamilySiteService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FamilySiteServiceImpl.class);
	
	@Resource(name="familySiteMapper")
	private FamilySiteMapper siteMapper;
	
	public List<FamilySiteDTO> getFamilySiteList() throws Exception {
		return siteMapper.selectFamilySiteList();
	}
	
	public Map<String, Object> addFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception {
		int insertCount = siteMapper.insertFamilySiteOne(familySiteDTO);
		return getSiteAddResultMap(insertCount, "패밀리사이트 등록");
	}
	
	public Map<String, Object> editFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception {
		int insertCount = siteMapper.updateFamilySiteOne(familySiteDTO);
		return getSiteEditResultMap(insertCount, "패밀리사이트 수정");
	}
	
	public Map<String, Object> removeFamilySiteOne(int seqId) throws Exception {
		int insertCount = siteMapper.deleteFamilySiteOne(seqId);
		return getSiteDeleteResultMap(insertCount, "패밀리사이트 삭제");
	}
	
	private Map<String, Object> getSiteAddResultMap(int insertCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", insertCount);
		if(insertCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "새 패밀리사이트를 등록했습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "새 패밀리사이트 등록이 불가합니다. 관리자에게 문의해주세요.");
		}
		
		return resultMap;
	}
	
	private Map<String, Object> getSiteEditResultMap(int updateCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", updateCount);
		if(updateCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "패밀리 사이트 목록이 수정됐습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "패밀리 사이트 목록 수정이 불가합니다. 관리자에게 문의해주세요.");
		}
		
		return resultMap;
	}
	
	private Map<String, Object> getSiteDeleteResultMap(int deleteCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", deleteCount);
		if(deleteCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "해당 사이트가 목록에서 삭제됐습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "해당 사이트 삭제가 불가합니다. 관리자에게 문의해주세요.");
		}
		
		return resultMap;
	}
	
}
