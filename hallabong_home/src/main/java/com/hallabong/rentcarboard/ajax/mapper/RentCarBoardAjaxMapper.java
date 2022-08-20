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
	
}
