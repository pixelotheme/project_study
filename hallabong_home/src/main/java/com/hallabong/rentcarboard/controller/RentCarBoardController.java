package com.hallabong.rentcarboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.service.RentCarBoardService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarboard")
@Log4j
public class RentCarBoardController {

	@Autowired
	@Qualifier("rcbsi")
	private RentCarBoardService service;
	
	@GetMapping("/list.do")
	public String list(PageObjectCustom pageObject,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
//		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		log.info("dto : "+ dto);
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		return "rentcarboard/list";
	}
	
	@GetMapping("view.do")
	public String view(Model model, long carNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+carNo);
		model.addAttribute("companyVO", service.getCompany(carNo));
		model.addAttribute("carsVO", service.getCars(carNo));
		model.addAttribute("carOptionVO", service.getCarOption(carNo));
		model.addAttribute("carInsuranceVO", service.getCarInsurance(carNo));
		model.addAttribute("carFileUploadVO", service.getCarFileUpload(carNo));
		
		
		return "rentcarboard/view";
	}
	
	//렌트카 회사 등록
	@GetMapping("/rentCarCompanyWrite.do")
	public String rentCarCompanyWriteForm() {
		
		return "rentcarboard/rentCarCompanyWrite";
	}

	@PostMapping("/rentCarCompanyWrite.do")
	public String rentCarCompanyWrite(RentCarCompanyVO vo) {
		log.info("vo 찍기"+vo);
		vo.setAddress(vo.getZipcode()+"/"+vo.getStreetAdr()+"/"+vo.getDetailAdr());
		vo.setId("admin");
		
		service.writeRentCarCompany(vo);
		return "redirect:/rentcarboard/list.do";
	}
}
