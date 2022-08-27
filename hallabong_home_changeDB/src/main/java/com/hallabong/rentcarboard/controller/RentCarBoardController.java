package com.hallabong.rentcarboard.controller;

import java.awt.font.TextLayout.CaretPolicy;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.hallabong.rentcarboard.domain.CarBasicInfoVO;
import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.CompanyCarsVO;
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
		
		//검색을 위한 전체회사 정보가져오기 
		model.addAttribute("companys", service.getAllCompany());
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/list";
	}
	//렌트카 보기
	@GetMapping("view.do")
	public String view(Model model, long carNo, long carInfoNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+carNo);
		model.addAttribute("companyVO", service.getCompany(carNo));
		model.addAttribute("carsVO", service.getCars(carNo));
		
		//리스트에서 carInfoNo 도 같이 뽑아둠
		model.addAttribute("carBasicInfoVO", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carOptionVO", service.getCarOption(carNo));
		model.addAttribute("carInsuranceVO", service.getCarInsurance(carNo));
		model.addAttribute("carFileUploadVO", service.getCarFileUpload(carInfoNo));
		
		//차량 이름 등등 있어야함 
		
		
		return "rentcarboard/view";
	}
	
//렌트카 회사 리스트
	@GetMapping("/rentCarCompanyList.do")
	public String rentCarCompanyList(PageObjectCustom pageObject,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
//		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		List<RentCarCompanyVO> vo = service.rentCarCompanyList(pageObject);
		log.info("dto : "+ vo);
		
		//검색을 위한 전체회사 정보가져오기 
		
		
		model.addAttribute("list", vo);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/rentCarCompanyList";
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
		//모든 차량 정보 가져오기
		model.addAttribute("allCarBasicInfo", service.getAllCarBasicInfo());
		return "rentcarboard/rentCarWrite";
	}
	//등록 
	@PostMapping("/rentCarWrite.do")
//	public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, CarInsuranceVO carInsuranceVOList, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
//		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO,CarBasicInfoVO carBasicInfoVO) throws Exception {
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
		service.writeCarOption(carOptionVO, carNo);
		
		
		//보험은 ajax에서 처리
//		log.info(carInsuranceVOList);
//		for (CarInsuranceVO carInsuranceVO : carInsuranceVOList.getCarInsuranceVOList()) {
//			
//		log.info(carInsuranceVO);
//		//차보험내용 - cars 에서 자차 미포함시 값이 넘어와도 공백으로해야함, list형식으로 2개 들어올떄도 있다 배열처리하자
//		service.writeCarInsurance(carInsuranceVO, carNo);
//		}
		
		
		
		
		
		
		return "redirect:/rentcarboard/carInsuranceWrite.do?carNo="+carNo;
	}
	
	@GetMapping("/carInsuranceWrite.do")
	public String carInsurancewriteForm() {
		
		
		
		return "rentcarboard/carInsuranceWrite";
	}
	
	
	//렌트카 회사 수정
	@GetMapping("/rentCarCompanyUpdate.do")
	public String rentCarCompanyUpdateForm(Model model) {
		//모든 회사 가져오기
		model.addAttribute("companyVO", service.getAllCompany());

		//ajax 로 선택한 회사 정보 가져올 예정
		return "rentcarboard/rentCarCompanyUpdate";
	}

	@PostMapping("/rentCarCompanyUpdate.do")
	public String rentCarCompanyUpdate(RentCarCompanyVO vo) {
		log.info("vo 찍기"+vo);
		vo.setAddress(vo.getZipcode()+"/"+vo.getStreetAdr()+"/"+vo.getDetailAdr());
		vo.setId("admin");
		
		service.updateRentCarCompany(vo);
		return "redirect:/rentcarboard/list.do";
	}
	

	
	//렌트카 수정
	@GetMapping("/rentCarUpdate.do")
	public String rentCarUpdateForm(Model model, long carNo) {
		//모든 회사 가져오기
		model.addAttribute("companys", service.getAllCompany());
		//모든 차량 정보 가져오기
		model.addAttribute("allCarBasicInfo", service.getAllCarBasicInfo());
		
		model.addAttribute("carsVO", service.getCars(carNo));
		model.addAttribute("carOptionVO", service.getCarOption(carNo));
		model.addAttribute("carFileUploadVO",  service.getCarFileUpload(carNo));
		//ajax 로 선택한 회사 정보 가져올 예정
		return "rentcarboard/rentCarUpdate";
	}

	@PostMapping("/rentCarUpdate.do")
