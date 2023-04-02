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
@RequestMapping("/gallery")
public class GalleryController {
	private static final Logger LOGGER = LoggerFactory.getLogger(GalleryController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private String locationMain = "아카이브";
	
	// # 갤러리 리스트 뷰
	@RequestMapping(value="/{boardType}/list")
	public String goToGalleryBoard(@PathVariable("boardType") String boardType, Model model,
			@RequestParam(value="curPage", defaultValue="1") int curPage,
			@RequestParam(value="searchType", defaultValue="NONE") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword ) throws Exception {
		LOGGER.debug("LIST ARRIVED");
		Map<String, Object> searchOption = new HashMap<String, Object>();
		if(curPage == 0) {
			curPage = 1;
		}
		
		String locationSub = null;
		switch(boardType) {
			case "press":
				locationSub = "보도자료";
				break;
			case "promotion":
				locationSub = "홍보자료";
				break;
			case "bio-info":
				locationSub = "바이오 소식";
				break;
		}
		
		searchOption.put("curPage", curPage);
		searchOption.put("searchType", searchType);
		searchOption.put("keyword", keyword);
		searchOption.put("boardType", boardType);
		LOGGER.debug(searchOption.toString());
		
		Map<String, Object> resultMap = boardService.getBoardSearchOption(searchOption);
		LOGGER.debug(resultMap.toString());
		
		Utils.setPageViewLocation(model, locationMain, locationSub);
		model.addAllAttributes(resultMap);
		return "gallery/" + boardType + "-list";
	}
	
	// # 갤러리 게시글 뷰
	@RequestMapping(value="/{boardType}/view/{seqId}")
	public String goToGalleryView(
			@PathVariable("boardType") String boardType,
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		String locationSub = null;
		switch(boardType) {
			case "press":
				model.addAllAttributes(boardService.getPressPost(seqId));
				locationSub = "보도자료";
				break;
			case "promotion":
				model.addAllAttributes(boardService.getPromotionPost(seqId));
				locationSub = "홍보자료";
				break;
			case "bio-info":
				model.addAllAttributes(boardService.getBioInfoPost(seqId));
				locationSub = "바이오 소식";
				break;
		}
		Utils.setPageViewLocation(model, locationMain, locationSub);
		
		return "gallery/" + boardType + "-view";
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
			case "press":
				resultMap = boardService.getPressPostList(searchOption);
				locationSub = "보도자료";
				break;
			case "promotion":
				resultMap = boardService.getPromotionPostList(searchOption);
				locationSub = "홍보자료";
				break;
			case "bio-info":
				resultMap = boardService.getBioInfoPostList(searchOption);
				locationSub = "바이오 소식";
				break;
		}
		
		return resultMap;
	}
}
