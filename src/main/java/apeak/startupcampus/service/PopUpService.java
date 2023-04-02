package apeak.startupcampus.service;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.PopUpDTO;

public interface PopUpService {

	public void updatePopUp(PopUpDTO dto) throws Exception;
	
	public void insertPopUp(PopUpDTO dto) throws Exception;

	public void deletePopUp(int num) throws Exception;

	public Map<String, Object> getPopUpList(int curPage);

	/**
	 * 팝업 하나의 정보를 가져온다.
	 * @param num 가져올 팝업번호
	 * @return 팝업정보
	 */
	public PopUpDTO getPopUpOne(int num);
	
	/**
	 * 현재 사용중인 팝업리스트를 가져온다.
	 * @return 팝업 리스트
	 */
	public List<PopUpDTO> usingPopUpList();
}
