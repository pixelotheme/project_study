package com.hallabong.rentcarboard.mapper;

import java.util.List;

import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarBoardVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.util.PageObjectCustom;

public interface RentCarBoardMapper {

	//회사, 차 검색 -> 문자열로 가져온다 -> 회사는 companyname 으로 선택, 차도 carname
	
//	//각 db 내용을 모두 불러온다 
//	//company 테이블가져오기
//	public List<RentCarCompanyVO> getCompany(PageObjectCustom pageObject); 
//	
//	//특정 차량, 모든차량 정보가져오기, - 이름으로 검색 가능
//	public List<CarsVO> getAllCars(PageObjectCustom pageObject);
//	
//	// 차량 옵션정보 --검색한 경우 검색한 차종의 번호가 들어와야함
//	public List<CarOptionVO> getOption(long carNo);
//	
//	//보험
//	public List<CarInsuranceVO> getInsurance()
	
	//전체 데이터 가져오기
	public List<RentCarBoardVO> list(PageObjectCustom pageObject);
}
