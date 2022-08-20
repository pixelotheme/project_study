package com.hallabong.rentcarboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.fileupload.controller.RentCarBoardFileUploadController;
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
	
	@GetMapping("/rentCarWrite.do")
	public String rentCarwriteForm(Model model) {
		
		//모든 회사 가져오기
		model.addAttribute("companys", service.getAllCompany());
		
		return "rentcarboard/rentCarWrite";
	}
	//등록 
	@PostMapping("/rentCarWrite.do")
//	public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, CarInsuranceVO carInsuranceVOList, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		log.info("rentCarWrite"+carsVO);
		//차량 등록후 등록된 번호 가져오기
		carsVO.setId("admin");
		int result = service.writeCarGetCarNo(carsVO);
		log.info("result" + result);
		
		long carNo = carsVO.getCarNo();
		
		//차옵션
		log.info(carOptionVO);
		service.writeCarOption(carOptionVO, carNo);
		
		
		
//		log.info(carInsuranceVOList);
//		for (CarInsuranceVO carInsuranceVO : carInsuranceVOList.getCarInsuranceVOList()) {
//			
//		log.info(carInsuranceVO);
//		//차보험내용 - cars 에서 자차 미포함시 값이 넘어와도 공백으로해야함, list형식으로 2개 들어올떄도 있다 배열처리하자
//		service.writeCarInsurance(carInsuranceVO, carNo);
//		}
		
		//파일업로드
		log.info(uploadFile);
		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
		List<CarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile, request, carNo);
		
		log.info(list);
		//업로드후 정보 db에 입력
		service.writeCarFileUpload(list);
		
		
		
		
		return "redirect:/rentcarboard/carInsuranceWrite.do?carNo="+carNo;
	}
	
	@GetMapping("/carInsuranceWrite.do")
	public String carInsurancewriteForm() {
		
		
		
		return "rentcarboard/carInsuranceWrite";
	}
	
}
