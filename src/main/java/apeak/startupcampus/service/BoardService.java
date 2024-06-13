package apeak.startupcampus.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import apeak.startupcampus.model.dto.BoardAgencyDTO;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardFaqDTO;
import apeak.startupcampus.model.dto.BoardGalleryDTO;
import apeak.startupcampus.model.dto.BoardMediaDTO;
import apeak.startupcampus.model.dto.BoardNoticeDTO;
import apeak.startupcampus.model.dto.BoardWebpageDTO;
import apeak.startupcampus.model.dto.NewsletterDTO;
import apeak.startupcampus.model.dto.PartnerDTO;


public interface BoardService  {
	
	public Map<String, Object> getPageContent(String level) throws Exception;
	public Map<String, Object> editPageContent(BoardWebpageDTO noticeDTO, HttpServletRequest request) throws Exception;
	
	// [공고] 관련 서비스 메서드
	// # 공고 게시글 리스트 조회
	public Map<String, Object> getNoticePostList(Map<String, Object> searchOption) throws Exception;
	
	// # 공고 게시글 조회	
	public Map<String, ?> getNoticePost(int seqId) throws Exception;
	
	// [바이오 정책 · 지원] 관련 서비스 메서드
	// # 바이오 정책 · 지원 게시글 리스트 조회
	public Map<String, Object> getAgencyPostList(Map<String, Object> searchOption) throws Exception;
	
	// # 바이오 정책 · 지원 게시글 조회
	public Map<String, ?> getAgencyPost(int seqId) throws Exception;

	// [FAQ] 관련 서비스 메서드
	// # FAQ 게시글 리스트 조회
	public Map<String, Object> getFaqPostList(Map<String, Object> searchOption) throws Exception;
	
	// # FAQ 게시글 조회	
	public Map<String, ?> getFaqPost(int seqId) throws Exception;
	
	// [캠퍼스 소개 영상] 관련 서비스 메서드
	// # 캠퍼스 소개 영상 게시글 리스트 조회
	public Map<String, Object> getMediaPostList(Map<String, Object> searchOption) throws Exception;
	
	// # 캠퍼스 소개 영상 게시글 조회	
	public Map<String, ?> getMediaPost(int seqId) throws Exception;
	
	// [아카이브] 관련 서비스 메서드
	// # 보도자료 게시글 리스트 조회
	public Map<String, Object> getPressPostList(Map<String, Object> searchOption) throws Exception;
	// # 보도자료 게시글 조회	
	public Map<String, Object> getPressPost(int seqId) throws Exception;
	
	// # 홍보자료 게시글 리스트 조회
	public Map<String, Object> getPromotionPostList(Map<String, Object> searchOption) throws Exception;
	// # 홍보자료 게시글 조회	
	public Map<String, Object> getPromotionPost(int seqId) throws Exception;
	
	// # 바이오 소식 게시글 리스트 조회
	public Map<String, Object> getBioInfoPostList(Map<String, Object> searchOption) throws Exception;
	// # 바이오 소식 게시글 조회	
	public Map<String, Object> getBioInfoPost(int seqId) throws Exception;
	
	// # 게시판 전체 검색
	public List<BoardDTO> getTotalPostList(String keyword) throws Exception;
	
	// [입주기업] 관련 서비스 메서드
	// # 입주기업 게시글 리스트 조회
	public Map<String, Object> getPartnerInformationList() throws Exception;
	// # 입주기업 정보 조회	
	public Map<String, Object> getPartnerInformation(int seqId) throws Exception;
	// # 입주기업 정보 수정
	public Map<String, Object> editPartnerInformation(PartnerDTO partnerDTO) throws Exception;
	
	// # 입주기업 소개 영상 게시글 리스트 조회
	public Map<String, Object> getMediaPartnerPostList(Map<String, Object> searchOption) throws Exception;
	// # 입주기업 소개 영상 게시글 조회	
	public Map<String, ?> getMediaPartnerPost(int seqId) throws Exception;
	
