package apeak.startupcampus.service;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.FamilySiteDTO;

public interface FamilySiteService {
	
	public List<FamilySiteDTO> getFamilySiteList() throws Exception;
	
	public Map<String, Object> addFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception;
	
	public Map<String, Object> editFamilySiteOne(FamilySiteDTO familySiteDTO) throws Exception;
	
	public Map<String, Object> removeFamilySiteOne(int seqId) throws Exception;
	
}
