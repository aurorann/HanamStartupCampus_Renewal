package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.service.BoardService;

@Controller
@RequestMapping("/announce")
public class AnnounceController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AnnounceController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private String locationMain = "알림마당";
	
	
	// # 공지사항 리스트 뷰
	@RequestMapping(value="/{boardType}/list")
	public String goToAnnounceBoard(@PathVariable("boardType") String boardType, Model model,
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
		searchOption.put("boardType", boardType);
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		String locationSub = null;
		switch(boardType) {
			case "notice":
				locationSub = "공고";
				break;
			case "agency":
				locationSub = "바이오 정책 · 지원";
				break;
			case "faq":
				locationSub = "자주 묻는 질문";
				break;
		}
		
		Utils.setPageViewLocation(model, locationMain, locationSub);
		model.addAllAttributes(resultMap);
		return "announce/" + boardType + "-list";
	}
	
	// # 공고 게시글 뷰
	@RequestMapping(value="/{boardType}/view/{seqId}")
	public String goToAnnounceView(
			@PathVariable("boardType") String boardType,
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		switch(boardType) {
			case "notice":
				model.addAllAttributes(boardService.getNoticePost(seqId));
				locationSub = "공고";
				break;
			case "agency":
				model.addAllAttributes(boardService.getAgencyPost(seqId));
				locationSub = "바이오 정책 · 지원";
				break;
			case "faq":
				model.addAllAttributes(boardService.getFaqPost(seqId));
				locationSub = "자주 묻는 질문";
				break;
		}
		Utils.setPageViewLocation(model, locationMain, locationSub);
		
		return "announce/" + boardType + "-view";
	}
	
	@RequestMapping(value="/{boardType}/post/list")
	@ResponseBody
	public Map<String, Object> searchPostListByKeyword(@PathVariable("boardType") String boardType, Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		Map<String, Object> searchOption = new HashMap<String, Object>();
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", boardType);
		
		Map<String, Object> resultMap = null;
		String locationSub = null;
		switch(boardType) {
			case "notice":
				LOGGER.debug("get Notice List");
				resultMap = boardService.getNoticePostList(searchOption);
				locationSub = "공고";
				break;
			case "agency":
				resultMap = boardService.getAgencyPostList(searchOption);
				locationSub = "바이오 정책 · 지원";
				break;
			case "faq":
				resultMap = boardService.getFaqPostList(searchOption);
				locationSub = "자주 묻는 질문";
				break;
		}
		
		return resultMap;
	}
}
