package apeak.startupcampus.model.dao;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.PopUpDTO;


import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("popUpMapper")
public interface PopUpMapper {
	
	
	
	public void updatePopUp(PopUpDTO dto) throws Exception;
	
	public void insertPopUp(PopUpDTO dto) throws Exception;
	
	public void deletePopUp(int num);
	
	public int getPopUpListCnt(Map<String, Object> paramMap);

	public List<PopUpDTO> getPopUpList(Map<String, Object> paramMap);

	public PopUpDTO getPopUpOne(int num);

	public List<PopUpDTO> usingPopUpList();
	
	
}
