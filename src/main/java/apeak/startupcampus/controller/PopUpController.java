package apeak.startupcampus.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import apeak.startupcampus.common.Utils;
import apeak.startupcampus.model.dto.PopUpDTO;
import apeak.startupcampus.service.PopUpService;

@Controller
@RequestMapping("/popUp")
public class PopUpController {
	
	@Resource(name = "popUpService")
	private PopUpService popUpService;
	
	private String locationMain = "관리자 메뉴";
	
	//팝업목록 페이지를 호출한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/popUpList")
	public String popUpList(Model model) {
		
		Utils.setPageViewLocation(model, locationMain, "팝업 관리");
		return "admin/popUpList";
	}
	
	//페이징된 팝업 목록을 호출한다.
	@RequestMapping("/getPopUpList")
	@ResponseBody
	public Map<String, Object> getPopUpList(int curPage, Model model){
		Utils.setPageViewLocation(model, locationMain, "팝업 관리");
		return popUpService.getPopUpList(curPage);
	}
	
	
	//팝업 보기 및 수정 폼을 호출한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/updatePopUpForm")
	public String updateForm(int num, Model model) {
		
		PopUpDTO dto = popUpService.getPopUpOne(num);
		
		model.addAttribute("dto", dto);
		
		Utils.setPageViewLocation(model, locationMain, "팝업 관리");
		return "admin/updatePopUpForm";
	}
	
	//팝업을 수정한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/updatePopUp")
	public String updatePopUp(PopUpDTO dto, Model model) throws Exception {
		popUpService.updatePopUp(dto);
		
		Utils.setPageViewLocation(model, locationMain, "팝업 관리");
		return "redirect:/admin/popUpList";
	}
	
	//팝업 작성 폼을 호출한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/insertPopUpForm")
	public String insertPopupForm(Model model) {
		Utils.setPageViewLocation(model, locationMain, "팝업 관리");
		return "admin/insertPopUpForm";
	}
	
	
	//팝업을 등록한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/insertPopUp")
	public String insertPopUp(PopUpDTO dto) throws Exception {
		popUpService.insertPopUp(dto);
		
		return "redirect:/admin/popUpList";
	}
	
	//팝업을 삭제한다.
	@Secured("ROLE_ADMIN")
	@RequestMapping("/deletePopUp")
	public String deletePopUp(int num) throws Exception {
		
		popUpService.deletePopUp(num);
		
		return "redirect:/admin/popUpList";
	}
	
	
}