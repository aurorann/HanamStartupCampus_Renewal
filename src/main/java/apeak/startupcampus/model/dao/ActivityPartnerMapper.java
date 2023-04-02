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

import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardGalleryDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("activityPartnerMapper")
public interface ActivityPartnerMapper {
	List<BoardGalleryDTO> selectActivityPartnerPostList(Map<String, Object> searchOption) throws Exception;
	Map<String, Object> selectActivityPartnerPostOne(int seqId) throws Exception;
	int updateActivityPartnerPostViewCount(int seqId) throws Exception;
	
	int selectActivityPartnerPostCount(Map<String, Object> searchOption) throws Exception;
	
	int insertActivityPartnerPostOne(BoardDTO boardDTO) throws Exception;
	int updateActivityPartnerPostOne(BoardDTO boardDTO) throws Exception;
	int deleteActivityPartnerPostOne(int seqId) throws Exception;
	
	int insertActivityPartnerPostOneForPartner(BoardDTO boardDTO) throws Exception;
	int updateActivityPartnerPostOneForPartner(BoardDTO boardDTO) throws Exception;
	int deleteActivityPartnerPostOneForPartner(BoardDTO boardDTO) throws Exception;
	
}