	// [기업 활동] 관련 서비스 메서드
	// # 기업 활동 게시글 리스트 조회
	public Map<String, Object> getActivityPartnerPostList(Map<String, Object> searchOption) throws Exception;
	// # 기업 활동 게시글 조회	
	public Map<String, Object> getActivityPartnerPost(int seqId) throws Exception;
	
	// # 뉴스레터 게시글 리스트 조회
	public Map<String, Object> getNewsletterPostList(Map<String, Object> searchOption) throws Exception;
	// # 뉴스레터 게시글 조회	
	public Map<String, ?> getNewsletterPost(int seqId) throws Exception;
	
	/*
	 * 게시글 작성 메서드
	 */
	public Map<String, Object> writeNoticePost(BoardNoticeDTO noticeDTO) throws Exception;
	public Map<String, Object> writeAgencyPost(BoardAgencyDTO agencyDTO) throws Exception;
	public Map<String, Object> writeFaqPost(BoardFaqDTO faqDTO) throws Exception;
	
	public Map<String, Object> writeMediaPost(BoardMediaDTO mediaDTO) throws Exception;
	
	public Map<String, Object> writePressPost(BoardGalleryDTO galleryDTO) throws Exception;
	public Map<String, Object> writePromotionPost(BoardGalleryDTO galleryDTO) throws Exception;
	public Map<String, Object> writeBioInfoPost(BoardGalleryDTO galleryDTO) throws Exception;
	
	public Map<String, Object> writeMediaPartnerPost(BoardMediaDTO mediaDTO) throws Exception;
	
	public Map<String, Object> writeNewsletterPost(NewsletterDTO newsletterDTO) throws Exception;
	
	/*
	 * 게시글 수정 메서드
	 */
	public Map<String, Object> editNoticePost(BoardNoticeDTO noticeDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> editAgencyPost(BoardAgencyDTO agencyDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> editFaqPost(BoardFaqDTO faqDTO, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> editMediaPost(BoardMediaDTO mediaDTO) throws Exception;
	
	public Map<String, Object> editPressPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> editPromotionPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> editBioInfoPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> editMediaPartnerPost(BoardMediaDTO mediaDTO, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> editNewsletterPost(NewsletterDTO newsletterDTO, HttpServletRequest request) throws Exception;
	
	/*
	 * 게시글 삭제 메서드
	 */
	public Map<String, Object> deleteNoticePost(int seqId, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteAgencyPost(int seqId, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteFaqPost(int seqId, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> deleteMediaPost(int seqId) throws Exception;
	
	public Map<String, Object> deletePressPost(int seqId, HttpServletRequest request) throws Exception;
	public Map<String, Object> deletePromotionPost(int seqId, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteBioInfoPost(int seqId, HttpServletRequest request) throws Exception;
	
	public String saveBoardImage(String boardType, MultipartHttpServletRequest multiReq) throws Exception;
	
	public Map<String, Object> getBoardSearchOption(Map<String, Object> searchOption) throws Exception;
	
	public Map<String, Object> getNoticePartnerPostList(Map<String, Object> searchOption) throws Exception;
	public Map<String, Object> getNoticePartnerPost(int seqId) throws Exception;
	public Map<String, Object> writeNoticePartnerPost(BoardDTO boardDTO) throws Exception;
	public Map<String, Object> editNoticePartnerPost(BoardDTO boardDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteNoticePartnerPost(int seqId) throws Exception;
	public Map<String, Object> deleteMediaPartnerPost(int seqId) throws Exception;
	
	public Map<String, Object> writeNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception;
	public Map<String, Object> editNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception;
	public Map<String, Object> deleteNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception;
	
	public Map<String, Object> writeActivityPartnerPost(BoardGalleryDTO galleryDTO) throws Exception;
	public Map<String, Object> editActivityPartnerPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteActivityPartnerPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> writeActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO) throws Exception;
	public Map<String, Object> editActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	public Map<String, Object> deleteActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> deleteNewsletterPost(int seqId) throws Exception;

	
	public String saveBoardFile(String boardType, MultipartHttpServletRequest multiReq);
	
	
	
}
