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
	
	
}
