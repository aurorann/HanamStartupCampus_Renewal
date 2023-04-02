package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
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
	
	private String locationMain = "입주기업·졸업기업";
	
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
		
		String locationSub = "기업 활동";
		
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
}	
