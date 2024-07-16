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

import apeak.startupcampus.model.dto.BoardCommentDTO;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardNoticeDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("communityCommentMapper")
public interface CommunityCommentMapper {
	
	List<BoardNoticeDTO> selectCommunityCommentPostList(int seqId) throws Exception;
	Map<String, Object> selectCommunityCommentPostOne(int seqId) throws Exception;
	
	int selectCommunityCommentPostCount(int seqId) throws Exception;
	
	int insertCommunityCommentPostOne(BoardCommentDTO commentDTO) throws Exception;
	int updateCommunityCommentPostOne(BoardCommentDTO commentDTO) throws Exception;
	int deleteCommunityCommentPostOne(int seqId) throws Exception;
	
	int insertCommunityCommentPostOneForPartner(BoardCommentDTO commentDTO) throws Exception;
	int updateCommunityCommentPostOneForPartner(BoardCommentDTO commentDTO) throws Exception;
	int deleteCommunityCommentPostOneForPartner(int seqId) throws Exception;
	
	int selectCommunityCommentNextSeq() throws Exception;
	
}
