package apeak.startupcampus.model.dao;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.PartnerDTO;
import apeak.startupcampus.model.dto.UserDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("partnerMapper")
public interface PartnerMapper {

	public List<UserDTO> selectPartnerInformationList() throws Exception;
	public List<UserDTO> selectGraduatePartnerInformationList() throws Exception;
	public Map<String, Object> selectPartnerInformationOne(int seqId) throws Exception;	
	
	public List<UserDTO> selectAdminPartnerInformationList() throws Exception;
	public Map<String, Object> selectAdminPartnerInformationOne(int seqId) throws Exception;
	
	public int checkPartnerExist(int seqId) throws Exception;
	public int updatePartnerInformation(PartnerDTO partnerDTO) throws Exception;
}
