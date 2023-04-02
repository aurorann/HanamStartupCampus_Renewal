package apeak.startupcampus.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apeak.startupcampus.common.PagingUtil;
import apeak.startupcampus.model.dao.PopUpMapper;
import apeak.startupcampus.model.dto.PopUpDTO;
import apeak.startupcampus.service.PopUpService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("popUpService")
public class PopUpServiceImpl extends EgovAbstractServiceImpl implements PopUpService {
	
	@Resource(name="popUpMapper")
	private PopUpMapper popUpMapper;

	public void updatePopUp(PopUpDTO dto) throws Exception {
		popUpMapper.updatePopUp(dto);
	}
	
	public void insertPopUp(PopUpDTO dto) throws Exception {
		popUpMapper.insertPopUp(dto);
	}

	public void deletePopUp(int num) throws Exception{
		popUpMapper.deletePopUp(num);
	}

	public Map<String, Object> getPopUpList(int curPage) {
		
		if (curPage == 0) {
			curPage = 1;
		}

		Map<String, Object> paramMap = new HashMap<>();
		Map<String, Object> resultMap = new HashMap<>();
		
		int listCnt = popUpMapper.getPopUpListCnt(paramMap);// 총개수 구하기
		
		PagingUtil pager = new PagingUtil(listCnt, curPage);
		
		paramMap.put("startIndex", pager.getStartIndex());
		paramMap.put("pageSize", pager.getPageSize());
		
		List<PopUpDTO> list = popUpMapper.getPopUpList(paramMap);
		
		resultMap.put("list", list);
		resultMap.put("listCnt", listCnt);
		resultMap.put("pager", pager);
		
		
		return resultMap;
	}

	/**
	 * 팝업 하나의 정보를 가져온다.
	 * @param num 가져올 팝업번호
	 * @return 팝업정보
	 */
	public PopUpDTO getPopUpOne(int num) {
		return popUpMapper.getPopUpOne(num);
	}
	
	/**
	 * 현재 사용중인 팝업리스트를 가져온다.
	 * @return 팝업 리스트
	 */
	public List<PopUpDTO> usingPopUpList(){
		return popUpMapper.usingPopUpList();
	}
}
