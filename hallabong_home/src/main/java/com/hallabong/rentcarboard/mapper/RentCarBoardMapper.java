package com.hallabong.rentcarboard.mapper;

import java.util.List;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardMapper {

	//회사, 차 검색 -> 문자열로 가져온다 -> 회사는 companyname 으로 선택, 차도 carname
	
	//전체 데이터 가져오기
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject);
	//페이징 위해 전체 데이터 가져와야함
	
//	public List<RentCarSynthesizeDTO> getCarOptionForList(PageObjectCustom pageObject);
	
	//각 vo 별로 꺼내서  service에서 뭉쳐준다
//	public List<RentCarCompanyVO> companyList(PageObjectCustom pageObject);
//	public List<CarsVO> carsList(PageObjectCustom pageObject);
//	public List<CarOptionVO> carOptionList(PageObjectCustom pageObject);
//	public List<CarInsuranceVO> carInsuranceList(PageObjectCustom pageObject);
//	public List<CarsFileUploadVO> carsUploadList(PageObjectCustom pageObject);
	
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
