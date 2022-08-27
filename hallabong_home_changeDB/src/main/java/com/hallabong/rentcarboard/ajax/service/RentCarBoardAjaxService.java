package com.hallabong.rentcarboard.ajax.service;

import java.util.List;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardAjaxService {
	
	public int writeCarInsurance(CarInsuranceVO vo);
	
	//회사 정보 가져오기
	public RentCarCompanyVO getCompany(long companyNo);
	
	//차량 보험 수정 ajax
	public int updateCarInsurance(CarInsuranceVO vo);
	
	//차량 보험 삭제 ajax
	public int deleteCarInsurance(long insuranceNo);
}
