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

import apeak.startupcampus.model.dto.BoardNoticeDTO;
import apeak.startupcampus.model.dto.BookCalendarDTO;
import apeak.startupcampus.model.dto.BookListDTO;
import apeak.startupcampus.model.dto.UserDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("noticeMapper")
public interface NoticeMapper {
	
	List<BoardNoticeDTO> selectNoticePostList(Map<String, Object> searchOption) throws Exception;
	List<BoardNoticeDTO> selectFixedNoticePostList(Map<String, Object> searchOption) throws Exception;
	List<BoardNoticeDTO> selectCommonNoticePostList(Map<String, Object> searchOption) throws Exception;
	Map<String, Object> selectNoticePostOne(int seqId) throws Exception;
	int updateNoticePostViewCount(int seqId) throws Exception;
	
	int selectNoticePostCount(Map<String, Object> searchOption) throws Exception;
	
	int insertNoticePostOne(BoardNoticeDTO noticeDTO) throws Exception;
	
	int updateNoticePostOne(BoardNoticeDTO noticeDTO) throws Exception;
	
	int deleteNoticePostOne(int seqId) throws Exception;

	/*List<UserDTO> selectBookList() throws Exception;
	
	List<BookListDTO> selectBookListMonthly(Map<String, Object> searchOption) throws Exception;
	
	List<BookCalendarDTO> selectBookCalendarMonthly(Map<String, Object> searchOption) throws Exception;
	
	int insertBookListOne(BookListDTO bookListDTO) throws Exception;*/
	
}
