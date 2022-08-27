package com.hallabong.rentcarboard.carbasicinfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.carbasicinfo.service.RentCarBoardCarBasicInfoService;
import com.hallabong.rentcarboard.carfileupload.controller.RentCarBoardCarFileUploadController;
import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;
import com.hallabong.rentcarboard.carfileupload.service.RentCarBoardCarFileUploadService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/carbasicinfo")
@Log4j
public class RentCarBoardCarBasicInfoController {

	@Autowired
	@Qualifier("cbi")
	private RentCarBoardCarBasicInfoService service;

	@Autowired
	@Qualifier("cfup")
	private RentCarBoardCarFileUploadService cfupService;
	
	//차량 기본정보
	@GetMapping("/carBasicInfoList.do")
	public String carBasicInfoList(PageObjectCustom pageObject,Model model) throws Exception {
		//key = 매장, word = 차량검색
		
		List<RentCarBoardSynthesizeVO> dto = service.carBasicInfoList(pageObject);
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
		
		return "carbasicinfo/carBasicInfoList";
	}
	
	@GetMapping("/carBasicInfoWrite.do")
	public String carBasicInfoWriteForm() {
		
		
		
		return "carbasicinfo/carBasicInfoWrite";
	}
	//등록 
	@PostMapping("/carBasicInfoWrite.do")
//	public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, CarInsuranceVO carInsuranceVOList, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
//		public String rentCarwrite(CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		public String carBasicInfoWrite(RentCarBoardCarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
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
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		List<RentCarBoardCarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile, carInfoNo);
		
		log.info(list);
		//업로드후 정보 db에 입력
		cfupService.writeCarFileUpload(list);
		
		
		return "redirect:/carbasicinfo/carBasicInfoList.do?";
	}
	
	//차량  기본정보 수정
	@GetMapping("/carBasicInfoUpdate.do")
	public String carBasicInfoUpdateForm(Model model, long carInfoNo) {
		//모든 차량 정보 가져오기
		model.addAttribute("CarBasicInfo", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO",  cfupService.getCarFileUpload(carInfoNo));
		//ajax 로 선택한 회사 정보 가져올 예정
		return "carbasicinfo/carBasicInfoUpdate";
	}

	//수정처리 진행 작업해야함
	@PostMapping("/carBasicInfoUpdate.do")
//	public String rentCarUpdate(@RequestParam(defaultValue = "0") String del,CarsVO carsVO, CarOptionVO carOptionVO, MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
	public String carBasicInfoUpdate(@RequestParam(defaultValue = "0") String del,RentCarBoardCarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile) throws Exception {
		//차 수정, 차옵션 수정
		
		service.updateCarBasicInfo(carBasicInfoVO);
		
		// 파일은 basicInfo 등록, 수정할떄
		// 넘어오는 파일이 없으면 삭제 수정도 되면 안된다 - 지금 파일 인덱스가 1개만 받아오니 0 으로 써도 되긴함/
		// 넘어오는 값이 없으면 true -> true 가 반환되면 파일이 없으면 update가 안되게 해야함
		log.info("파일 넘어온값 확인" + uploadFile[uploadFile.length-1].isEmpty());
		if(!uploadFile[uploadFile.length-1].isEmpty()) {
	
			// 파일 업로드 수정
			RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
			
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
				RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carBasicInfoVO.getCarInfoNo()));
				
				
					
					fileUploadController.delete(fileList);
				//db 삭제
				cfupService.deleteCarFileUpload(carBasicInfoVO.getCarInfoNo());
				
				
			}
	//		다시 업로드한 파일  등록
			List<RentCarBoardCarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile,carBasicInfoVO.getCarInfoNo());
			
			log.info(list);
			//업로드후 정보 db에 입력
			cfupService.writeCarFileUpload(list);
		}//파일이 넘어온 값이 있으면 수정해라
		
		return "redirect:/carbasicinfo/carBasicInfoView.do?carInfoNo="+carBasicInfoVO.getCarInfoNo();
	}
	
	//챠량 기본 정보 보기
	@GetMapping("carBasicInfoView.do")
	public String carBasicInfoView(Model model,  long carInfoNo) {
		
		//carNo 에 해당하는 내용 가져오기 각 vo 별로 들어갈 예정
		log.info("view ..... : "+carInfoNo);
		
		//리스트에서 carInfoNo 도 같이 뽑아둠
		model.addAttribute("carBasicInfoVO", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO", cfupService.getCarFileUpload(carInfoNo));
		
		//차량 이름 등등 있어야함 
		
		
		return "carbasicinfo/carBasicInfoView";
	}
	
	
	//렌트카 사진 삭제
	@PostMapping("/carBasicInfoImageDelete.do")
	public String carBasicInfoImageDelete(@RequestParam(defaultValue = "0") String del,long carInfoNo, MultipartFile[] uploadFile) throws Exception {
		
		//
		log.info("carInfo"+carInfoNo);
		// 파일 업로드 수정
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		
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
			RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carInfoNo));
			
			//실제 파일 삭제
			fileUploadController.delete(fileList);
			//db 삭제
			//db 를 아예 없애면 안됨 - 리스트에 안나옴 db 검색을 엮어놨다
			//update 로 db는 살려놔야함
			cfupService.updateFileUploadForNull(carInfoNo);
			log.info("durl");
		}
		
		
		return "redirect:/carbasicinfo/carBasicInfoView.do?carInfoNo="+carInfoNo;
	}	

	@GetMapping("/carBasicInfoDelete.do")
	public String carBasicInfoDelete(long carInfoNo) throws Exception {
		//사진 삭제 안함
		//먼저 실제 파일 db 정보 가져오기 -> 실제 파일 삭제
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		
		RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carInfoNo));
		//실제 파일삭제
		fileUploadController.delete(fileList);
		//db 삭제 안해도 삭제 될듯
//		service.deleteCarFileUpload(carInfoNo);
	
		
		service.deleteCarBasicInfo(carInfoNo);
		
		
		return "redirect:/carbasicinfo/carBasicInfoList.do";
	}
	
	
}
