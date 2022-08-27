package com.hallabong.rentcarboard.service;

import java.util.List;

import com.hallabong.rentcarboard.domain.CarBasicInfoVO;
import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.CompanyCarsVO;
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
	
	//추가 차 이름 등 - carInfoNo 로 확인  리스트에서 같이 뽑아둠
	public CarBasicInfoVO getCarBasicInfo(long carInfoNo);
	
	//차옵션
	public CarOptionVO getCarOption(long carNo);
	//보험
	public List<CarInsuranceVO> getCarInsurance(long carNo);

	
	
	//렌트카 회사 리스트
	public List<RentCarCompanyVO> rentCarCompanyList(PageObjectCustom pageObject);
	
	//차량 등록시 회사 선택
	public List<RentCarCompanyVO> getAllCompany();
	
	//차량 등록시 기본 차량정보 선택
	public List<CarBasicInfoVO> getAllCarBasicInfo();
	
	//회사 등록
	public int writeRentCarCompany(RentCarCompanyVO vo);
		

	//차량(등록후 바로 가장큰 번호 가져오기) ,차옵션, 보험, 사진 등록
	public int writeCarGetCarNo(CarsVO carsVO);
	
	public int writeCarOption(CarOptionVO carOptionVO, long carNo);
	
	//ajax로 처리
//	public int writeCarInsurance(CarInsuranceVO carInsuranceVO, long carNo);

	
	//회사 수정
	public int updateRentCarCompany(RentCarCompanyVO vo);
	
	//차량 수정
	public int updateCar(CarsVO carsVO);
	//차량 옵션 수정
	public int updateCarOption(CarOptionVO carOptionVO);
	
	
	//회사 삭제
	public int deleteCompany(long companyNo);

	
	////차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
	public int deleteCar(long carNo);
	
	
	//파일삭제, 차량 기본정보 등록
	
	//carBasicInfo 리스트,보기,등록,수정,삭제 / 차량 기본정보에 등록할때 차량 사진등록함
	public List<RentCarSynthesizeDTO> carBasicInfoList(PageObjectCustom pageObject);
	//view
//	public CarBasicInfoVO viewCarBasicInfo(long carInfoNo);만들어둔 get이 있음
	//write
	public int writeCarBasicInfoGetCarInfoNo(CarBasicInfoVO carBasicInfoVO);
	//update
	public int updateCarBasicInfo(CarBasicInfoVO carBasicInfoVO);
	//delete
	public int deleteCarBasicInfo(long carInfoNo);
	
	//파일업로드 정보 가져오기 - basic 과 묶여있다
	public CarFileUploadVO getCarFileUpload(long carInfoNo);
	//사진도 삭제해야해서 회사번호와 같은 차량 번호 가져오기 -> 차량 번호와 같은 파일업로드 가져오기
//	public List<CarFileUploadVO> getDeleteFileUpload(long companyNo);
	//basicInfo 삭제 할때 삭제된다
	public List<CarFileUploadVO> getDeleteFileUpload(long carInfoNo);
	
	
	public int writeCarFileUpload(List<CarFileUploadVO> list);
	
	//파일 삭제 (파일업로드는 db 삭제후 다시만든다)
	public int deleteCarFileUpload(long carInfoNo);
	//파일 업로드 (파일업로드는 db 삭제 하면 안된다)
	public int updateFileUploadForNull(long carInfoNo);
	
	
	//회사 차량 번호판 리스트 carno , companyNo 받아서 보여준다 - cars 등록할때 같이 등록되어있음
	public List<RentCarSynthesizeDTO> getCompanyCarsList(PageObjectCustom pageObject ,long carNo, long companyNo);
	//화사 차량 번호판 등록
	public int writeCompanyCars(CompanyCarsVO companyCarsVO);
	//회사 차량 번호판 보기
	public CompanyCarsVO viewCompanyCars(long companyCarsNo);
	//회사 차량 번호판 수정
	public int updateCompanyCars(CompanyCarsVO companyCarsVO);
	//회사 차량 번호판 삭제
	public int deleteCompanyCars(long companyCarsNo);
}


