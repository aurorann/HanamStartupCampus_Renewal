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

import apeak.startupcampus.model.dto.BoardMediaDTO;
import apeak.startupcampus.model.dto.BoardNoticeDTO;
import apeak.startupcampus.model.dto.NewsletterDTO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("newsletterMapper")
public interface NewsletterMapper {
	
	List<BoardNoticeDTO> selectNewsletterPostList(Map<String, Object> searchOption) throws Exception;
	Map<String, Object> selectNewsletterPostOne(int seqId) throws Exception;
	int updateNewsletterPostViewCount(int seqId) throws Exception;
	
	int selectNewsletterPostCount(Map<String, Object> searchOption) throws Exception;
	
	int insertNewsletterPostOne(NewsletterDTO newsletterDTO) throws Exception;
	
	int updateNewsletterPostOne(NewsletterDTO newsletterDTO) throws Exception;
	
	int deleteNewsletterPostOne(int seqId) throws Exception;
	
}
