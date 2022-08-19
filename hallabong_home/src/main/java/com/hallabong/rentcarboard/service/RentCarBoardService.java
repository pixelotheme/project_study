package com.hallabong.rentcarboard.service;

import java.util.List;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardService {
	//리스트가져오기
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject);
	
	//기준 carno
	//회사내용
	public RentCarCompanyVO getCompany(long carNo);
	//차내용
	public CarsVO getCars(long carNo);
	//차옵션
	public CarOptionVO getCarOption(long carNo);
	//보험
	public List<CarInsuranceVO> getCarInsurance(long carNo);
	//파일업로드
	public CarFileUploadVO getCarFileUpload(long carNo);
	
	
	//회사 등록
	public int writeRentCarCompany(RentCarCompanyVO vo);
		

}
