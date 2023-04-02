package apeak.startupcampus.model.dao;

import java.util.List;

import apeak.startupcampus.model.dto.FamilySiteDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("familySiteMapper")
public interface FamilySiteMapper {

	public List<FamilySiteDTO> selectFamilySiteList() throws Exception;
	public int insertFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception;
	public int updateFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception;
	public int deleteFamilySiteOne(int seqId) throws Exception;
}
