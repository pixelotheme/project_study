package com.hallabong.rentcarboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.domain.CarFileUploadVO;
import com.hallabong.rentcarboard.domain.CarInsuranceVO;
import com.hallabong.rentcarboard.domain.CarOptionVO;
import com.hallabong.rentcarboard.domain.CarsVO;
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
	
	@Override
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		log.info("렌트카 리스트...." + pageObject);
		

		List<RentCarSynthesizeDTO> dto = mapper.list(pageObject);
		
		log.info("list dto :" + dto);
		
		return dto;
	}

	@Override
	public RentCarCompanyVO getCompany(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(carNo);
	}

	@Override
	public CarsVO getCars(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCars(carNo);
	}

	@Override
	public CarOptionVO getCarOption(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarOption(carNo);
	}

	@Override
	public List<CarInsuranceVO> getCarInsurance(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarInsurance(carNo);
	}

	@Override
	public CarFileUploadVO getCarFileUpload(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarFileUpload(carNo);
	}

	@Override
	public int writeRentCarCompany(RentCarCompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeRentCarCompany(vo);
	}

}
