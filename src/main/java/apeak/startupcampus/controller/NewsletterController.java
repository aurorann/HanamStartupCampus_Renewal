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
@RequestMapping("/newsletter")
public class NewsletterController {
	private static final Logger LOGGER = LoggerFactory.getLogger(NewsletterController.class);
	
	@Resource(name = "partnerService")
	private PartnerService partnerService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private String locationMain = "뉴스레터";
	
	// [뉴스레터] 관련 메서드
	// # 뉴스레터 리스트 뷰
	@RequestMapping(value="/list")
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
		return "newsletter/list";
	}
	
	// # 뉴스레터 게시글 뷰
	@RequestMapping(value="/view/{seqId}")
	public String goToNewsletterView(
			@PathVariable("seqId")int seqId, Model model) throws Exception {
		model.addAllAttributes(boardService.getNewsletterPost(seqId));
		Utils.setPageViewLocation(model, locationMain, "뉴스레터");
		
		return "newsletter/view";
	}
	
	
	// # 뉴스레터 게시글 서치
	@RequestMapping(value="post/list")
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
	
	
}	
