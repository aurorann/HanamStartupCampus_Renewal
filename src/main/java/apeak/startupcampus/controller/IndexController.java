package apeak.startupcampus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dto.BoardDTO;
import apeak.startupcampus.model.dto.FamilySiteDTO;
import apeak.startupcampus.model.dto.PopUpDTO;
import apeak.startupcampus.service.BoardService;
import apeak.startupcampus.service.FamilySiteService;
import apeak.startupcampus.service.PopUpService;

@Controller
@RequestMapping("/")
public class IndexController {
	private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);
	
	private String locationMain = "검색 결과";
	
	@Resource(name="popUpService")
	private PopUpService popUpService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="familySiteService")
	private FamilySiteService familySiteService;
	
	@RequestMapping(value="/")
	public String goToIndexByDefault(Model model) {
		return "redirect:/home";
	}
	
	@RequestMapping(value="/home")
	public String goToIndexByHome(Model model) {
		
		List<PopUpDTO> popUpList = popUpService.usingPopUpList();
		
		model.addAttribute("popUpList", popUpList);
		
		return "home/index";
	}
	
	@RequestMapping(value="/search/total/list")
	public String goToTotalSearchView(@RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		Utils.setPageViewLocation(model, locationMain, "전체 검색");
		model.addAttribute("keyword", keyword);
		return "home/search-total";
	}
	
	@RequestMapping(value="/search/toatal/post/list")
	@ResponseBody
	public List<BoardDTO> searchPostListAllByKeyword(@RequestParam(value="keyword", defaultValue="") String keyword) throws Exception {
		return boardService.getTotalPostList(keyword);
	}
	
	@RequestMapping(value="/family-site/site/list")
	@ResponseBody
	public List<FamilySiteDTO> getFamilySiteList() throws Exception {
		return familySiteService.getFamilySiteList();
	}

}
