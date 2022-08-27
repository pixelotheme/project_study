package com.hallabong.rentcarboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardMapper {

	//회사, 차 검색 -> 문자열로 가져온다 -> 회사는 companyname 으로 선택, 차도 carname
	
	//전체 데이터 가져오기
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject);
	//페이징 위해 전체 데이터 가져와야함
	public long getTotalRow(PageObjectCustom pageObject);
	
	//차내용
	public RentCarBoardCarsVO getCars(long carNo);
	
	//차량(등록후 바로 가장큰 번호 가져오기) ,차옵션, 보험, 사진 등록, carInfoNo 받아서 저장해놔야함
	public int writeCarGetCarNo(RentCarBoardCarsVO carsVO);

	//차량 수정
	public int updateCar(RentCarBoardCarsVO carsVO);
	
	////차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
	public int deleteCar(long carNo);
	
}
