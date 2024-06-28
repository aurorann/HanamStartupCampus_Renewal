/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package apeak.startupcampus.model.dao;

import java.util.List;
import java.util.Map;

import apeak.startupcampus.model.dto.BoardGalleryDTO;
import apeak.startupcampus.model.dto.BoardPartnerNewsDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("newsPartnerMapper")
public interface NewsPartnerMapper {
	List<BoardGalleryDTO> selectNewsPartnerPostList(Map<String, Object> searchOption) throws Exception;
	Map<String, Object> selectNewsPartnerPostOne(int seqId) throws Exception;
	int updateNewsPartnerPostViewCount(int seqId) throws Exception;
	
	int selectNewsPartnerPostCount(Map<String, Object> searchOption) throws Exception;
	
	int insertNewsPartnerPostOne(BoardPartnerNewsDTO boardPartnerNewsDTO) throws Exception;
	int updateNewsPartnerPostOne(BoardPartnerNewsDTO boardPartnerNewsDTO) throws Exception;
	int deleteNewsPartnerPostOne(int seqId) throws Exception;
	
	int insertNewsPartnerPostOneForPartner(BoardPartnerNewsDTO boardPartnerNewsDTO) throws Exception;
	int updateNewsPartnerPostOneForPartner(BoardPartnerNewsDTO boardPartnerNewsDTO) throws Exception;
	int deleteNewsPartnerPostOneForPartner(BoardPartnerNewsDTO boardPartnerNewsDTO) throws Exception;
	
}
