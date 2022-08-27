package com.hallabong.rentcarboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.service.RentCarBoardCarBasicInfoService;
import com.hallabong.rentcarboard.carfileupload.service.RentCarBoardCarFileUploadService;
import com.hallabong.rentcarboard.carinsurance.service.RentCarBoardCarInsuranceService;
import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;
import com.hallabong.rentcarboard.caroption.service.RentCarBoardCarOptionService;
import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.rentcarcompany.service.RentCarBoardRentCarCompanyService;
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
	
	@Autowired
	@Qualifier("rcc")
	private RentCarBoardRentCarCompanyService rccService;
	
	@Autowired
	@Qualifier("cbi")
	private RentCarBoardCarBasicInfoService cbiService;

	@Autowired
	@Qualifier("cop")
	private RentCarBoardCarOptionService copService;

	@Autowired
	@Qualifier("cis")
	private RentCarBoardCarInsuranceService cisService;
	
	@Autowired
	@Qualifier("cfup")
	private RentCarBoardCarFileUploadService cfupService;
	
	
	
	
	@GetMapping("/rentCarBoardList.do")
	public String list(PageObjectCustom pageObject,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
//		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		log.info("dto : "+ dto);
		
		//검색을 위한 전체회사 정보가져오기 
		model.addAttribute("companys", rccService.getAllCompany());
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/rentCarBoardList";
	}
	//렌트카 보기 // 옵션, 보험, 파일업로드 까지 끝내고 마지막에
	@GetMapping("rentCarBoardView.do")
	public String view(Model model, long carNo, long carInfoNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+carNo);
		model.addAttribute("companyVO", rccService.getCompany(carNo)); //완료
		model.addAttribute("carsVO", service.getCars(carNo));
		
		//리스트에서 carInfoNo 도 같이 뽑아둠
		model.addAttribute("carBasicInfoVO", cbiService.getCarBasicInfo(carInfoNo)); // 완료
		
		model.addAttribute("carOptionVO", copService.getCarOption(carNo)); //완료
		model.addAttribute("carInsuranceVO", cisService.getCarInsurance(carNo)); //완료
		model.addAttribute("carFileUploadVO", cfupService.getCarFileUpload(carInfoNo)); //완료
		
		//차량 이름 등등 있어야함 
		return "rentcarboard/rentCarBoardView";
	}
	
	
	@GetMapping("/rentCarBoardWrite.do")
	public String rentCarwriteForm(Model model) {
		
		//모든 회사 가져오기
		model.addAttribute("companys", rccService.getAllCompany());
		//모든 차량 정보 가져오기
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		return "rentcarboard/rentCarBoardWrite";
	}
	//등록 
	@PostMapping("/rentCarBoardWrite.do")
//	public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, CarInsuranceVO carInsuranceVOList, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
//		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		public String rentCarwrite(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO) throws Exception {
		log.info("rentCarWrite"+carsVO);
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info("rentCarWrite"+carsVO);
		//차량 등록후 등록된 번호 가져오기
		carsVO.setId("admin");
		
		//차량 등록 후 등록한 차번호
		int result = service.writeCarGetCarNo(carsVO);
		log.info("result" + result);
		//파일 업로드위해서
		long carInfoNo = carsVO.getCarInfoNo();
		//차 옵션 등록 위해서
		long carNo = carsVO.getCarNo();
		
		//차옵션 등록
		log.info(carOptionVO);
		copService.writeCarOption(carOptionVO, carNo);
		
		return "redirect:/carinsurance/carInsuranceWrite.do?carNo="+carNo;
	}		
	
	//렌트카 수정
	@GetMapping("/rentCarBoardUpdate.do")
	public String rentCarUpdateForm(Model model, long carNo) {
		//모든 회사 가져오기
		model.addAttribute("companys", rccService.getAllCompany());
		//모든 차량 정보 가져오기
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		
		model.addAttribute("carsVO", service.getCars(carNo));
		model.addAttribute("carOptionVO", copService.getCarOption(carNo));
		model.addAttribute("carFileUploadVO",  cfupService.getCarFileUpload(carNo));
		//ajax 로 선택한 회사 정보 가져올 예정
		return "rentcarboard/rentCarBoardUpdate";
	}

	@PostMapping("/rentCarBoardUpdate.do")
//	public String rentCarUpdate(@RequestParam(defaultValue = "0") String del,CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
	public String rentCarUpdate(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO) throws Exception {
		//차 수정, 차옵션 수정
		log.info(carsVO );
		carsVO.setId("admin");
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info(carsVO );
		log.info(carOptionVO);
		log.info(carBasicInfoVO );
		
		//차 업데이트
		int updateResult = service.updateCar(carsVO);
		log.info(updateResult+"carOptionVO" + carOptionVO);
		//차 옵션 업데이트
		updateResult += copService.updateCarOption(carOptionVO);
		log.info(updateResult);
		
		
		
		return "redirect:/rentcarboard/rentCarBoardView.do?carNo="+carsVO.getCarNo()+"&carInfoNo="+carBasicInfoVO.getCarInfoNo();
	}
	
	@GetMapping("/rentCarBoardDelete.do")
	public String deleteCar(long carNo) throws Exception {
		//사진 삭제 안함
		//먼저 실제 파일 db 정보 가져오기 -> 실제 파일 삭제
//		CarFileUploadVO fileName = service.getCarFileUpload(carNo);
//		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
//		fileUploadController.delete(fileName);
		//차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
		service.deleteCar(carNo);
		
		
		return "redirect:/rentcarboard/rentCarBoardList.do";
	}
	
}