//	public String rentCarUpdate(@RequestParam(defaultValue = "0") String del,CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
	public String rentCarUpdate(CarsVO carsVO, CarOptionVO carOptionVO,CarBasicInfoVO carBasicInfoVO) throws Exception {
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
		updateResult += service.updateCarOption(carOptionVO);
		log.info(updateResult);
		
		
		
		return "redirect:/rentcarboard/view.do?carNo="+carsVO.getCarNo()+"&carInfoNo="+carBasicInfoVO.getCarInfoNo();
	}
	
	// 차 보험 상세 수정
	@GetMapping("/carInsuranceUpdate.do")
	public String carInsuranceUpdateForm(Model model, long carNo) {
		
		
		// 보험이 없으면 꺼내와 지지도 않으니
		
		//보험 [1] 의 번호가 없다면 null 대신 공백 넣어주기
		List<CarInsuranceVO> carInsuranceVO = service.getCarInsurance(carNo);

		log.info("여기"+carInsuranceVO.get(0));
		//0인 경우도 없으니 설정
//		if(carInsuranceVO.size() == 0) {
//			log.info("size가 0 이다");
//			return "redirect:carInsuranceWrite.do?carNo="+carNo;
//		}
		
		if(carInsuranceVO.size() == 1) {
			log.info("size 가  1 이다");
			CarInsuranceVO vo = new CarInsuranceVO();
			vo.setInsuranceNo(0);
			
			carInsuranceVO.add(vo);
			log.info("두번째 값이 없을때 0 으로 세팅" + carInsuranceVO.get(1));
		}
		
		model.addAttribute("carInsuranceVO", carInsuranceVO);
		
		return "rentcarboard/carInsuranceUpdate";
	}
	

	
// 회사 삭제, 이제 사진 남아있다	
	@GetMapping("/companyDelete.do")
	public String deleteCompany(long companyNo) throws Exception {
//		List<CarFileUploadVO> fileNameList = service.getDeleteFileUpload(companyNo);
		service.deleteCompany(companyNo);
		
		//회사 삭제되면 해당 자량 정보 모두 삭제 -> 사진까지 삭제 -> 회사 번호가 같은 차량번호만 가져오기 -> 차량번호와 같은 파일업로드 데이터 List로 가져오기
//		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
//		
//		fileUploadController.deletemulti(fileNameList);
		
		return "redirect:/rentcarboard/list.do";
	}
	
	@GetMapping("/deleteCar.do")
	public String deleteCar(long carNo) throws Exception {
		//사진 삭제 안함
		//먼저 실제 파일 db 정보 가져오기 -> 실제 파일 삭제
//		CarFileUploadVO fileName = service.getCarFileUpload(carNo);
//		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
//		fileUploadController.delete(fileName);
		//차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
		service.deleteCar(carNo);
		
		
		return "redirect:/rentcarboard/list.do";
	}
	
	//차량 기본정보
	@GetMapping("/carBasicInfoList.do")
	public String carBasicInfoList(PageObjectCustom pageObject,Model model) throws Exception {
		//key = 매장, word = 차량검색
		
		List<RentCarSynthesizeDTO> dto = service.carBasicInfoList(pageObject);
		//
		
		log.info("dto : "+ dto);
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		//이미지도 나와야한다 - 이미지를 실제폴더의 리소스로 저장
//		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
//		List<byte[]> fileResource = null;
//		for(RentCarSynthesizeDTO getDto : dto) {
//			fileResource.add(fileUploadController.getFile(getDto.getRealSavePath(), getDto.getFileName()));
//		}
//		WebConfig web = new WebConfig();
//		web.addResourceHandlers(registry);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/carBasicInfoList";
	}
	
	@GetMapping("/carBasicInfoWrite.do")
	public String carBasicInfoWriteForm() {
		
		
		
		return "rentcarboard/carBasicInfoWrite";
	}
	//등록 
	@PostMapping("/carBasicInfoWrite.do")
