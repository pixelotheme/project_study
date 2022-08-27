package com.hallabong.rentcarboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.domain.CarBasicInfoVO;
import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
import com.hallabong.rentcarboard.domain.CompanyCarsVO;
import com.hallabong.rentcarboard.domain.RentCarCompanyVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.mapper.RentCarBoardMapper;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("rcbsi")
@Log4j
public class RentCarBoardServiceImpl implements RentCarBoardService {

	@Autowired
	private RentCarBoardMapper mapper;
	
	//리스트 한번에 뽑기
	@Override
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("렌트카 리스트...." + pageObject);
		

		List<RentCarSynthesizeDTO> dto = mapper.list(pageObject);
		
		log.info("list dto :" + dto);
		
		return dto;
	}
//view
	@Override
	public RentCarCompanyVO getCompany(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(carNo);
	}
	//view
	@Override
	public CarsVO getCars(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCars(carNo);
	}
	//추가
	@Override
	public CarBasicInfoVO getCarBasicInfo(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.getCarBasicInfo(carInfoNo);
	}
	//view
	@Override
	public CarOptionVO getCarOption(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarOption(carNo);
	}
	//view
	@Override
	public List<CarInsuranceVO> getCarInsurance(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarInsurance(carNo);
	}
	//view
	@Override
	public CarFileUploadVO getCarFileUpload(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.getCarFileUpload(carInfoNo);
	}

	//회사 등록
	@Override
	public int writeRentCarCompany(RentCarCompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeRentCarCompany(vo);
	}

	//차등록을 위한 회사정보 꺼내오기
	@Override
	public List<RentCarCompanyVO> getAllCompany() {
		// TODO Auto-generated method stub
		return mapper.getAllCompany();
	}
	//차등록을 위한 기본 차량 정보 꺼내오기
	@Override
	public List<CarBasicInfoVO> getAllCarBasicInfo() {
		// TODO Auto-generated method stub
		return mapper.getAllCarBasicInfo();
	}
	//차량등록
	@Override
	public int writeCarGetCarNo(CarsVO carsVO) {
		// TODO Auto-generated method stub
		log.info("차 등록 "+ carsVO);
		int result =  mapper.writeCarGetCarNo(carsVO);
		log.info("등록후"+carsVO.getCarNo());
		return result;
	}
	//차옵션 등록
	@Override
	public int writeCarOption(CarOptionVO carOptionVO, long carNo) {
		// TODO Auto-generated method stub
		carOptionVO.setCarNo(carNo);
		
		return mapper.writeCarOption(carOptionVO);
	}
	//차보험 ajax로 처리
//	@Override
//	public int writeCarInsurance(CarInsuranceVO carInsuranceVO, long carNo) {
//		// TODO Auto-generated method stub
//		carInsuranceVO.setCarNo(carNo);
//		return mapper.writeCarInsurance(carInsuranceVO);
//	}
	//차 파일업로드
	@Override
	public int writeCarFileUpload(List<CarFileUploadVO> list) {
		// TODO Auto-generated method stub
		return mapper.writeCarFileUpload(list);
	}
	@Override
	public int updateRentCarCompany(RentCarCompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateRentCarCompany(vo);
	}
	@Override
	public int updateCar(CarsVO carsVO) {
		// TODO Auto-generated method stub
		return mapper.updateCar(carsVO);
	}
	@Override
	public int updateCarOption(CarOptionVO carOptionVO) {
		// TODO Auto-generated method stub
		return mapper.updateCarOption(carOptionVO);
	}
	
	
	@Override
	public int deleteCarFileUpload(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCarFileUpload(carInfoNo);
	}
	@Override
	public int deleteCompany(long companyNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCompany(companyNo);
	}
	@Override
	public List<CarFileUploadVO> getDeleteFileUpload(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.getDeleteFileUpload(carInfoNo);
	}
	@Override
	public int deleteCar(long carNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCar(carNo);
	}
	@Override
	public int updateFileUploadForNull(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.updateFileUploadForNull(carInfoNo);
	}
	@Override
	public List<RentCarSynthesizeDTO> carBasicInfoList(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		return mapper.carBasicInfoList(pageObject);
	}
//	@Override /getCarBasicInfo 있음
//	public CarBasicInfoVO viewCarBasicInfo(long carInfoNo) {
//		// TODO Auto-generated method stub
//		return mapper.viewCarBasicInfo(carInfoNo);
//	}
	@Override
	public int writeCarBasicInfoGetCarInfoNo(CarBasicInfoVO carBasicInfoVO) {
		// TODO Auto-generated method stub
		return mapper.writeCarBasicInfoGetCarInfoNo(carBasicInfoVO);
	}
	@Override
	public int updateCarBasicInfo(CarBasicInfoVO carBasicInfoVO) {
		// TODO Auto-generated method stub
		return mapper.updateCarBasicInfo(carBasicInfoVO);
	}
	@Override
	public int deleteCarBasicInfo(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCarBasicInfo(carInfoNo);
	}
	@Override
	public List<RentCarSynthesizeDTO> getCompanyCarsList(PageObjectCustom pageObject, long carNo, long companyNo) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRowForCompanyCars(pageObject));
		
		return mapper.getCompanyCarsList(pageObject, carNo, companyNo);
	}
	@Override
	public int writeCompanyCars(CompanyCarsVO companyCarsVO) {
		// TODO Auto-generated method stub
		return mapper.writeCompanyCars(companyCarsVO);
	}
	@Override
	public CompanyCarsVO viewCompanyCars(long companyCarsNo) {
		// TODO Auto-generated method stub
		return mapper.viewCompanyCars(companyCarsNo);
	}
	@Override
	public int updateCompanyCars(CompanyCarsVO companyCarsVO) {
		// TODO Auto-generated method stub
		return mapper.updateCompanyCars(companyCarsVO);
	}
	@Override
	public int deleteCompanyCars(long companyCarsNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCompanyCars(companyCarsNo);
	}
	@Override
	public List<RentCarCompanyVO> rentCarCompanyList(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRowRentCarCompany(pageObject));
		
		
		return mapper.rentCarCompanyList(pageObject);
	}



}
