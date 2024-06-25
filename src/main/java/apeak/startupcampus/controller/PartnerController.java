package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import apeak.startupcampus.model.dto.UserDTO;
import apeak.startupcampus.service.BoardService;
import apeak.startupcampus.service.PartnerService;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(PartnerController.class);
	
	@Resource(name = "partnerService")
	private PartnerService partnerService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private String locationMain = "기업소개";
	
	// # 입주기업 정보 리스트 뷰
	@RequestMapping(value="/list")
	public String goToPartnerInformationList(Model model) throws Exception {
		Utils.setPageViewLocation(model, locationMain, "입주기업 소개");
		return "partner/partner-list";
	}
	
	// # 입주기업 정보 리스트 뷰
	@RequestMapping(value="/graduate/list")
	public String goToGraduatePartnerInformationList(Model model) throws Exception {
		Utils.setPageViewLocation(model, locationMain, "졸업기업 소개");
		return "partner/graduate-partner-list";
	}
	
	// # 입주기업 상세정보 뷰
	@RequestMapping(value="/view/{seqId}")
	public String goToPartnerInformationView(
			@PathVariable("seqId") int seqId, Model model) throws Exception {
		
		model.addAllAttributes(partnerService.getPartnerInformation(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 소개");
		
		return "partner/partner-view";
	}
	
	@RequestMapping(value="/graduate/view/{seqId}")
	public String goToGraduatePartnerInformationView(
			@PathVariable("seqId") int seqId, Model model) throws Exception {
		
		model.addAllAttributes(partnerService.getPartnerInformation(seqId));
		Utils.setPageViewLocation(model, locationMain, "졸업기업 소개");
		
		return "partner/graduate-partner-view";
	}
	
	@RequestMapping(value="/information/post/list")
	@ResponseBody
	public Map<String, Object> searchPartnerInformationList(Model model) throws Exception {
		return partnerService.getPartnerInformationList();
	}
	
	@RequestMapping(value="/graduate/information/post/list")
	@ResponseBody
	public Map<String, Object> searchGraduatePartnerInformationList(Model model) throws Exception {
		return partnerService.getGraduatePartnerInformationList();
	}
	
	// 입주기업 알림공간 게시글 서치
	@RequestMapping(value="/notice/post/list")
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
		
		return resultMap;
	}
	
	// [입주기업 소개 영상] 관련 메서드
	// # 입주기업 소개 영상 리스트 뷰
	@RequestMapping(value="/media/list")
	public String goToPartnerMediaList(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		searchOption.put("boardType", "partner-media");
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, "소개 영상");
		model.addAllAttributes(resultMap);
		return "partner/media-partner-list";
	}
	
	// # 입주기업 소개 영상 게시글 뷰
	@RequestMapping(value="/media/view/{seqId}")
	public String goToPartnerMediaView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getMediaPartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "소개 영상");
		
		return "partner/media-partner-view";
	}
	
	// # 입주기업 소개 영상 게시글 서치
	@RequestMapping(value="/media/post/list")
	@ResponseBody
	public Map<String, Object> searchMediaPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-media");
		
		Map<String, Object> resultMap = boardService.getMediaPartnerPostList(searchOption);
		
		return resultMap;
	}
	
	// # 기업 활동 리스트 뷰
	@RequestMapping(value="/activity/list")
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
		
		String locationSub = "기업 소식";
		
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-activity");
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, locationSub);
		model.addAllAttributes(resultMap);
		return "partner/activity-partner-list";
	}
	
	@RequestMapping(value="/activity/post/list")
	@ResponseBody
	public Map<String, Object> searchPartnerActivityPostListByKeyword(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", "partner-activity");
		
		Map<String, Object> resultMap = boardService.getActivityPartnerPostList(searchOption);
		
		return resultMap;
	}
	
	@RequestMapping(value="/activity/view/{seqId}")
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
		
		Utils.setPageViewLocation(model, locationMain, "기업 활동");
		
		return "partner/activity-partner-view";
	}
	
	@RequestMapping(value="/management")
	public String goToContract(Model model) throws Exception {
		model.addAllAttributes(boardService.getPageContent("200"));
		Utils.setPageViewLocation(model, locationMain, "기업 실적");
		return "partner/management";
	}
	
	
	// [입주기업 커뮤니티] 관련 메서드
	// # 입주기업 커뮤니티 리스트 뷰
	@RequestMapping(value = "/community/list")
	public String goToPartnerNoticeList(Model model, @RequestParam(value = "curPage", defaultValue = "1") int curPage,
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

		Utils.setPageViewLocation(model, locationMain, "기업 커뮤니티");
		model.addAllAttributes(resultMap);
		return "partner/community-partner-list";
	}
	

	// 입주기업 커뮤니티 게시글 작성폼 이동
	@RequestMapping(value = "/community/write/form")
	public String goToCommunityPartnerWriteForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "기업 커뮤니티");
		return "partner/community-partner-write";
	}
	

	// 입주기업 커뮤니티 게시글 작성하기
	@RequestMapping(value = "/community/post/write", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, ?> writeNoticePartnerPosting(@ModelAttribute BoardDTO boardDTO, HttpServletResponse res)
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
		return "partner/community-partner-view";
	}
	

	// 입주기업 커뮤니티 게시글 수정폼 이동
	@RequestMapping(value = "/community/edit/form/{seqId}")
	public String goToCommunityEditView(@PathVariable("seqId") int seqId, Model model) throws Exception {
		String locationSub = null;
		model.addAllAttributes(boardService.getCommunityPartnerPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "입주기업 커뮤니티");
		return "partner/community-partner-edit";
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
		return boardService.saveBoardFile(boardType, multiReq);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}	
