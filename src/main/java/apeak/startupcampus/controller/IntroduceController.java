package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.service.BoardService;

@Controller
@RequestMapping("/introduce")
public class IntroduceController {
	private static final Logger LOGGER = LoggerFactory.getLogger(IntroduceController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private String locationMain = "캠퍼스 소개";
	
	@RequestMapping(value="/greeting")
	public String goToGreeting(Model model) {
		Utils.setPageViewLocation(model, locationMain, "인사말");
		return "introduce/greeting";
	}
	
	@RequestMapping(value="/profile")
	public String goToProfile(Model model) throws Exception {
		model.addAllAttributes(boardService.getPageContent("100"));
		Utils.setPageViewLocation(model, locationMain, "캠퍼스 개요");
		return "introduce/profile";
	}
	
	@RequestMapping(value="/facility")
	public String goTofacility(Model model) {
		Utils.setPageViewLocation(model, locationMain, "시설 안내");
		return "introduce/facility";
	}
	
	@RequestMapping(value="/contract")
	public String goToContract(Model model) throws Exception {
		model.addAllAttributes(boardService.getPageContent("101"));
		Utils.setPageViewLocation(model, locationMain, "조직도");
		return "introduce/contract";
	}
	
	@RequestMapping(value="/direction")
	public String goToDirection(Model model) {
		Utils.setPageViewLocation(model, locationMain, "오시는 길");
		return "introduce/direction";
	}
	
	// # 소개 / 동영상 리스트 뷰
	@RequestMapping(value="/media/list")
	public String goToMediaList(Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		searchOption.put("boardType", "media");
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, "소개 영상");
		model.addAllAttributes(resultMap);
		return "introduce/media-list";
	}
	
	// # 소개 / 동영상 게시글 뷰
	@RequestMapping(value="/media/view/{seqId}")
	public String goToIntroduceMediaView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getMediaPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "소개 영상");
		
		return "introduce/media-view";
	}
	
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
		searchOption.put("boardType", "media");
		
		Map<String, Object> resultMap = boardService.getMediaPostList(searchOption);
		
		return resultMap;
	}
	
	
	@RequestMapping(value="/join")
	public String goToJoin(Model model) {
		Utils.setPageViewLocation(model, locationMain, "입주신청");
		return "introduce/join";
	}
	
}
