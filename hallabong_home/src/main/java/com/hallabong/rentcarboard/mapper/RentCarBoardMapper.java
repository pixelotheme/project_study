package com.hallabong.rentcarboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public long getTotalRow(PageObjectCustom pageObject);
	
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
	
	public int writeCarOption(CarOptionVO carOptionVO);
	//ajax로 처리
//	public int writeCarInsurance(CarInsuranceVO carInsuranceVO);
	
	public int writeCarFileUpload(List<CarFileUploadVO> list);
	
	
	
	//회사 수정
	public int updateRentCarCompany(RentCarCompanyVO vo);
	
	//차량 수정
	public int updateCar(CarsVO carsVO);
	//차량 옵션 수정
	public int updateCarOption(CarOptionVO carOptionVO);

	//차량 보험 수정 ajax 쪽에서 처리
	
	
	
	//파일 삭제 (파일업로드는 db 삭제후 다시만든다)
	public int deleteCarFileUpload(long carNo);
	
	//회사 삭제
	public int deleteCompany(long companyNo);
	//사진도 삭제해야해서 회사번호와 같은 차량 번호 가져오기 -> 차량 번호와 같은 파일업로드 가져오기
	public List<CarFileUploadVO> getDeleteFileUpload(long companyNo);
	
	////차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
	public int deleteCar(long carNo);
	//파일db 가져오기 -> 지금 사진 하나만 올리니 위에 만들어 둔것 쓴다
}
