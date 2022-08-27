package com.hallabong.rentcarboard.ajax.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hallabong.rentcarboard.ajax.service.RentCarBoardAjaxService;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;

import lombok.extern.log4j.Log4j;

@RestController//ajax 사용할거라 controller 로 쓰면 안되고 restController 로한다 - 출력해서 돌려줄때(return) responsebody 로 순수한 데이터로 넘겨줄수있다
@RequestMapping("/rentcarboardajaxcontroller")
@Log4j
public class RentCarBoardAjaxController {

	@Autowired
	@Qualifier("rcbasi")
	private RentCarBoardAjaxService service;
	
	//회사 수정,보기
	@GetMapping(value = "/companyView.do",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Map<String, Object>> companyView(long companyNo){
		log.info(companyNo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		// "/" 를 기준으로 분리해서 넣기

		RentCarBoardRentCarCompanyVO companyVO =service.getCompany(companyNo);

		String straddress = companyVO.getAddress();

		String[] addressArray = straddress.split("/");
		log.info(Arrays.toString(addressArray));
		if(addressArray.length > 1) {
			
		companyVO.setZipcode(addressArray[0]);
		companyVO.setStreetAdr(addressArray[1]);
		companyVO.setDetailAdr(addressArray[2]);
		
		}
		log.info(companyVO);
		
		map.put("companyView",companyVO);
		
		//map 자체를 넘겨준다
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}
	//write, consumes 받는 형식, porduces 넘기는 형식
	//json 타입 받으려면 RequestBody 써줘야함
	@PostMapping(value = "/writeCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> writeCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
		log.info("ajax : =" +carInsuranceVO);

		int result = 0;
		for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {

			if(vo.getInsuranceExperience() != null) {
				//2번값이 있을떄만 실행한다
				log.info("ajax if문 : =" +vo);
				result = service.writeCarInsurance(vo);
			}
			
		}
		log.info("result" + result);
		//write 가 안되면 오류~ 예외처리 따로해준다
		return	result == 1 ?
				new ResponseEntity<String>("write success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//차량 보험 업데이트
		@PostMapping(value = "/updateCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> updateCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
			log.info("ajax : =" +carInsuranceVO);

			int result = 0;
			for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {

				if(vo.getInsuranceExperience() != null) {
					//2번값이 있을떄만 실행한다
					log.info("ajax if문 : =" +vo);
		
					if(vo.getInsuranceNo() != 0) {
						
						result = service.updateCarInsurance(vo);
					}else {
						//내용은 있는데 보험 번호가 0으로 넘어온 데이터 == 업데이트로 새로들어온 데이터 
						service.writeCarInsurance(vo);
					}
					
					
				}
				
			}
			System.out.println(result);
			//write 가 안되면 오류~ 예외처리 따로해준다
			return	new ResponseEntity<String>("update success",HttpStatus.OK);
		}
	//차량 보험 업데이트
		@PostMapping(value = "/deleteCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> deleteCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
			log.info("ajax : =" +carInsuranceVO);
			
			for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {
				
				//번호가 0 이 아닐경우만 삭제해준다	
				if(vo.getInsuranceNo() != 0) {
						service.deleteCarInsurance(vo.getInsuranceNo());
				}
					
				
			}
			return	new ResponseEntity<String>("delete success",HttpStatus.OK);
		}
		
}
