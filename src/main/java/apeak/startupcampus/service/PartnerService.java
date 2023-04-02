package apeak.startupcampus.service;

import java.util.Map;


public interface PartnerService  {
	
	// [함께하는 기업] 관련 서비스 메서드
	
	// 함께하는 기업 정보 (Activate PARTNER)
	public Map<String, Object> getPartnerInformationList() throws Exception;
	
	// 졸업 기업 정보 (Activate GRADUATE)
	public Map<String, Object> getGraduatePartnerInformationList() throws Exception;
	
	// # 함께하는 기업 정보 상세소개 조회	
	public Map<String, Object> getPartnerInformation(int seqId) throws Exception;
	
	public Map<String, Object> getPartnerInformationListForAdmin() throws Exception;
	
	public Map<String, Object> getPartnerInformationForAdmin(int seqId) throws Exception;
	
}
