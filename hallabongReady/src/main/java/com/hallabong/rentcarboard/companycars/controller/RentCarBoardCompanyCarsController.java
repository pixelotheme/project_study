package com.hallabong.rentcarboard.companycars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsSynthesizeVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsVO;
import com.hallabong.rentcarboard.companycars.service.RentCarBoardCompanyCarsService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/companycars")
@Log4j
public class RentCarBoardCompanyCarsController {

	@Autowired
	@Qualifier("ccs")
	private RentCarBoardCompanyCarsService service;
	
	//회사 차량 리스트
	
	@GetMapping("/companyCarsList.do")
	public String companyCarslist(PageObjectCustom pageObject, long carNo,  long companyNo,Model model) {
//	public String companyCarslist(PageObjectCustom pageObject,  long companyNo,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
//		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		List<RentCarBoardCompanyCarsSynthesizeVO> dto = service.getCompanyCarsList(pageObject, carNo, companyNo);
//		List<RentCarBoardCompanyCarsSynthesizeVO> dto = service.getCompanyCarsList(pageObject, companyNo);
		log.info("dto : "+ dto);
		
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "companycars/companyCarsList";
	}
	
	
	//렌트카 회사 등록
	@GetMapping("/companyCarsWrite.do")
	public String companyCarsWriteForm() {
		
		
		
		return "companycars/companyCarsWrite";
	}
	// 번호판 등록
	@PostMapping("/companyCarsWrite.do")
	public String companyCarsWrite(long carNo, long companyNo,long carInfoNo, String[] licensePlate) {
		//carno, companyNo 1개만 받고 licensePlate 는 String [] 로 받으면 간단해질듯, id 는 session에서 
		log.info(carNo);
		log.info(companyNo);
		log.info("번호반 배열 길이"+licensePlate.length+"번호판 배열"+licensePlate.toString());
//		List<CompanyCarsVO> list = null;
		String id = "admin";
		
		
		for(String strLicensePlate : licensePlate) {
//			if(list ==null) list = new ArrayList<CompanyCarsVO>();
			RentCarBoardCompanyCarsVO vo = new RentCarBoardCompanyCarsVO();
			vo.setCarNo(carNo);
			vo.setCompanyNo(companyNo);
			vo.setLicensePlate(strLicensePlate);
			vo.setId(id);
			//일단 리스트에 넣지말고 하나씩 실행하는걸로
			log.info("서비스 시작");
			service.writeCompanyCars(vo);
			log.info("서비스 끝");
			
		}
		
		log.info("for 끝");
		
		return "redirect:/companycars/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
	
	//view
	@GetMapping("companyCarsView.do")
	public String companyCarsView(Model model, long companyCarsNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		
		
		return "companycars/companyCarsView";
	}
	
	//update
	@GetMapping("companyCarsUpdate.do")
	public String companyCarsUpdateForm(Model model,long companyCarsNo) {
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("update ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		return "companycars/companyCarsUpdate";
	}
	//update
	@PostMapping("companyCarsUpdate.do")
	public String companyCarsUpdate(RentCarBoardCompanyCarsVO companyCarsVO,long carInfoNo) {
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("update ..... : "+ companyCarsVO);
		service.updateCompanyCars(companyCarsVO);
		
		return "redirect:/companycars/companyCarsView.do?companyCarsNo="+companyCarsVO.getCompanyCarsNo()+"&carNo="+companyCarsVO.getCarNo()+"&companyNo="+companyCarsVO.getCompanyNo()+"&carInfoNo="+carInfoNo;
	}
	// 번호판 삭제
	@GetMapping("/companyCarsDelete.do")
	public String companyCarsDelete(long carNo, long companyNo,long carInfoNo,long companyCarsNo ) {
		//carno, companyNo 1개만 받고 licensePlate 는 String [] 로 받으면 간단해질듯, id 는 session에서 
		
		service.deleteCompanyCars(companyCarsNo);
		
		return "redirect:/companycars/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
}
