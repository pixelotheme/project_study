package com.hallabong.rentcarboard.ajax.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardAjaxMapper {

	//보험내용 등록
	public int writeCarInsurance(CarInsuranceVO vo);
	
	//회사 정보 가져오기
	public RentCarCompanyVO getCompany(long companyNo);
	
	//차량 보험 수정 ajax
	public int updateCarInsurance(CarInsuranceVO vo);
}