//	public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, CarInsuranceVO carInsuranceVOList, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
//		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		public String carBasicInfoWrite(CarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		//carBasicInfoVO 의 번호를 업로드 vo db 넣어줄때 넘겨준다
		
		service.writeCarBasicInfoGetCarInfoNo(carBasicInfoVO);
		
		log.info("carBasicInfoWrite"+carBasicInfoVO);
		carBasicInfoVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info("rentCarWrite"+carBasicInfoVO);
		//차량 등록후 등록된 번호 가져오기
		
		//차량 등록 후 등록한 차번호
		//파일 업로드위해서
		long carInfoNo = carBasicInfoVO.getCarInfoNo();
		
		
		//파일업로드- 차량 기본정보 등록때
		log.info(uploadFile);
		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
		List<CarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile, carInfoNo);
		
		log.info(list);
		//업로드후 정보 db에 입력
		service.writeCarFileUpload(list);
		
		
		return "redirect:/rentcarboard/carBasicInfoList.do?";
	}
	
	//차량  기본정보 수정
	@GetMapping("/carBasicInfoUpdate.do")
	public String carBasicInfoUpdateForm(Model model, long carInfoNo) {
		//모든 차량 정보 가져오기
		model.addAttribute("CarBasicInfo", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO",  service.getCarFileUpload(carInfoNo));
		//ajax 로 선택한 회사 정보 가져올 예정
		return "rentcarboard/carBasicInfoUpdate";
	}

	//수정처리 진행 작업해야함
	@PostMapping("/carBasicInfoUpdate.do")
//	public String rentCarUpdate(@RequestParam(defaultValue = "0") String del,CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
	public String carBasicInfoUpdate(@RequestParam(defaultValue = "0") String del,CarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile) throws Exception {
		//차 수정, 차옵션 수정
		
		service.updateCarBasicInfo(carBasicInfoVO);
		
		// 파일은 basicInfo 등록, 수정할떄
		// 넘어오는 파일이 없으면 삭제 수정도 되면 안된다 - 지금 파일 인덱스가 1개만 받아오니 0 으로 써도 되긴함/
		// 넘어오는 값이 없으면 true -> true 가 반환되면 파일이 없으면 update가 안되게 해야함
		log.info("파일 넘어온값 확인" + uploadFile[uploadFile.length-1].isEmpty());
		if(!uploadFile[uploadFile.length-1].isEmpty()) {
	
			// 파일 업로드 수정
			RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
			
			boolean fileCheck = false;
			//write + del 서비스 2개가 되어야함 del먼저 만들자
			//배열이 있으면 기존 db 정보삭제, 실제파일 삭제 + 파일업로드
			//없으면(기존에 파일이 없다는뜻 ) 파일 업로드만 
			//하나가 있다면 디폴트는 무조건 안들어감, 없다면 디폴트가 0일것
			if(del != "0") {
				fileCheck = true;
				//기존에 파일이 있다
			}
			
			if(fileCheck) {
				//db에서 파일 이름을 먼저 가져온다
				CarFileUploadVO fileList = (service.getCarFileUpload(carBasicInfoVO.getCarInfoNo()));
				
				
					
					fileUploadController.delete(fileList);
				//db 삭제
				service.deleteCarFileUpload(carBasicInfoVO.getCarInfoNo());
				
				
			}
	//		다시 업로드한 파일  등록
			List<CarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile,carBasicInfoVO.getCarInfoNo());
			
			log.info(list);
			//업로드후 정보 db에 입력
			service.writeCarFileUpload(list);
		}//파일이 넘어온 값이 있으면 수정해라
		
		return "redirect:/rentcarboard/carBasicInfoList.do";
	}
	
	//챠량 기본 정보 보기
	@GetMapping("carBasicInfoView.do")
	public String carBasicInfoView(Model model,  long carInfoNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+carInfoNo);
		
		//리스트에서 carInfoNo 도 같이 뽑아둠
		model.addAttribute("carBasicInfoVO", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO", service.getCarFileUpload(carInfoNo));
		
		//차량 이름 등등 있어야함 
		
		
		return "rentcarboard/carBasicInfoView";
	}
	
	
	//렌트카 사진 삭제
	@PostMapping("/carBasicInfoImageDelete.do")
	public String carBasicInfoImageDelete(@RequestParam(defaultValue = "0") String del,long carInfoNo, MultipartFile[] uploadFile) throws Exception {
		
		//
		log.info("carInfo"+carInfoNo);
		// 파일 업로드 수정
		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
		
		boolean fileCheck = false;
		//write + del 서비스 2개가 되어야함 del먼저 만들자
		//배열이 있으면 기존 db 정보삭제, 실제파일 삭제 + 파일업로드
		//없으면(기존에 파일이 없다는뜻 ) 파일 업로드만 
		//하나가 있다면 디폴트는 무조건 안들어감, 없다면 디폴트가 0일것
		if(del != "0") {
			fileCheck = true;
			//기존에 파일이 있다
		}
		
		if(fileCheck) {
			//db에서 파일 이름을 먼저 가져온다
			CarFileUploadVO fileList = (service.getCarFileUpload(carInfoNo));
			
			//실제 파일 삭제
			fileUploadController.delete(fileList);
			//db 삭제
			//db 를 아예 없애면 안됨 - 리스트에 안나옴 db 검색을 엮어놨다
			//update 로 db는 살려놔야함
			service.updateFileUploadForNull(carInfoNo);
			log.info("durl");
		}
		
		
		return "redirect:/rentcarboard/carBasicInfoView.do?carInfoNo="+carInfoNo;
	}	

	@GetMapping("/carBasicInfoDelete.do")
	public String carBasicInfoDelete(long carInfoNo) throws Exception {
		//사진 삭제 안함
		//먼저 실제 파일 db 정보 가져오기 -> 실제 파일 삭제
		RentCarBoardFileUploadController fileUploadController = new RentCarBoardFileUploadController();
		
		CarFileUploadVO fileList = (service.getCarFileUpload(carInfoNo));
		//실제 파일삭제
		fileUploadController.delete(fileList);
		//db 삭제 안해도 삭제 될듯
//		service.deleteCarFileUpload(carInfoNo);
	
		
		service.deleteCarBasicInfo(carInfoNo);
		
		
		return "redirect:/rentcarboard/carBasicInfoDelete.do";
	}
	
	
	//회사 차량 리스트
	
	@GetMapping("/companyCarsList.do")
	public String companyCarslist(PageObjectCustom pageObject, long carNo,  long companyNo,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
//		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		List<RentCarSynthesizeDTO> dto = service.getCompanyCarsList(pageObject, carNo, companyNo);
		log.info("dto : "+ dto);
		
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/companyCarsList";
	}
	
	
	//렌트카 회사 등록
	@GetMapping("/companyCarsWrite.do")
	public String companyCarsWriteForm() {
		
		
		
		return "rentcarboard/companyCarsWrite";
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
			CompanyCarsVO vo = new CompanyCarsVO();
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
		
		return "redirect:/rentcarboard/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
	
	//view
	@GetMapping("companyCarsView.do")
	public String companyCarsView(Model model, long companyCarsNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		
		
		return "rentcarboard/companyCarsView";
	}
	
	//update
	@GetMapping("companyCarsUpdate.do")
	public String companyCarsUpdateForm(Model model,long companyCarsNo) {
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("update ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		return "rentcarboard/companyCarsUpdate";
	}
	//update
	@PostMapping("companyCarsUpdate.do")
	public String companyCarsUpdate(CompanyCarsVO companyCarsVO,long carInfoNo) {
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("update ..... : "+ companyCarsVO);
		service.updateCompanyCars(companyCarsVO);
		
		return "redirect:/rentcarboard/companyCarsView.do?companyCarsNo="+companyCarsVO.getCompanyCarsNo()+"&carNo="+companyCarsVO.getCarNo()+"&companyNo="+companyCarsVO.getCompanyNo()+"&carInfoNo="+carInfoNo;
	}
	// 번호판 삭제
	@GetMapping("/companyCarsDelete.do")
	public String companyCarsDelete(long carNo, long companyNo,long carInfoNo,long companyCarsNo ) {
		//carno, companyNo 1개만 받고 licensePlate 는 String [] 로 받으면 간단해질듯, id 는 session에서 
		
		service.deleteCompanyCars(companyCarsNo);
		
		return "redirect:/rentcarboard/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
}
