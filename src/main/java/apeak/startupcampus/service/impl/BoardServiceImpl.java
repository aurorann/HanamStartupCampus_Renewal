package apeak.startupcampus.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import apeak.startupcampus.common.PagingUtil;
import apeak.startupcampus.model.dao.ActivityPartnerMapper;
import apeak.startupcampus.model.dao.AgencyMapper;
import apeak.startupcampus.model.dao.BioInfoMapper;
import apeak.startupcampus.model.dao.FaqMapper;
import apeak.startupcampus.model.dao.MediaMapper;
import apeak.startupcampus.model.dao.MediaPartnerMapper;
import apeak.startupcampus.model.dao.NoticeMapper;
import apeak.startupcampus.model.dao.NoticePartnerMapper;
import apeak.startupcampus.model.dao.PartnerMapper;
import apeak.startupcampus.model.dao.PressMapper;
import apeak.startupcampus.model.dao.PromotionMapper;
import apeak.startupcampus.model.dao.TotalSearchMapper;
import apeak.startupcampus.model.dao.WebpageMapper;
import apeak.startupcampus.model.dto.BoardAgencyDTO;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardFaqDTO;
import apeak.startupcampus.model.dto.BoardGalleryDTO;
import apeak.startupcampus.model.dto.BoardMediaDTO;
import apeak.startupcampus.model.dto.BoardNoticeDTO;
import apeak.startupcampus.model.dto.BoardWebpageDTO;
import apeak.startupcampus.model.dto.PartnerDTO;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.BoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	ServletContext servlet;
	
	@Resource(name = "webpageMapper")
	private WebpageMapper webpageMapper;

	@Resource(name = "noticeMapper")
	private NoticeMapper noticeMapper;

	@Resource(name = "agencyMapper")
	private AgencyMapper agencyMapper;

	@Resource(name = "faqMapper")
	private FaqMapper faqMapper;

	@Resource(name = "mediaMapper")
	private MediaMapper mediaMapper;

	@Resource(name = "pressMapper")
	private PressMapper pressMapper;

	@Resource(name = "promotionMapper")
	private PromotionMapper promotionMapper;

	@Resource(name = "bioInfoMapper")
	private BioInfoMapper bioInfoMapper;

	@Resource(name = "totalSearchMapper")
	private TotalSearchMapper totalMapper;

	@Resource(name = "partnerMapper")
	private PartnerMapper partnerMapper;

	@Resource(name = "noticePartnerMapper")
	private NoticePartnerMapper noticePartnerMapper;

	@Resource(name = "mediaPartnerMapper")
	private MediaPartnerMapper mediaPartnerMapper;
	
	@Resource(name = "activityPartnerMapper")
	private ActivityPartnerMapper activityPartnerMapper;

	// 파일 세이브 경로 (globals.properties)
	@Value("#{globals['path.root']}")
	private String ROOT_PATH;

	@Value("#{globals['path.board']}")
	private String BOARD_PATH;
	@Value("#{globals['url.board']}")
	private String BOARD_URL;

	@Value("#{globals['path.media']}")
	private String MEDIA_PATH;
	@Value("#{globals['url.media']}")
	private String MEDIA_URL;

	@Value("#{globals['path.gallery']}")
	private String GALLERY_PATH;
	@Value("#{globals['url.gallery']}")
	private String GALLERY_URL;

	@Value("#{globals['path.galleryRepresent']}")
	private String GALLERY_REPRESENT_PATH;
	@Value("#{globals['url.galleryRepresent']}")
	private String GALLERY_REPRESENT_URL;

	@Value("#{globals['path.noticePartner']}")
	private String NOTICE_PARTNER_PATH;
	@Value("#{globals['url.noticePartner']}")
	private String NOTICE_PARTNER_URL;

	@Value("#{globals['path.partner']}")
	private String PARTNER_PATH;
	@Value("#{globals['url.partner']}")
	private String PARTNER_URL;
	
	@Value("#{globals['path.webpage']}")
	private String WEBPAGE_PATH;
	@Value("#{globals['url.webpage']}")
	private String WEBPAGE_URL;

	@Value("#{globals['path.partnerRepresent']}")
	private String PARTNER_REPRESENT_PATH;
	@Value("#{globals['url.partnerRepresent']}")
	private String PARTNER_REPRESENT_URL;
	
	// [일부 웹페이지 수정 로직]
	public Map<String, Object> getPageContent(String level) throws Exception {
		Map<String, Object> resultMap = webpageMapper.selectPageContent(level);
		if (resultMap != null) {
			return resultMap;
		} else {
			resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}
	
	public Map<String, Object> editPageContent(BoardWebpageDTO webpageDTO, HttpServletRequest request) throws Exception {
		setWriterInfo(webpageDTO);
		
		int insertCount = webpageMapper.updatePageContent(webpageDTO);
		return getBoardEditResultMap(insertCount, "웹페이지 컨텐츠");
	}

	// [공고] 관련 서비스 메서드
	// # 공고 게시글 리스트 조회
	public Map<String, Object> getNoticePostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("Fixedpost", noticeMapper.selectFixedNoticePostList(searchOption));
		resultMap.put("post", noticeMapper.selectNoticePostList(searchOption));

		return resultMap;
	}

	// # 공고 게시글 조회
	public Map<String, ?> getNoticePost(int seqId) throws Exception {
		int rowCount = noticeMapper.updateNoticePostViewCount(seqId);
		if (rowCount > 0) {
			return noticeMapper.selectNoticePostOne(seqId);
		} else {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// [바이오 정책 · 지원] 관련 서비스 메서드
	// # 바이오 정책 · 지원 게시글 리스트 조회
	public Map<String, Object> getAgencyPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", agencyMapper.selectAgencyPostList(searchOption));

		return resultMap;
	}

	// # 바이오 정책 · 지원 게시글 조회
	public Map<String, ?> getAgencyPost(int seqId) throws Exception {
		int rowCount = agencyMapper.updateAgencyPostViewCount(seqId);
		if (rowCount > 0) {
			return agencyMapper.selectAgencyPostOne(seqId);
		} else {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// [FAQ] 관련 서비스 메서드
	// # FAQ 게시글 리스트 조회
	public Map<String, Object> getFaqPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", faqMapper.selectFaqPostList(searchOption));

		return resultMap;
	}

	// # FAQ 게시글 조회
	public Map<String, ?> getFaqPost(int seqId) throws Exception {
		int rowCount = faqMapper.updateFaqPostViewCount(seqId);
		if (rowCount > 0) {
			return faqMapper.selectFaqPostOne(seqId);
		} else {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// [캠퍼스 소개 영상] 관련 서비스 메서드
	// # 캠퍼스 소개 영상 게시글 리스트 조회
	public Map<String, Object> getMediaPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", mediaMapper.selectMediaPostList(searchOption));

		return resultMap;
	}

	// # 캠퍼스 소개 영상 게시글 조회
	public Map<String, ?> getMediaPost(int seqId) throws Exception {
		int rowCount = mediaMapper.updateMediaPostViewCount(seqId);
		if (rowCount > 0) {
			return mediaMapper.selectMediaPostOne(seqId);
		} else {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// [아카이브] 관련 서비스 메서드
	// # 보도자료 게시글 리스트 조회
	public Map<String, Object> getPressPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", pressMapper.selectPressPostList(searchOption));

		return resultMap;
	}

	// # 보도자료 게시글 조회
	public Map<String, Object> getPressPost(int seqId) throws Exception {
		int rowCount = pressMapper.updatePressPostViewCount(seqId);
		if (rowCount > 0) {
			return pressMapper.selectPressPostOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// # 홍보자료 게시글 리스트 조회
	public Map<String, Object> getPromotionPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", promotionMapper.selectPromotionPostList(searchOption));

		return resultMap;
	}

	// # 홍보자료 게시글 조회
	public Map<String, Object> getPromotionPost(int seqId) throws Exception {
		int rowCount = promotionMapper.updatePromotionPostViewCount(seqId);
		if (rowCount > 0) {
			return promotionMapper.selectPromotionPostOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// # 바이오 소식 게시글 리스트 조회
	public Map<String, Object> getBioInfoPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", bioInfoMapper.selectBioInfoPostList(searchOption));

		return resultMap;
	}

	// # 바이오 소식 게시글 조회
	public Map<String, Object> getBioInfoPost(int seqId) throws Exception {
		int rowCount = bioInfoMapper.updateBioInfoPostViewCount(seqId);
		if (rowCount > 0) {
			return bioInfoMapper.selectBioInfoPostOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// # 게시판 전체 검색
	public List<BoardDTO> getTotalPostList(String keyword) throws Exception {
		LOGGER.debug(keyword);
		return totalMapper.selectTotalPostListByKeyword(keyword);
	};

	// [입주기업] 관련 서비스 메서드
	// # 입주기업 알림공간 게시글 리스트 조회
	public Map<String, Object> getNoticePartnerPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", noticePartnerMapper.selectNoticePartnerPostList(searchOption));

		return resultMap;
	}

	// # 입주기업 알림공간 게시글 조회
	public Map<String, Object> getNoticePartnerPost(int seqId) throws Exception {
		int rowCount = noticePartnerMapper.updateNoticePartnerPostViewCount(seqId);
		if (rowCount > 0) {
			return noticePartnerMapper.selectNoticePartnerPostOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// # 입주기업 정보 리스트 조회
	public Map<String, Object> getPartnerInformationList() throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("post", partnerMapper.selectAdminPartnerInformationList());

		return resultMap;
	}

	// # 입주기업 조회
	public Map<String, Object> getPartnerInformation(int seqId) throws Exception {
		int rowCount = partnerMapper.checkPartnerExist(seqId);
		if (rowCount > 0) {
			return partnerMapper.selectAdminPartnerInformationOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	// [입주기업 소개 영상] 관련 서비스 메서드
	// # 입주기업 소개 영상 게시글 리스트 조회
	public Map<String, Object> getMediaPartnerPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", mediaPartnerMapper.selectMediaPostList(searchOption));

		return resultMap;
	}

	// # 입주기업 소개 영상 게시글 조회
	public Map<String, ?> getMediaPartnerPost(int seqId) throws Exception {
		int rowCount = mediaPartnerMapper.updateMediaPostViewCount(seqId);
		if (rowCount > 0) {
			return mediaPartnerMapper.selectMediaPostOne(seqId);
		} else {
			Map<String, String> resultMap = new HashMap<String, String>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}
	
	// # 입주기업 활동 게시글 리스트 조회
	public Map<String, Object> getActivityPartnerPostList(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("result", "success");
		resultMap.put("searchOption", getBoardSearchOption(searchOption));

		LOGGER.debug(searchOption.toString());

		resultMap.put("post", activityPartnerMapper.selectActivityPartnerPostList(searchOption));

		return resultMap;
	}

	// # 입주기업 활동 게시글 조회
	public Map<String, Object> getActivityPartnerPost(int seqId) throws Exception {
		int rowCount = activityPartnerMapper.updateActivityPartnerPostViewCount(seqId);
		if (rowCount > 0) {
			return activityPartnerMapper.selectActivityPartnerPostOne(seqId);
		} else {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("error", "POST_NOT_FOUND");
			return resultMap;
		}
	}

	/*
	 * 게시글 작성 메서드 category: notice, agency, faq
	 */
	public Map<String, Object> writeNoticePost(BoardNoticeDTO noticeDTO) throws Exception {
		setWriterInfo(noticeDTO);
		int insertCount = noticeMapper.insertNoticePostOne(noticeDTO);
		return getBoardWriteResultMap(insertCount, "공고");
	}

	public Map<String, Object> writeAgencyPost(BoardAgencyDTO agencyDTO) throws Exception {
		setWriterInfo(agencyDTO);
		int insertCount = agencyMapper.insertAgencyPostOne(agencyDTO);
		return getBoardWriteResultMap(insertCount, "바이오 정책 · 지원");
	}

	public Map<String, Object> writeFaqPost(BoardFaqDTO faqDTO) throws Exception {
		setWriterInfo(faqDTO);
		int insertCount = faqMapper.insertFaqPostOne(faqDTO);
		return getBoardWriteResultMap(insertCount, "자주 묻는 질문");
	}

	public Map<String, Object> writeMediaPost(BoardMediaDTO mediaDTO) throws Exception {
		setWriterInfo(mediaDTO);
		int insertCount = mediaMapper.insertMediaPostOne(mediaDTO);
		return getBoardWriteResultMap(insertCount, "소개 영상");
	}

	public Map<String, Object> writePressPost(BoardGalleryDTO galleryDTO) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "press");
		galleryDTO.setRepresentImage(fileName);

		int insertCount = pressMapper.insertPressPostOne(galleryDTO);
		return getBoardWriteResultMap(insertCount, "보도자료");
	}

	public Map<String, Object> writePromotionPost(BoardGalleryDTO galleryDTO) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "promotion");
		galleryDTO.setRepresentImage(fileName);

		int insertCount = promotionMapper.insertPromotionPostOne(galleryDTO);
		return getBoardWriteResultMap(insertCount, "홍보자료");
	}

	public Map<String, Object> writeBioInfoPost(BoardGalleryDTO galleryDTO) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "bio-info");
		galleryDTO.setRepresentImage(fileName);

		int insertCount = bioInfoMapper.insertBioInfoPostOne(galleryDTO);
		return getBoardWriteResultMap(insertCount, "바이오 소식");
	}

	public Map<String, Object> writeNoticePartnerPost(BoardDTO boardDTO) throws Exception {
		setWriterInfo(boardDTO);
		int insertCount = noticePartnerMapper.insertNoticePartnerPostOne(boardDTO);
		return getBoardWriteResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> writeNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception {
		setWriterInfo(boardDTO);
		int insertCount = noticePartnerMapper.insertNoticePartnerPostOneForPartner(boardDTO);
		return getBoardWriteResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> writeMediaPartnerPost(BoardMediaDTO mediaDTO) throws Exception {
		setWriterInfo(mediaDTO);
		int insertCount = mediaPartnerMapper.insertMediaPostOne(mediaDTO);
		return getBoardWriteResultMap(insertCount, "소개 영상");
	}
	
	public Map<String, Object> writeActivityPartnerPost(BoardGalleryDTO galleryDTO) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		String fileName = saveNewMultipartImage(newImage, PARTNER_PATH + File.separator + "partner-activity");
		galleryDTO.setRepresentImage(fileName);

		int insertCount = activityPartnerMapper.insertActivityPartnerPostOne(galleryDTO);
		return getBoardWriteResultMap(insertCount, "기업 활동");
	}
	
	public Map<String, Object> writeActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		String fileName = saveNewMultipartImage(newImage, PARTNER_PATH + File.separator + "partner-activity");
		galleryDTO.setRepresentImage(fileName);

		int insertCount = activityPartnerMapper.insertActivityPartnerPostOneForPartner(galleryDTO);
		return getBoardWriteResultMap(insertCount, "기업 활동");
	}

	/*
	 * 게시글 수정 메서드 category: notice, agency, faq
	 */
	public Map<String, Object> editNoticePost(BoardNoticeDTO noticeDTO, HttpServletRequest request) throws Exception {
		setWriterInfo(noticeDTO);
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = noticeMapper.selectNoticePostOne(noticeDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!noticeDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = noticeMapper.updateNoticePostOne(noticeDTO);
		return getBoardEditResultMap(insertCount, "공고");
	}

	public Map<String, Object> editAgencyPost(BoardAgencyDTO agencyDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(agencyDTO);
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = agencyMapper.selectAgencyPostOne(agencyDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!agencyDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = agencyMapper.updateAgencyPostOne(agencyDTO);
		return getBoardEditResultMap(insertCount, "바이오 정책 · 지원");
	}

	public Map<String, Object> editFaqPost(BoardFaqDTO faqDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(faqDTO);
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = faqMapper.selectFaqPostOne(faqDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!faqDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = faqMapper.updateFaqPostOne(faqDTO);
		return getBoardEditResultMap(insertCount, "자주 묻는 질문");
	}

	public Map<String, Object> editMediaPost(BoardMediaDTO mediaDTO) throws Exception {
		setWriterInfo(mediaDTO);
		int insertCount = mediaMapper.updateMediaPostOne(mediaDTO);
		return getBoardEditResultMap(insertCount, "소개 영상");
	}

	public Map<String, Object> editPressPost(BoardGalleryDTO galleryDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "press");
			galleryDTO.setRepresentImage(fileName);
		}

		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = pressMapper.selectPressPostOne(galleryDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!galleryDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = pressMapper.updatePressPostOne(galleryDTO);
		return getBoardEditResultMap(insertCount, "보도자료");
	}

	public Map<String, Object> editPromotionPost(BoardGalleryDTO galleryDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "promotion");
			galleryDTO.setRepresentImage(fileName);
		}
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = promotionMapper.selectPromotionPostOne(galleryDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!galleryDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}

		int insertCount = promotionMapper.updatePromotionPostOne(galleryDTO);
		return getBoardEditResultMap(insertCount, "홍보자료");
	}

	public Map<String, Object> editBioInfoPost(BoardGalleryDTO galleryDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, GALLERY_REPRESENT_PATH + File.separator + "bio-info");
			galleryDTO.setRepresentImage(fileName);
		}
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = bioInfoMapper.selectBioInfoPostOne(galleryDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!galleryDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}

		int insertCount = bioInfoMapper.updateBioInfoPostOne(galleryDTO);
		return getBoardEditResultMap(insertCount, "바이오 소식");
	}

	public Map<String, Object> editNoticePartnerPost(BoardDTO boardDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(boardDTO);
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = noticePartnerMapper.selectNoticePartnerPostOne(boardDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!boardDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = noticePartnerMapper.updateNoticePartnerPostOne(boardDTO);
		return getBoardEditResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> editNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception {
		setWriterInfo(boardDTO);
		int insertCount = noticePartnerMapper.updateNoticePartnerPostOneForPartner(boardDTO);
		return getBoardEditResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> editPartnerInformation(PartnerDTO partnerDTO) throws Exception {
		MultipartFile newImage = partnerDTO.getProfileImageFile();
		LOGGER.debug(partnerDTO.toString());
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, PARTNER_REPRESENT_PATH);
			partnerDTO.setProfileImage(fileName);
			LOGGER.debug(partnerDTO.toString());
		}
		if (partnerDTO.getAccountPw() != null && !partnerDTO.getAccountPw().equals("")) {
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			partnerDTO.setAccountPw(passwordEncoder.encode(partnerDTO.getAccountPw()));
			LOGGER.debug(partnerDTO.toString());
		}

		int insertCount = partnerMapper.updatePartnerInformation(partnerDTO);
		return getPartnerInformationEditResultMap(insertCount, "입주기업 정보");
	}

	public Map<String, Object> editMediaPartnerPost(BoardMediaDTO mediaDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(mediaDTO);
		
		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = mediaPartnerMapper.selectMediaPostOne(mediaDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!mediaDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = mediaPartnerMapper.updateMediaPostOne(mediaDTO);
		return getBoardEditResultMap(insertCount, "소개 영상");
	}
	
	public Map<String, Object> editActivityPartnerPost(BoardGalleryDTO galleryDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, PARTNER_PATH + File.separator + "partner-activity");
			galleryDTO.setRepresentImage(fileName);
		}

		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = activityPartnerMapper.selectActivityPartnerPostOne(galleryDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!galleryDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = activityPartnerMapper.updateActivityPartnerPostOne(galleryDTO);
		return getBoardEditResultMap(insertCount, "기업 활동");
	}
	
	public Map<String, Object> editActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO,HttpServletRequest request) throws Exception {
		setWriterInfo(galleryDTO);

		MultipartFile newImage = galleryDTO.getRepresentImageFile();
		if (newImage != null && !newImage.isEmpty()) {
			String fileName = saveNewMultipartImage(newImage, PARTNER_PATH + File.separator + "partner-activity");
			galleryDTO.setRepresentImage(fileName);
		}

		//첨부파일이 변경되었는지 확인하고 변경되었다면 기존 파일은 삭제한다.
		Map<String, Object> oldPost = activityPartnerMapper.selectActivityPartnerPostOne(galleryDTO.getSeqId());
		String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
		if(!galleryDTO.getFilePath().equals(oldPaths)) {
			String path = request.getSession().getServletContext().getRealPath("/");
			
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		int insertCount = activityPartnerMapper.updateActivityPartnerPostOneForPartner(galleryDTO);
		return getBoardEditResultMap(insertCount, "기업 활동");
	}

	/*
	 * 게시글 삭제 메서드
	 */
	public Map<String, Object> deleteNoticePost(int seqId,HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = noticeMapper.selectNoticePostOne(seqId);
		
		int insertCount = noticeMapper.deleteNoticePostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		
		return getBoardDeleteResultMap(insertCount, "공고");
	}

	public Map<String, Object> deleteAgencyPost(int seqId,HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = agencyMapper.selectAgencyPostOne(seqId);
		
		int insertCount = agencyMapper.deleteAgencyPostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
				
		return getBoardDeleteResultMap(insertCount, "바이오 정책 · 지원");
	}

	public Map<String, Object> deleteFaqPost(int seqId,HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = faqMapper.selectFaqPostOne(seqId);
		
		int insertCount = faqMapper.deleteFaqPostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
				
		return getBoardDeleteResultMap(insertCount, "자주 묻는 질문");
	}

	public Map<String, Object> deleteMediaPost(int seqId) throws Exception {
		int insertCount = mediaMapper.deleteMediaPostOne(seqId);
		return getBoardDeleteResultMap(insertCount, "소개 영상");
	}

	public Map<String, Object> deletePressPost(int seqId, HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = pressMapper.selectPressPostOne(seqId);
		
		int insertCount = pressMapper.deletePressPostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		return getBoardDeleteResultMap(insertCount, "보도자료");
	}

	public Map<String, Object> deletePromotionPost(int seqId, HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = promotionMapper.selectPromotionPostOne(seqId);
		
		int insertCount = promotionMapper.deletePromotionPostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		return getBoardDeleteResultMap(insertCount, "홍보자료");
	}

	public Map<String, Object> deleteBioInfoPost(int seqId, HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = bioInfoMapper.selectBioInfoPostOne(seqId);
		
		int insertCount = bioInfoMapper.deleteBioInfoPostOne(seqId);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		return getBoardDeleteResultMap(insertCount, "바이오 소식");
	}

	public Map<String, Object> deleteNoticePartnerPost(int seqId) throws Exception {
		int insertCount = noticePartnerMapper.deleteNoticePartnerPostOne(seqId);
		return getBoardDeleteResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> deleteNoticePartnerPostForPartner(BoardDTO boardDTO) throws Exception {
		int insertCount = noticePartnerMapper.deleteNoticePartnerPostOneForPartner(boardDTO);
		return getBoardDeleteResultMap(insertCount, "입주기업 알림공간");
	}

	public Map<String, Object> deleteMediaPartnerPost(int seqId) throws Exception {
		int insertCount = mediaPartnerMapper.deleteMediaPostOne(seqId);
		return getBoardDeleteResultMap(insertCount, "소개 영상");
	}
	
	public Map<String, Object> deleteActivityPartnerPost(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception {
		Map<String, Object> oldPost = activityPartnerMapper.selectActivityPartnerPostOne(galleryDTO.getSeqId());
		
		int insertCount = activityPartnerMapper.deleteActivityPartnerPostOne(galleryDTO.getSeqId());
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		return getBoardDeleteResultMap(insertCount, "기업 활동");
	}
	
	public Map<String, Object> deleteActivityPartnerPostForPartner(BoardGalleryDTO galleryDTO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> oldPost = activityPartnerMapper.selectActivityPartnerPostOne(galleryDTO.getSeqId());
		
		int insertCount = activityPartnerMapper.deleteActivityPartnerPostOneForPartner(galleryDTO);
		
		if(insertCount>0) {
			
			String oldPaths = String.valueOf(oldPost.get("FILE_PATH"));
		
			String path = request.getSession().getServletContext().getRealPath("/");
				
			String oldList[] = oldPaths.split(":");
			
			for(String oldPath:oldList) {			
				File oldFile = new File(path+File.separator+oldPath);
				oldFile.delete();
			}
		}
		
		return getBoardDeleteResultMap(insertCount, "기업 활동");
	}

	/*
	 * 작성 관련 메서드
	 */
	public String saveBoardImage(String boardType, MultipartHttpServletRequest multiReq) throws Exception {
		LOGGER.debug(boardType + " upload arrive");
		String rootPath = null;
		if (ROOT_PATH == null) {
			rootPath = multiReq.getSession().getServletContext().getRealPath("");
		} else {
			rootPath = ROOT_PATH;
		}

		String savePathContext = null;
		String dirUrl = null;

		if (boardType.equals("notice") || boardType.equals("agency") || boardType.equals("faq")) {
			savePathContext = BOARD_PATH;
			dirUrl = BOARD_URL;
		} else if (boardType.equals("press") || boardType.equals("promotion") || boardType.equals("bio-info")) {
			savePathContext = GALLERY_PATH;
			dirUrl = GALLERY_URL;
		} else if (boardType.equals("media")) {
			savePathContext = MEDIA_PATH;
			dirUrl = MEDIA_URL;
		} else if (boardType.equals("partner") || boardType.equals("partner-notice")
				|| boardType.equals("partner-media") || boardType.equals("partner-activity")) {
			savePathContext = PARTNER_PATH;
			dirUrl = PARTNER_URL;
		} else if (boardType.equals("web-content")) {
			savePathContext = WEBPAGE_PATH;
			dirUrl = WEBPAGE_URL;
		}

		MultipartFile pFile = multiReq.getFile("upload");

		// 이미지 저장 폴더
		String savePath = rootPath + File.separator + savePathContext + File.separator + boardType;
		String uuid = UUID.randomUUID().toString();
		String format = FilenameUtils.getExtension(pFile.getOriginalFilename());
		String rJsonStr = "";

		if (!(format.equals("png") || format.equals("jpg") || format.equals("gif"))) {
			rJsonStr = "{\"uploaded\":0,\"error\":{\"message\":\"이미지는 10MB 이하의 jpg, png, gif 파일만 업로드 가능합니다.\"}}";
			return rJsonStr;
		}
		String saveFileName = uuid + "." + format;

		Map<String, Object> rMap = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();

		LOGGER.debug("SAVE PATH : " + savePath + saveFileName);

		try {
			File saveDir = new File(savePath, saveFileName);

			String url = servlet.getContextPath() + "/" + dirUrl + "/" + boardType + "/" + saveFileName;
			/*
			 * if(boardType.equals("press") || boardType.equals("promotion")) { url =
			 * multiReq.getServletContext().getContextPath() + "/upload/gallery/" +
			 * boardType + "/" + saveFileName; } else { url =
			 * multiReq.getServletContext().getContextPath() + "/upload/" + dirUrl + "/" +
			 * boardType + "/" + saveFileName; }
			 */
			url.replaceAll("\\\\", "/");
			LOGGER.debug(url);
			pFile.transferTo(saveDir);

			rMap.put("uploaded", 1);
			rMap.put("fileName", saveFileName);
			rMap.put("url", url);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			Map<String, String> errorMap = new HashMap<String, String>();
			errorMap.put("message", e.getMessage());
			rMap.put("uploaded", 0);
			rMap.put("error", errorMap);
		} finally {
			try {
				rJsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(rMap);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				rJsonStr = "{\"uploaded\":0,\"error\":{\"message\":\"" + e.getMessage() + "\"}}";
			}
		}
		return rJsonStr;
	}

	private String saveNewMultipartImage(MultipartFile newImg, String savePathContext)
			throws IllegalStateException, IOException {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

		String rootPath = null;
		if (ROOT_PATH == null) {
			rootPath = servlet.getRealPath("");
		} else {
			rootPath = ROOT_PATH;
		}

		String savePath = rootPath + File.separator + savePathContext;

		String uuid = UUID.randomUUID().toString();
		String format = FilenameUtils.getExtension(newImg.getOriginalFilename());
		String saveFileName = uuid + "." + format;

		File saveDir = new File(savePath);
		if (!saveDir.exists()) {
			saveDir.mkdir();
		}

		LOGGER.debug(savePath + File.separator + saveFileName);

		File newImgDir = new File(savePath, saveFileName);

		newImg.transferTo(newImgDir); // 이미지 쓰기

		return saveFileName;
	}

	private String replaceMultipartImage(MultipartFile newImg, String oldFileName, String savePath)
			throws IllegalStateException, IOException {
		String newFileName = saveNewMultipartImage(newImg, savePath);
		File newImgDir = new File(savePath, newFileName);

		if (newImgDir.exists() && oldFileName != null) {
			if (!oldFileName.equals("") && !oldFileName.equals("default.png")) {
				new File(savePath, oldFileName).delete(); // 기존 이미지 삭제
			}
		}

		return newFileName;
	}

	private void setWriterInfo(BoardDTO boardDTO) {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		// 작성자 IP 등록
		boardDTO.setWriterIp(req.getRemoteAddr());

		// 작성자 SEQ_ID 등록
		try {
			boardDTO.setWriterId(
					((UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeqId());

		} catch (Exception e) {
			LOGGER.debug("NO AUTH FOUND");
			boardDTO.setWriterId(9999);
		}
	}

	private Map<String, Object> getBoardWriteResultMap(int insertCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", insertCount);
		if (insertCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "[" + boardCategory + "] 게시글을 등록했습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "[" + boardCategory + "] 게시글 등록이 불가합니다. 관리자에게 문의해주세요.");
		}

		return resultMap;
	}

	private Map<String, Object> getBoardEditResultMap(int updateCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", updateCount);
		if (updateCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "[" + boardCategory + "] 게시글을 수정했습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "[" + boardCategory + "] 게시글 수정이 불가합니다. 관리자에게 문의해주세요.");
		}

		return resultMap;
	}

	private Map<String, Object> getBoardDeleteResultMap(int deleteCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", deleteCount);
		if (deleteCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "[" + boardCategory + "] 게시글이 삭제됐습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "[" + boardCategory + "] 게시글 삭제가 불가합니다. 관리자에게 문의해주세요.");
		}

		return resultMap;
	}

	private Map<String, Object> getPartnerInformationEditResultMap(int updateCount, String boardCategory) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("count", updateCount);
		if (updateCount > 0) {
			resultMap.put("result", "success");
			resultMap.put("message", "입주기업 정보를 수정했습니다.");
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "입주기업 정보 수정이 불가합니다. 관리자에게 문의해주세요.");
		}

		return resultMap;
	}

	public Map<String, Object> getBoardSearchOption(Map<String, Object> searchOption) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		ObjectMapper objMapper = new ObjectMapper();

		int postCnt = 0;
		int pageSize = 10;
		switch ((String) searchOption.get("boardType")) {
		case "notice":
			postCnt = noticeMapper.selectNoticePostCount(searchOption);
			break;
		case "agency":
			postCnt = agencyMapper.selectAgencyPostCount(searchOption);
			break;
		case "faq":
			postCnt = faqMapper.selectFaqPostCount(searchOption);
			break;
		case "media":
			postCnt = mediaMapper.selectMediaPostCount(searchOption);
			pageSize = 9;
			break;
		case "press":
			postCnt = pressMapper.selectPressPostCount(searchOption);
			break;
		case "promotion":
			postCnt = promotionMapper.selectPromotionPostCount(searchOption);
			break;
		case "bio-info":
			postCnt = bioInfoMapper.selectBioInfoPostCount(searchOption);
			break;
		case "partner-notice":
			postCnt = noticePartnerMapper.selectNoticePartnerPostCount(searchOption);
			break;
		case "partner-media":
			postCnt = mediaPartnerMapper.selectMediaPostCount(searchOption);
			pageSize = 9;
			break;
		case "partner-activity":
			postCnt = activityPartnerMapper.selectActivityPartnerPostCount(searchOption);
			pageSize = 9;
			break;
		}

		int curPage = (int) searchOption.get("curPage");
		PagingUtil page = new PagingUtil(postCnt, curPage);
		page.setPageSize(pageSize);

		searchOption.put("index", page.getStartIndex());
		searchOption.put("size", page.getPageSize());

		resultMap.put("result", "success");
		resultMap.put("searchOption", searchOption);
		resultMap.put("page", objMapper.writeValueAsString(page));

		return resultMap;
	}

	@Override
	public String saveBoardFile(String boardType, MultipartHttpServletRequest mtfRequest) {
		LOGGER.debug(boardType + " upload arrive");
		Map<String, Object> rMap = new HashMap<String, Object>();
		String rJsonStr = "";
		ObjectMapper mapper = new ObjectMapper();

		try {

			String rootPath = null;
			if (ROOT_PATH == null) {
				rootPath =mtfRequest.getSession().getServletContext().getRealPath("");
			} else {
				rootPath = ROOT_PATH;
			}

			String savePathContext = null;
			String dirUrl = null;

			if (boardType.equals("notice") || boardType.equals("agency") || boardType.equals("faq")) {
				savePathContext = BOARD_PATH;
				dirUrl = BOARD_URL;
			} else if (boardType.equals("press") || boardType.equals("promotion") || boardType.equals("bio-info")) {
				savePathContext = GALLERY_PATH;
				dirUrl = GALLERY_URL;
			} else if (boardType.equals("media")) {
				savePathContext = MEDIA_PATH;
				dirUrl = MEDIA_URL;
			} else if (boardType.equals("partner") || boardType.equals("partner-notice")
					|| boardType.equals("partner-media") || boardType.equals("partner-activity")) {
				savePathContext = PARTNER_PATH;
				dirUrl = PARTNER_URL;
			} else if (boardType.equals("web-content")) {
				savePathContext = WEBPAGE_PATH;
				dirUrl = WEBPAGE_URL;
			}

			List<MultipartFile> fileList = mtfRequest.getFiles("file");
			
			String saveFileNames = "";
			String originFileNames = "";
			String urls = "";
			
			for (MultipartFile pFile : fileList) {
				
				//파일이 2개 이상일 경우 :(파일이름사용불가) 로 구분
				if(!urls.equals("")) {
					saveFileNames += ":";
					originFileNames += ":";
					urls += ":";
				}
				
				// 이미지 저장 폴더
				String savePath = rootPath + File.separator + savePathContext + File.separator + boardType;
				String uuid = UUID.randomUUID().toString();
				String format = FilenameUtils.getExtension(pFile.getOriginalFilename());
	
				String saveFileName = uuid + "." + format;
				String originFileName = pFile.getOriginalFilename();
	
				LOGGER.debug("SAVE PATH : " + savePath + saveFileName);
	
				File saveDir = new File(savePath, saveFileName);
	
				// String url = servlet.getContextPath() + "/" + dirUrl + "/" + boardType + "/" + saveFileName;
				String url = "/" + dirUrl + "/" + boardType + "/" + saveFileName;
				url.replaceAll("\\\\", "/");
				LOGGER.debug(url);
				pFile.transferTo(saveDir);
			
				saveFileNames += saveFileName;
				originFileNames += originFileName;
				urls += url;
			}

			rMap.put("uploaded", fileList.size());
			rMap.put("fileName", saveFileNames);
			rMap.put("originName", originFileNames);
			rMap.put("url", urls);

		} catch (Exception e) {
			e.printStackTrace();
			Map<String, String> errorMap = new HashMap<String, String>();
			errorMap.put("message", e.getMessage());
			rMap.put("uploaded", 0);
			rMap.put("error", errorMap);
		} finally {
			try {
				rJsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(rMap);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
				rJsonStr = "{\"uploaded\":0,\"error\":{\"message\":\"" + e.getMessage() + "\"}}";
			}
		}
		return rJsonStr;
	}
}
