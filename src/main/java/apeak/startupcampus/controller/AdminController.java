package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dto.BoardAgencyDTO;
import apeak.startupcampus.model.dto.BoardCommentDTO;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardFaqDTO;
import apeak.startupcampus.model.dto.BoardGalleryDTO;
import apeak.startupcampus.model.dto.BoardMediaDTO;
import apeak.startupcampus.model.dto.BoardNoticeDTO;
import apeak.startupcampus.model.dto.BoardPartnerActivityDTO;
import apeak.startupcampus.model.dto.BoardWebpageDTO;
import apeak.startupcampus.model.dto.BookListDTO;
import apeak.startupcampus.model.dto.BookPlaceDTO;
import apeak.startupcampus.model.dto.FamilySiteDTO;
import apeak.startupcampus.model.dto.NewsletterDTO;
import apeak.startupcampus.model.dto.PartnerDTO;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.AdminService;
import apeak.startupcampus.service.BoardService;
import apeak.startupcampus.service.BookService;
import apeak.startupcampus.service.FamilySiteService;
import apeak.startupcampus.service.PartnerService;

@Controller
@Secured({ "ROLE_ADMIN" })
@RequestMapping("/admin")
public class AdminController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class);

	@Resource(name = "adminService")
	private AdminService adminService;

	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "partnerService")
	private PartnerService partnerService;

	@Resource(name = "familySiteService")
	private FamilySiteService familySiteService;

	private String locationMain = "관리자 메뉴";
	
	// 켐퍼스 웹페이지 수정폼 이동
	@RequestMapping(value = "/webpage/{locationType}/{boardType}/edit/form")
	public String goToWebPageEditForm(
			@PathVariable("locationType") String locationType,
			@PathVariable("boardType") String boardType,
			Model model) throws Exception {
		String locationSub = null;
		LOGGER.debug(locationType + " / " + boardType);
		switch (locationType) {
			case "introduce":
				switch (boardType) {
					case "profile":
						model.addAllAttributes(boardService.getPageContent("100"));
						break;
					case "contract":
						model.addAllAttributes(boardService.getPageContent("101"));
						break;
				}
				Utils.setPageViewLocation(model, locationMain, "캠퍼스 소개");
				break;
			case "partner":
				switch (boardType) {
					case "management":
						model.addAllAttributes(boardService.getPageContent("200"));
						break;
				}
				Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
				break;
		}
		LOGGER.debug(model.toString());
		return "admin/page-" + locationType + "-" + boardType + "-edit";
	}

	// 공지사항 게시글 수정하기
	@RequestMapping(value = "/webpage/{locationType}/{boardType}/edit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editWebPage(
			@PathVariable("locationType") String locationType,
			@PathVariable("boardType") String boardType,
			@ModelAttribute BoardWebpageDTO webpageDTO, 
			HttpServletResponse res,HttpServletRequest request) throws Exception {
		
		res.setContentType("application/json;charset=UTF-8");
		return boardService.editPageContent(webpageDTO, request);
	}

	// 공지사항 게시글 작성폼 이동
	@RequestMapping(value = "/announce/{boardType}/write/form")
	public String goToAnnounceWriteForm(@PathVariable("boardType") String boardType, Model model) {
		Utils.setPageViewLocation(model, locationMain, "알림마당");
		return "admin/" + boardType + "-write";
	}

	// 공지사항 게시글 수정폼 이동
	@RequestMapping(value = "/announce/{boardType}/edit/form/{seqId}")
	public String goToAnnounceEditView(@PathVariable("boardType") String boardType, @PathVariable("seqId") int seqId,
			Model model) throws Exception {
		String locationSub = null;
		switch (boardType) {
		case "notice":
			model.addAllAttributes(boardService.getNoticePost(seqId));
			break;
		case "announcement":
			model.addAllAttributes(boardService.getAnnouncementPost(seqId));
			break;
		case "agency":
			model.addAllAttributes(boardService.getAgencyPost(seqId));
			break;
		case "faq":
			model.addAllAttributes(boardService.getFaqPost(seqId));
			break;
		case "promotion":
			model.addAllAttributes(boardService.getPromotionPost(seqId));
			break;
		case "press":
			model.addAllAttributes(boardService.getPressPost(seqId));
			break;
		default:
			model.addAllAttributes(boardService.getNoticePost(seqId));
			boardType = "notice";
		}
		Utils.setPageViewLocation(model, locationMain, "알림마당");
		return "admin/" + boardType + "-edit";
	}

	// 공지사항 게시글 작성하기
	@RequestMapping(value = "/announce/{boardType}/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeAnnouncePosting(@PathVariable("boardType") String boardType,
			@ModelAttribute BoardNoticeDTO noticeDTO, @ModelAttribute BoardAgencyDTO agencyDTO,
			@ModelAttribute BoardFaqDTO faqDTO, @ModelAttribute BoardGalleryDTO galleryDTO, 
			HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "notice":
			resultMap = boardService.writeNoticePost(noticeDTO);
			break;
		case "announcement":
			resultMap = boardService.writeAnnouncementPost(noticeDTO);
			break;
		case "agency":
			resultMap = boardService.writeAgencyPost(agencyDTO);
			break;
		case "faq":
			resultMap = boardService.writeFaqPost(faqDTO);
			break;
		case "promotion":
			resultMap = boardService.writePromotionPost(galleryDTO);
			break;
		}

		return resultMap;
	}

	// 공지사항 게시글 수정하기
	@RequestMapping(value = "/announce/{boardType}/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editAnnouncePost(@PathVariable("boardType") String boardType,
			@ModelAttribute BoardNoticeDTO noticeDTO, @ModelAttribute BoardAgencyDTO agencyDTO,
			@ModelAttribute BoardFaqDTO faqDTO, @ModelAttribute BoardGalleryDTO galleryDTO, 
			HttpServletResponse res,HttpServletRequest request) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "notice":
			resultMap = boardService.editNoticePost(noticeDTO,request);
			break;
		case "agency":
			resultMap = boardService.editAgencyPost(agencyDTO,request);
			break;
		case "faq":
			resultMap = boardService.editFaqPost(faqDTO,request);
			break;
		case "promotion":
			resultMap = boardService.editPromotionPost(galleryDTO,request);
			break;
		case "press":
			resultMap = boardService.editPressPost(galleryDTO,request);
			break;
		case "announcement":
			resultMap = boardService.editAnnouncementPost(noticeDTO,request);
			break;
		}

		return resultMap;
	}

	// 공지사항 게시글 삭제하기
	@RequestMapping(value = "/announce/{boardType}/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeAnnouncePost(@PathVariable("boardType") String boardType,
			@PathVariable("seqId") int seqId, HttpServletResponse res,HttpServletRequest request) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "notice":
			resultMap = boardService.deleteNoticePost(seqId,request);
			break;
		case "agency":
			resultMap = boardService.deleteAgencyPost(seqId,request);
			break;
		case "faq":
			resultMap = boardService.deleteFaqPost(seqId,request);
			break;
		case "promotion":
			resultMap = boardService.deletePromotionPost(seqId,request);
			break;
		case "announcement":
			resultMap = boardService.deleteAnnouncementPost(seqId,request);
			break;
		}

		return resultMap;
	}

	// 소개 / 동영상 게시글 작성폼 이동
	@RequestMapping(value = "/introduce/media/write/form")
	public String goToIntroduceMediaWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "캠퍼스 소개");
		return "admin/media-write";
	}

	// 소개 / 동영상 게시글 수정폼 이동
	@RequestMapping(value = "/introduce/media/edit/form/{seqId}")
	public String goToIntroduceMediaEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getMediaPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "캠퍼스 소개");
		return "admin/media-edit";
	}

	// 소개 / 동영상 게시글 작성하기
	@RequestMapping(value = "/introduce/media/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeIntroduceMediaPosting(@ModelAttribute BoardMediaDTO mediaDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		resultMap = boardService.writeMediaPost(mediaDTO);

		return resultMap;
	}

	// 소개 / 동영상 게시글 수정하기
	@RequestMapping(value = "/introduce/media/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editIntroduceMediaPost(@ModelAttribute BoardMediaDTO mediaDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = boardService.editMediaPost(mediaDTO);

		return resultMap;
	}

	// 소개 / 동영상 게시글 삭제하기
	@RequestMapping(value = "/introduce/media/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeIntroduceMediaPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = boardService.deleteMediaPost(seqId);

		return resultMap;
	}

	/*
	 * [갤러리] 관련 메서드
	 */

	// 갤러리 게시글 작성폼 이동
	@RequestMapping(value = "/gallery/{boardType}/write/form")
	public String goToGalleryWriteForm(@PathVariable("boardType") String boardType, Model model) {
		Utils.setPageViewLocation(model, locationMain, "아카이브");
		return "admin/" + boardType + "-write";
	}

	// 갤러리 게시글 수정폼 이동
	@RequestMapping(value = "/gallery/{boardType}/edit/form/{seqId}")
	public String goToGalleryEditView(@PathVariable("boardType") String boardType, @PathVariable("seqId") int seqId,
			Model model) throws Exception {
		String locationSub = null;
		switch (boardType) {
		case "press":
			model.addAllAttributes(boardService.getPressPost(seqId));
			break;
		case "promotion":
			model.addAllAttributes(boardService.getPromotionPost(seqId));
			break;
		case "bio-info":
			model.addAllAttributes(boardService.getBioInfoPost(seqId));
			break;
		}
		Utils.setPageViewLocation(model, locationMain, "아카이브");
		return "admin/" + boardType + "-edit";
	}

	// 갤러리 게시글 작성하기
	@RequestMapping(value = "/gallery/{boardType}/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeGalleryPosting(@PathVariable("boardType") String boardType,
			@ModelAttribute BoardGalleryDTO galleryDTO, HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "press":
			resultMap = boardService.writePressPost(galleryDTO);
			break;
		case "promotion":
			resultMap = boardService.writePromotionPost(galleryDTO);
			break;
		case "bio-info":
			resultMap = boardService.writeBioInfoPost(galleryDTO);
			break;
		}

		return resultMap;
	}

	// 갤러리 게시글 수정하기
	@RequestMapping(value = "/gallery/{boardType}/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editGalleryPost(@PathVariable("boardType") String boardType,
			@ModelAttribute BoardGalleryDTO galleryDTO, HttpServletResponse res,HttpServletRequest request) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "press":
			resultMap = boardService.editPressPost(galleryDTO,request);
			break;
		case "promotion":
			resultMap = boardService.editPromotionPost(galleryDTO,request);
			break;
		case "bio-info":
			resultMap = boardService.editBioInfoPost(galleryDTO,request);
			break;
		}

		return resultMap;
	}

	// 갤러리 게시글 삭제하기
	@RequestMapping(value = "/gallery/{boardType}/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeGalleryPost(@PathVariable("boardType") String boardType,
			@PathVariable("seqId") int seqId, String representImage, HttpServletResponse res,HttpServletRequest request) throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		switch (boardType) {
		case "press":
			resultMap = boardService.deletePressPost(seqId,request);
			break;
		case "promotion":
			resultMap = boardService.deletePromotionPost(seqId,request);
			break;
		case "bio-info":
			resultMap = boardService.deleteBioInfoPost(seqId,request);
			break;
		}

		return resultMap;
	}

	// [입주기업] 관련 메서드
	// # 입주기업 정보 리스트 이동
	@RequestMapping(value = "/partner/list")
	public String goToPartnerInformationList(Model model) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/partner-list";
	}

	@RequestMapping(value = "/partner/information/post/list")
	@ResponseBody
	public Map<String, Object> getPartnerInformationList(Model model) throws Exception {
		return partnerService.getPartnerInformationListForAdmin();
	}

	// # 입주기업 정보 수정폼 이동
	@RequestMapping(value = "/partner/edit/form/{seqId}")
	public String goToPartnerDetailEditForm(@PathVariable("seqId") int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getPartnerInformation(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");

		return "admin/partner-edit";
	}

	// 입주기업 정보 수정하기
	@RequestMapping(value = "/partner/information/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editPartnerInformation(@ModelAttribute PartnerDTO partnerDTO,
			@RequestParam(value = "profileImageFile", required = false) MultipartFile profileImageFile,
			HttpServletResponse res) throws Exception {
		LOGGER.debug("PARTNER INFO UPDATE ARRIVED");
		res.setContentType("application/json;charset=UTF-8");

		if (!profileImageFile.isEmpty()) {
			partnerDTO.setProfileImageFile(profileImageFile);
		}
		Map<String, ?> resultMap = boardService.editPartnerInformation(partnerDTO);

		return resultMap;
	}

	// [입주기업 알림공간] 관련 메서드
	// # 입주기업 알림공간 리스트 뷰
	@RequestMapping(value = "/partner/notice/list")
	public String goToPartnerNoticeList(Model model, 
			@RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if (curPage == 0) {
			curPage = 1;
		}
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-notice");
		LOGGER.debug(searchOption.toString());

		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());

		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		model.addAllAttributes(resultMap);
		return "admin/notice-partner-list";
	}

	// # 입주기업 알림공간 게시글 뷰
	@RequestMapping(value = "/partner/notice/view/{seqId}")
	public String goToNoticePartnerListView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getNoticePartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/notice-partner-view";
	}

	// 입주기업 알림공간 게시글 작성폼 이동
	@RequestMapping(value = "/partner/notice/write/form")
	public String goToNoticePartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/notice-partner-write";
	}

	// 입주기업 알림공간 게시글 수정폼 이동
	@RequestMapping(value = "/partner/notice/edit/form/{seqId}")
	public String goToNoticePartnerEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getNoticePartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/notice-partner-edit";
	}

	// 입주기업 알림공간 게시글 서치
	@RequestMapping(value = "/partner/notice/post/list")
	@ResponseBody
	public Map<String, Object> searchPostListByKeyword(Model model,
			@RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-notice");
		Map<String, Object> resultMap = boardService.getNoticePartnerPostList(searchOption);
		String locationSub = "입주기업 관련";

		return resultMap;
	}

	// 입주기업 알림공간 게시글 작성하기
	@RequestMapping(value = "/partner/notice/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeNoticePartnerPosting(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.writeNoticePartnerPost(boardDTO);
	}

	// 입주기업 알림공간 게시글 수정하기
	@RequestMapping(value = "/partner/notice/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editNoticePartnerPost(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.editNoticePartnerPost(boardDTO,request);
	}

	// 입주기업 알림공간 게시글 삭제하기
	@RequestMapping(value = "/partner/notice/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeNoticePartnerPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.deleteNoticePartnerPost(seqId);
	}

	// 입주기업 소개 영상 게시글 작성폼 이동
	@RequestMapping(value = "/partner/media/write/form")
	public String goToPartnerMediaWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/media-partner-write";
	}

	// 입주기업 소개 영상 게시글 수정폼 이동
	@RequestMapping(value = "/partner/media/edit/form/{seqId}")
	public String goToPartnerMediaEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getMediaPartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/media-partner-edit";
	}

	// 입주기업 소개 영상 게시글 작성하기
	@RequestMapping(value = "/partner/media/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeMediaPartnerPosting(@ModelAttribute BoardMediaDTO mediaDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = null;
		resultMap = boardService.writeMediaPartnerPost(mediaDTO);

		return resultMap;
	}

	// 입주기업 소개 영상 게시글 수정하기
	@RequestMapping(value = "/partner/media/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editMediaPartnerPost(@ModelAttribute BoardMediaDTO mediaDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = boardService.editMediaPartnerPost(mediaDTO,request);

		return resultMap;
	}

	// 입주기업 소개 영상 게시글 삭제하기
	@RequestMapping(value = "/partner/media/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeMediaPartnerPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = boardService.deleteMediaPartnerPost(seqId);

		return resultMap;
	}
	
	/*
	 * 기업 소식 관련
	 * */
	
	// 기업 소식 게시글 작성폼 이동
	@RequestMapping(value = "/partner/activity/write/form")
	public String goToActivityPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/activity-partner-write";
	}
	
	// 기업 소식 게시글 수정폼 이동
	@RequestMapping(value="/partner/activity/edit/form/{seqId}")
	public String goToActivityPartnerEditView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getActivityPartnerPost(seqId));
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/activity-partner-edit";
	}
	
	// 기업 소식 게시글 작성하기
	@RequestMapping(value="/partner/activity/post/write", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeActivityPartnerPosting(
			@ModelAttribute BoardPartnerActivityDTO partnerActivityDTO,
			HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeActivityPartnerPost(partnerActivityDTO);
	}
	
	// 기업 소식 게시글 수정하기
	@RequestMapping(value="/partner/activity/post/edit/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editActivityPartnerPost(
			@ModelAttribute BoardPartnerActivityDTO partnerActivityDTO,
			HttpServletRequest req, HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		partnerActivityDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.editActivityPartnerPost(partnerActivityDTO, req);
	}
	
	
	// 기업 소식 게시글 게시 수정하기
	@RequestMapping(value="/partner/activity/edit/approve", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> updateApproveActivityPartnerPost(
			@RequestParam(value="seqId") int seqId,
			@RequestParam(value="viewApprove") String viewApprove
			) throws Exception {
		System.out.println(seqId);
		System.out.println(viewApprove);
		
		Map<String, Object> approveOption = new HashMap<String, Object>();
		
		approveOption.put("seqId", seqId);
		approveOption.put("viewApprove", viewApprove);

		
		//return viewApprove;
		
		return boardService.editApproveActivityPartnerPost(approveOption);
	}
	
	
	// 기업 소식 게시글 삭제하기
	@RequestMapping(value="/partner/activity/post/remove/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeActivityPartnerPost(
			@ModelAttribute BoardGalleryDTO gallaryDTO,
			HttpServletRequest req, HttpServletResponse res, Authentication auth
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		gallaryDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.deleteActivityPartnerPost(gallaryDTO, req);
	}

	
	// # 기업 활동 리스트 뷰
	@RequestMapping(value="/partner/activity/list")
	public String goToPartnerActivityBoard(
			Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		
		String locationSub = "입주기업 관련";
		
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-activity");
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, locationSub);
		model.addAllAttributes(resultMap);
		return "admin/activity-partner-list";
	}
	
	
	@RequestMapping(value="/partner/activity/post/list")
	@ResponseBody
	public Map<String, Object> searchPartnerActivityPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("POST LIST ARRIVED");

		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-activity");
		
		Map<String, Object> resultMap = boardService.getActivityPartnerPostList(searchOption);
		
		return resultMap;
	}
	
	
	@RequestMapping(value="/partner/activity/view/{seqId}")
	public String goToPartnerActivityView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		Map<String, Object> resultMap = boardService.getActivityPartnerPost(seqId);
		model.addAllAttributes(resultMap);
		
		String roleName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		if(!roleName.equals("anonymousUser")) {
			int viewerId = ((UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeqId();
			model.addAttribute("VIEWER_ID", viewerId);
			LOGGER.debug(resultMap.get("WRITER_ID") + " / " + viewerId);
		}
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		
		return "admin/activity-partner-view";
	}


	// [패밀리사이트] 관련 메서드
	// # 패밀리사이트 리스트 뷰
	@RequestMapping(value = "/family-site/list")
	public String goToFamilySiteListView(Model model) throws Exception {
		model.addAttribute("siteList", familySiteService.getFamilySiteList());
		Utils.setPageViewLocation(model, locationMain, "패밀리사이트");
		return "admin/family-sites-list";
	}

	// 새 패밀리사이트 작성하기
	@RequestMapping(value = "/family-site/site/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> addFamilySiteOne(@ModelAttribute FamilySiteDTO familySiteDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return familySiteService.addFamilySiteOne(familySiteDTO);
	}

	// 패밀리사이트 수정하기
	@RequestMapping(value = "/family-site/site/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editFamilySiteOne(@ModelAttribute FamilySiteDTO familySiteDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return familySiteService.editFamilySiteOne(familySiteDTO);
	}

	// 패밀리사이트 삭제하기
	@RequestMapping(value = "/family-site/site/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeFamilySiteOne(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return familySiteService.removeFamilySiteOne(seqId);
	}

	// [회의실 예약 및 현황] 관련 메서드
	@Resource(name = "bookService")
	private BookService bookService;

	// 회의실 소개뷰 이동
	@RequestMapping(value = "/book/place")
	public String goToBookPlaceList(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/place";
	}

	// 회의실 예약폼 이동
	@RequestMapping(value = "/book/place/form/{placeId}")
	public String goToBookPlaceForm(@PathVariable("placeId") int placeId, Model model, Authentication auth) throws Exception {
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		BookPlaceDTO bookPlaceInfo = bookService.getBookPlaceInfo(placeId);
				
		model.addAttribute("placeId", bookPlaceInfo.getSeqId());
		model.addAttribute("maxDailyCnt", bookPlaceInfo.getMaxDailyCnt());
		model.addAttribute("maxAvailDay", bookPlaceInfo.getMaxAvailDay());
		model.addAttribute("userId", userDTO.getSeqId());
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/book-write" + bookPlaceInfo.getSeqId();
	}
	
	@RequestMapping(value = "/book/place/{placeId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bookingPlace(
		@PathVariable("placeId") int placeId, @ModelAttribute BookListDTO bookListDTO, Authentication auth
	) throws Exception {
		LOGGER.debug(bookListDTO.toString());
		Map<String, Object> rMap = new HashMap<String, Object>();
		BookPlaceDTO bookPlaceDTO = bookService.getBookPlaceInfo(placeId);
		UserDTO userDTO = (UserDTO) auth.getPrincipal();
		bookListDTO.setPlaceId(bookPlaceDTO.getSeqId());
		bookListDTO.setUserId(userDTO.getSeqId());
		bookListDTO.setUserName(userDTO.getName());
		
		if(bookListDTO.getEndIndex() == null) {
			bookListDTO.setEndIndex(bookListDTO.getStartIndex());
		}
		
		bookListDTO.setBookSeq(
				Utils.getSeqAsc(bookListDTO.getStartIndex(), bookListDTO.getEndIndex())
		);
		LOGGER.debug(bookListDTO.toString());
		
		rMap.put("result", bookService.bookingPlaceOne(bookListDTO));
		return rMap;
	}

	// 회의실 예약 현황뷰 이동
	@RequestMapping(value = "/book/history")
	public String goToBookHistory(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/book-history";
	}
	
	@RequestMapping(value = "/book/place/max-value/edit/{placeId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> editBookMaxValue(@PathVariable("placeId") int placeId, BookPlaceDTO bookPlaceDTO) {
		bookPlaceDTO.setSeqId(placeId);
		Map<String, Object> rMap = new HashMap<String, Object>();
		if( bookPlaceDTO.getMaxAvailDay() < 0 || bookPlaceDTO.getMaxDailyCnt() < 0 ) {
			rMap.put("result", -1);
		} else {
			rMap.put("result", bookService.editBookMaxValueOne(bookPlaceDTO));
		}
		return rMap;
	}

	@RequestMapping(value = "/book/place/history/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removeBookingPlace(@PathVariable("seqId") int seqId,
			@ModelAttribute BookListDTO bookListDTO, Authentication auth) throws Exception {
		LOGGER.debug(bookListDTO.toString());
		Map<String, Object> rMap = new HashMap<String, Object>();
		bookListDTO.setSeqId(seqId);

		rMap.put("result", bookService.deleteBookHistoryOneForAdmin(bookListDTO));
		return rMap;
	}

	// 공통: 게시글 이미지를 업로드한다.
	@RequestMapping(value = "/{boardType}/upload/image", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadPostImg(@PathVariable("boardType") String boardType, MultipartHttpServletRequest multiReq,
			HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.saveBoardImage(boardType, multiReq);
	}

	// 공통: 첨부파일을 업로드한다.
	@RequestMapping(value = "/{boardType}/upload/file", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadFile(@PathVariable("boardType") String boardType, MultipartHttpServletRequest multiReq,
			HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		System.out.println("Upload Controller");
		System.out.println(boardType);
		return boardService.saveBoardFile(boardType, multiReq);
	}
	

	
	/*
	 * 뉴스레터 메소드 관련
	 * */
	
	
	// 뉴스레터 게시글 작성폼 이동
	@RequestMapping(value = "/newsletter/write/form")
	public String goToNewsletterWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "뉴스레터");
		return "admin/newsletter-write";
	}
	
	// 뉴스레터 게시글 작성하기
	@RequestMapping(value = "/newsletter/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeNewsletterPosting(@ModelAttribute NewsletterDTO newsletterDTO ,HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeNewsletterPost(newsletterDTO);
	}

	// 뉴스레터 게시글 수정폼 이동
	@RequestMapping(value = "/newsletter/edit/form/{seqId}")
	public String goToNewsletterEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getNewsletterPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "뉴스레터");
		return "admin/newsletter-edit";
	}


	// 뉴스레터 게시글 수정하기
	@RequestMapping(value = "/newsletter/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editNewsletterPost(@ModelAttribute NewsletterDTO newsletterDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		newsletterDTO.setWriterId(userDTO.getSeqId());

		return boardService.editNewsletterPost(newsletterDTO,request);
	}
	
	// # 뉴스레터 리스트 뷰
	@RequestMapping(value="/newsletter/list")
	public String goToNewsletterList(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		searchOption.put("boardType", "newletter");
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, "뉴스레터");
		model.addAllAttributes(resultMap);
		return "admin/newsletter-list";
	}
	
	// # 뉴스레터 게시글 뷰
	@RequestMapping(value="/newsletter/view/{seqId}")
	public String goToNewsletterView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getNewsletterPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "뉴스레터");
		
		return "admin/newsletter-view";
	}
	
	
	// # 뉴스레터 게시글 서치
	@RequestMapping(value="/newsletter/post/list")
	@ResponseBody
	public Map<String, Object> searchNewsletterPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "newsletter");
		
		Map<String, Object> resultMap = boardService.getNewsletterPostList(searchOption);
		
		return resultMap;
	}
	

	// 입주기업 소개 영상 게시글 삭제하기
	@RequestMapping(value = "/newsletter/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeNewsletterPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		Map<String, ?> resultMap = boardService.deleteNewsletterPost(seqId);

		return resultMap;
	}
	

	// [서식 자료실] 관련 메서드
	// # 서식 자료실 리스트 뷰
	@RequestMapping(value = "/partner/file/list")
	public String goToPartnerFileList(Model model, 
			@RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if (curPage == 0) {
			curPage = 1;
		}
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-notice");
		LOGGER.debug(searchOption.toString());

		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());

		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		model.addAllAttributes(resultMap);
		return "admin/file-list";
	}

	// # 서식 자료실 게시글 뷰
	@RequestMapping(value = "/partner/file/view/{seqId}")
	public String goToFilePartnerListView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getFilePartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/file-view";
	}

	// 서식 자료실 게시글 작성폼 이동
	@RequestMapping(value = "/partner/file/write/form")
	public String goToFilePartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/file-write";
	}

	// 서식 자료실 게시글 수정폼 이동
	@RequestMapping(value = "/partner/file/edit/form/{seqId}")
	public String goToFilePartnerEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getFilePartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/file-edit";
	}

	

	// 서식 자료실 게시글 서치
	@RequestMapping(value = "/partner/file/post/list")
	@ResponseBody
	public Map<String, Object> searchFilePostListByKeyword(Model model,
			@RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "file");
		Map<String, Object> resultMap = boardService.getFilePartnerPostList(searchOption);
		String locationSub = "입주기업 관련";

		return resultMap;
	}

	
	
	// 서식 자료실 게시글 작성하기
	@RequestMapping(value = "/partner/file/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeFilePartnerPosting(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.writeFilePartnerPost(boardDTO);
	}

	// 서식 자료실 게시글 수정하기
	@RequestMapping(value = "/partner/file/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editFilePartnerPost(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.editFilePartnerPost(boardDTO,request);
	}

	// 서식 자료실 게시글 삭제하기
	@RequestMapping(value = "/partner/file/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeFilePartnerPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.deleteFilePartnerPost(seqId);
	}
	
	
	// [입주기업 커뮤니티] 관련 메서드
	// 입주기업 커뮤니티 게시글 서치
	@RequestMapping(value = "/user/community/post/list")
	@ResponseBody
	public Map<String, Object> searchCommunityPostListByKeyword(Model model,
			@RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-community");
		Map<String, Object> resultMap = boardService.getCommunityPartnerPostList(searchOption);
		String locationSub = "입주기업 관련";

		return resultMap;
	}
	
	// # 입주기업 커뮤니티 리스트 뷰
	@RequestMapping(value = "/user/community/list")
	public String goToPartnerCommunityList(Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage,
			@RequestParam(value = "searchType", defaultValue = "NONE") String searchType,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if (curPage == 0) {
			curPage = 1;
		}
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-community");
		LOGGER.debug(searchOption.toString());

		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());

		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		model.addAllAttributes(resultMap);
		return "admin/community-partner-list";
	}
	
	// # 입주기업 커뮤니티 게시글 뷰
	@RequestMapping(value = "/user/community/view/{seqId}")
	public String goToCommunityPartnerListView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		//model.addAllAttributes(boardService.getCommunityPartnerPost(seqId));
		
		Map<String, Object> resultMap = boardService.getCommunityPartnerPost(seqId);
		model.addAllAttributes(resultMap);
		
		Map<String, Object> comment = boardService.getCommunityPostCommentList(seqId);
		LOGGER.debug("댓글 가져오기");
		LOGGER.debug(comment.toString());
		model.addAllAttributes(comment);
		

		Map<String, Object> commentCnt = boardService.getCommunityPostCommentCnt(seqId);
		LOGGER.debug("댓글 갯수");
		LOGGER.debug(commentCnt.toString());
		model.addAllAttributes(commentCnt);

		String roleName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		if(!roleName.equals("anonymousUser")) {
			int viewerId = ((UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeqId();
			model.addAttribute("VIEWER_ID", viewerId);
			LOGGER.debug(resultMap.get("WRITER_ID") + " / " + viewerId);
		}
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/community-partner-view";
	}

	// 입주기업 커뮤니티 게시글 삭제하기
	@RequestMapping(value = "/user/community/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeCommunityPartnerPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.deleteCommunityPartnerPost(seqId);
	}
	

	// 입주기업 커뮤니티 게시글 작성폼 이동
	@RequestMapping(value = "/community/write/form")
	public String goToCommunityPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/community-partner-write";
	}
	

	// 입주기업 커뮤니티 게시글 작성하기
	@RequestMapping(value = "/community/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeCommunityPartnerPosting(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeCommunityPartnerPost(boardDTO);
	}
	

	// 입주기업 커뮤니티 게시글 수정폼 이동
	@RequestMapping(value = "/community/edit/form/{seqId}")
	public String goToCommunityEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getCommunityPartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "admin/community-partner-edit";
	}
	
	// 입주기업 커뮤니티 게시글 수정하기
	@RequestMapping(value = "/community/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editCommunityPartnerPost(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.editCommunityPartnerPost(boardDTO,request);
	}
	
	// 입주기업 커뮤니티 게시글 댓글 작성하기
	@RequestMapping(value="/community/comment/post/{seqId}", method=RequestMethod.POST)
	public String writeCommunityCommentPosting(
			@ModelAttribute BoardCommentDTO commentDTO,
			HttpServletResponse res, Model model
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		model.addAllAttributes(boardService.writeCommunityCommentPost(commentDTO));

	    int postId = commentDTO.getPostId();
	    model.addAttribute("postId", postId);
	    return "redirect:/admin/user/community/view/" + postId;
	}
	
	
	// 입주기업 커뮤니티 게시글 댓글 삭제하기
	@RequestMapping(value = "/community/comment/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeCommunityCommentPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.deleteCommunityCommentPost(seqId);
	}
	
	
	
	
	
	//[기업 소식] 메소드
	// # 기업 소식 리스트 뷰
	@RequestMapping(value="/partner/news/list")
	public String goToPartnerNewsBoard(
			Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		
		String locationSub = "입주기업 관련";
		
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-news");
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, locationSub);
		model.addAllAttributes(resultMap);
		return "admin/news-partner-list";
	}
	
	@RequestMapping(value="/partner/news/post/list")
	@ResponseBody
	public Map<String, Object> searchPartnerNewsPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-news");
		
		Map<String, Object> resultMap = boardService.getNewsPartnerPostList(searchOption);
		
		return resultMap;
	}
	
	@RequestMapping(value="/partner/news/view/{seqId}")
	public String goToPartnerNewsView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		Map<String, Object> resultMap = boardService.getNewsPartnerPost(seqId);
		model.addAllAttributes(resultMap);
		
		String roleName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		if(!roleName.equals("anonymousUser")) {
			int viewerId = ((UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeqId();
			model.addAttribute("VIEWER_ID", viewerId);
			LOGGER.debug(resultMap.get("WRITER_ID") + " / " + viewerId);
		}
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		
		return "admin/news-partner-view";
	}

	
	
	
}
