package apeak.startupcampus.model.dao;

import java.util.List;

import apeak.startupcampus.model.dto.BoardDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("totalSearchMapper")
public interface TotalSearchMapper {

	public List<BoardDTO> selectTotalPostListByKeyword(String keyword) throws Exception;
	
}
