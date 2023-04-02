package apeak.startupcampus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import apeak.startupcampus.common.Utils;

@Controller
@RequestMapping("/program")
public class ProgramController {
	
	private static final String locationMain = "사업 안내"; 
	
	@RequestMapping(value="/{viewType}")
	public String goToEachView(@PathVariable("viewType") String viewType ,Model model) {
		switch(viewType) {
		case "supporting":
			Utils.setPageViewLocation(model, locationMain, "스타트업 사업화 패키지 지원사업");
			break;
		case "accelerating":
			Utils.setPageViewLocation(model, locationMain, "액셀러레이팅 프로그램");
			break;
		case "training":
			Utils.setPageViewLocation(model, locationMain, "스타트업 전문교육");
			break;
		case "competition":
			Utils.setPageViewLocation(model, locationMain, "하남도시공사 창업경진대회");
			break;
		case "empowering":
			Utils.setPageViewLocation(model, locationMain, "투자유치 역량 강화 프로그램");
			break;
		// 23.03.29 신규 사업 안내 추가
		case "networking":
			Utils.setPageViewLocation(model, locationMain, "네트워킹 데이");
			break;
		case "mentoring":
			Utils.setPageViewLocation(model, locationMain, "멘토링 프로그램");
			break;
		case "membership":
			Utils.setPageViewLocation(model, locationMain, "스타트업캠퍼스 멤버쉽 프로그램");
			break;
		}
		return "program/" + viewType;
	}
}
