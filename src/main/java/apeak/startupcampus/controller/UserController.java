package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.BoardGalleryDTO;
import apeak.startupcampus.model.dto.BoardPartnerActivityDTO;
import apeak.startupcampus.model.dto.BoardPartnerNewsDTO;
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.BoardService;
import apeak.startupcampus.service.UserService;

@Controller
@Secured({"ROLE_USER"})
@RequestMapping("/user")
public class UserController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	private String locationMain = "입주기업 전용공간";
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "/login/form")
	public String goToIndex(Model model) {
		Utils.setPageViewLocation(model, "사용자 로그인", "로그인");
		return "user/login-form";
	}

	@RequestMapping(value = "/mypage")
	public String goToMypage(Model model, Authentication auth) {
		Utils.setPageViewLocation(model, locationMain, "마이페이지");
		model.addAttribute("SEQ_ID", ((UserDTO)auth.getPrincipal()).getSeqId());
		return "user/mypage";
	}
	
	@RequestMapping(value = "/account/password/change", method=RequestMethod.POST)
	@ResponseBody
	public int changePasswordByOldPassword(
		@RequestParam(value="oldPassword") String oldPassword,
		@RequestParam(value="newPassword") String newPassword,
		@RequestParam(value="seqId") int seqId,
		Model model, Authentication auth
		) throws Exception {
		LOGGER.debug(oldPassword + " / " + newPassword + " / " + seqId);
		return userService.updatePasswordByOldPassword(oldPassword, newPassword, seqId);
	}

	/*
	 * 입주기업 알림공간 관련
	 * */
	
	// # 입주기업 알림공간 리스트 뷰
	@RequestMapping(value="/partner/notice/list")
	public String goToAnnounceBoard(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-notice");
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, "공지사항");
		model.addAllAttributes(resultMap);
		return "user/notice-partner-list";
	}
	
	// # 입주기업 알림공간 게시글 뷰
	@RequestMapping(value="/partner/notice/view/{seqId}")
	public String goToNotice(
			@PathVariable("seqId")int seqId, Authentication auth, Model model) throws Exception {
		Map<String, Object> resultMap = boardService.getNoticePartnerPost(seqId);
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		LOGGER.debug(userDTO.toString());
		if(resultMap.get("WRITER_ID").equals(userDTO.getSeqId())) {
			resultMap.put("IS_AUTHOR", true);
		} else {
			resultMap.put("IS_AUTHOR", false);
		}
		model.addAllAttributes(resultMap);
		Utils.setPageViewLocation(model, locationMain, "공지사항");
		return "user/notice-partner-view";
	}
	
	// 입주기업 알림공간 게시글 작성폼 이동
	@RequestMapping(value = "/partner/notice/write/form")
	public String goToNoticePartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "공지사항");
		return "user/notice-partner-write";
	}
	
	// 입주기업 알림공간 게시글 수정폼 이동
	@RequestMapping(value="/partner/notice/edit/form/{seqId}")
	public String goToNoticePartnerEditView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getNoticePartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "공지사항");
		return "user/notice-partner-edit";
	}
	
	// 입주기업 알림공간 게시글 서치
	@RequestMapping(value="/partner/notice/post/list")
	@ResponseBody
	public Map<String, Object> searchPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-notice");
		Map<String, Object> resultMap = boardService.getNoticePartnerPostList(searchOption);
		String locationSub = "공지사항";
		return resultMap;
	}
	
	// 입주기업 알림공간 게시글 작성하기
	@RequestMapping(value="/partner/notice/post/write", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeNoticePartnerPosting(
			@ModelAttribute BoardDTO boardDTO,
			HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeNoticePartnerPostForPartner(boardDTO);
	}
	
	// 입주기업 알림공간 게시글 수정하기
	@RequestMapping(value="/partner/notice/post/edit/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editNoticePartnerPost(
			@ModelAttribute BoardDTO boardDTO,
			HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boardDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.editNoticePartnerPostForPartner(boardDTO);
	}
	
	// 입주기업 알림공간 게시글 삭제하기
	@RequestMapping(value="/partner/notice/post/remove/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeNoticePartnerPost(
			@ModelAttribute BoardDTO boardDTO,
			HttpServletResponse res, Authentication auth
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boardDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.deleteNoticePartnerPostForPartner(boardDTO);
	}

	@RequestMapping(value="/partner-notice/upload/image", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadPostImg(MultipartHttpServletRequest multiReq, HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.saveBoardImage("partner-notice", multiReq);
	}
	
	
	/*
	 * 기업 소식 관련
	 * */
	
	// 기업 소식 게시글 작성폼 이동
	@RequestMapping(value = "/partner/activity/write/form")
	public String goToActivityPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "기업 소식 업로드");
		return "user/activity-partner-write";
	}
	
	// 기업 소식 게시글 수정폼 이동
	@RequestMapping(value="/partner/activity/edit/form/{seqId}")
	public String goToActivityPartnerEditView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getActivityPartnerPost(seqId));
		
		Utils.setPageViewLocation(model, locationMain, "기업 소식 업로드");
		return "user/activity-partner-edit";
	}
	
	// 기업 소식 게시글 작성하기
	@RequestMapping(value="/partner/activity/post/write", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeActivityPartnerPosting(
			@ModelAttribute BoardPartnerActivityDTO partnerActivityDTO,
			HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeActivityPartnerPostForPartner(partnerActivityDTO);
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
		
		return boardService.editActivityPartnerPostForPartner(partnerActivityDTO, req);
	}
	
	// 기업 활동 게시글 삭제하기
	@RequestMapping(value="/partner/activity/post/remove/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeActivityPartnerPost(
			@ModelAttribute BoardPartnerActivityDTO partnerActivityDTO,
			HttpServletRequest req, HttpServletResponse res, Authentication auth
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		partnerActivityDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.deleteActivityPartnerPostForPartner(partnerActivityDTO, req);
	}
	
	
	// [입주기업 커뮤니티] 관련 메서드
	// # 입주기업 커뮤니티 리스트 뷰
	@RequestMapping(value = "/community/list")
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

		Utils.setPageViewLocation(model, locationMain, "입주기업 커뮤니티");
		model.addAllAttributes(resultMap);
		return "user/community-partner-list";
	}
	

	// 입주기업 커뮤니티 게시글 작성폼 이동
	@RequestMapping(value = "/community/write/form")
	public String goToCommunityPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 커뮤니티");
		return "user/community-partner-write";
	}
	

	// 입주기업 커뮤니티 게시글 작성하기
	@RequestMapping(value = "/community/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeCommunityPartnerPosting(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		LOGGER.debug("커뮤니티 작성 컨트롤러");
		System.out.println(boardDTO);
		return boardService.writeCommunityPartnerPost(boardDTO);
	}
	
	// 입주기업 커뮤니티 게시글 서치
	@RequestMapping(value = "/community/post/list")
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
		String locationSub = "입주기업 커뮤니티";

		return resultMap;
	}
	
	// # 입주기업 커뮤니티 게시글 뷰
	@RequestMapping(value = "/community/view/{seqId}")
	public String goToCommunityPartnerListView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		//model.addAllAttributes(boardService.getCommunityPartnerPost(seqId));
		
		Map<String, Object> resultMap = boardService.getCommunityPartnerPost(seqId);
		model.addAllAttributes(resultMap);
		
		String roleName = SecurityContextHolder.getContext().getAuthentication().getName();
		
		if(!roleName.equals("anonymousUser")) {
			int viewerId = ((UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeqId();
			model.addAttribute("VIEWER_ID", viewerId);
			LOGGER.debug(resultMap.get("WRITER_ID") + " / " + viewerId);
		}
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 커뮤니티");
		return "user/community-partner-view";
	}
	

	// 입주기업 커뮤니티 게시글 수정폼 이동
	@RequestMapping(value = "/community/edit/form/{seqId}")
	public String goToCommunityEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getCommunityPartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 커뮤니티");
		return "user/community-partner-edit";
	}
	

	// 입주기업 커뮤니티 게시글 삭제하기
	@RequestMapping(value = "/community/post/remove/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeCommunityPartnerPost(@PathVariable("seqId") int seqId, HttpServletResponse res)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.deleteCommunityPartnerPost(seqId);
	}

	// 입주기업 커뮤니티 게시글 수정하기
	@RequestMapping(value = "/community/post/edit/{seqId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editCommunityPartnerPost(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res,HttpServletRequest request)
			throws Exception {
		res.setContentType("application/json;charset=UTF-8");

		return boardService.editCommunityPartnerPost(boardDTO,request);
	}
	
	
	// 공통: 게시글 이미지를 업로드한다.
	@RequestMapping(value="/{boardType}/upload/image", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadPartnerActivityPostImg(@PathVariable("boardType") String boardType, MultipartHttpServletRequest multiReq, HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.saveBoardImage(boardType, multiReq);
	}
	
	// 공통: 첨부파일을 업로드한다.
	@RequestMapping(value = "/{boardType}/upload/file", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String uploadFile(@PathVariable("boardType") String boardType, MultipartHttpServletRequest multiReq,
			HttpServletResponse res) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.saveBoardFile(boardType, multiReq);
	}
	
	// 서식 자료실 리스트 뷰
//	@RequestMapping(value="/file/list")
//	public String goToJoin(Model model) {
//		Utils.setPageViewLocation(model, locationMain, "서식 자료실");
//		return "user/file-list";
//	}
	
	// 서식 자료실 리스트 뷰
	@RequestMapping(value="/file/list")
	public String goToFileBoard(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "file");
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, "서식 자료실");
		model.addAllAttributes(resultMap);
		return "user/file-list";
	}
	
	// 서식 자료실 게시글 뷰
	@RequestMapping(value="/file/view/{seqId}")
	public String goToFileView(@PathVariable("seqId")int seqId, Authentication auth, Model model) throws Exception {
		Map<String, Object> resultMap = boardService.getFilePartnerPost(seqId);
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		LOGGER.debug(userDTO.toString());
		if(resultMap.get("WRITER_ID").equals(userDTO.getSeqId())) {
			resultMap.put("IS_AUTHOR", true);
		} else {
			resultMap.put("IS_AUTHOR", false);
		}
		model.addAllAttributes(resultMap);
		Utils.setPageViewLocation(model, locationMain, "서식 자료실");
		return "user/file-view";
	}
	
	// 서식 자료실 게시글 서치
	@RequestMapping(value="/file/post/list")
	@ResponseBody
	public Map<String, Object> searchFileListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "file");
		Map<String, Object> resultMap = boardService.getFilePartnerPostList(searchOption);
		String locationSub = "서식 자료실";
		return resultMap;
	}
	
	
	// 기업 소식 게시글 작성하기
	@RequestMapping(value="/partner/news/post/write", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeNewsPartnerPosting(
			@ModelAttribute BoardPartnerNewsDTO partnerNewsDTO,
			HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		return boardService.writeNewsPartnerPostForPartner(partnerNewsDTO);
	}
	
	
	// 기업 소식 게시글 작성폼 이동
	@RequestMapping(value = "/partner/news/write/form")
	public String goToNewsPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "user/news-partner-write";
	}
	
	// 기업 활동 게시글 수정폼 이동
	@RequestMapping(value="/partner/news/edit/form/{seqId}")
	public String goToNewsPartnerEditView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getNewsPartnerPost(seqId));
		
		Utils.setPageViewLocation(model, locationMain, "입주기업 관련");
		return "user/news-partner-edit";
	}
	
	// 기업 활동 게시글 수정하기
	@RequestMapping(value="/partner/news/post/edit/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> editNewsPartnerPost(
			@ModelAttribute BoardGalleryDTO gallaryDTO,
			HttpServletRequest req, HttpServletResponse res
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		gallaryDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.editActivityPartnerPost(gallaryDTO, req);
	}
	
	// 기업 활동 게시글 삭제하기
	@RequestMapping(value="/partner/news/post/remove/{seqId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> removeNewsPartnerPost(
			@ModelAttribute BoardGalleryDTO gallaryDTO,
			HttpServletRequest req, HttpServletResponse res, Authentication auth
			) throws Exception {
		res.setContentType("application/json;charset=UTF-8");
		
		UserDTO userDTO = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		gallaryDTO.setWriterId(userDTO.getSeqId());
		
		return boardService.deleteActivityPartnerPost(gallaryDTO, req);
	}
	
	
}