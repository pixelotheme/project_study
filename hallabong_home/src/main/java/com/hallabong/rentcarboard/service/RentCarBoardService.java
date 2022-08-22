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
	
	//차량 등록시 회사 선택
	public List<RentCarCompanyVO> getAllCompany();
	//회사 등록
	public int writeRentCarCompany(RentCarCompanyVO vo);
		

	//차량(등록후 바로 가장큰 번호 가져오기) ,차옵션, 보험, 사진 등록
	public int writeCarGetCarNo(CarsVO carsVO);
	
	public int writeCarOption(CarOptionVO carOptionVO, long carNo);
	
	//ajax로 처리
//	public int writeCarInsurance(CarInsuranceVO carInsuranceVO, long carNo);
	
	public int writeCarFileUpload(List<CarFileUploadVO> list);
	
	
	//회사 수정
	public int updateRentCarCompany(RentCarCompanyVO vo);
	
	//차량 수정
	public int updateCar(CarsVO carsVO);
	//차량 옵션 수정
	public int updateCarOption(CarOptionVO carOptionVO);
	
	//파일 삭제 (파일업로드는 db 삭제후 다시만든다)
	public int deleteCarFileUpload(long carNo);
	//파일 업로드 (파일업로드는 db 삭제 하면 안된다)
	public int updateFileUploadForNull(long carNo);
	
	
	//회사 삭제
	public int deleteCompany(long companyNo);
	//사진도 삭제해야해서 회사번호와 같은 차량 번호 가져오기 -> 차량 번호와 같은 파일업로드 가져오기
	public List<CarFileUploadVO> getDeleteFileUpload(long companyNo);
	
	////차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
	public int deleteCar(long carNo);
}


