package com.hallabong.rentcarboard.carbasicinfo.service;

import java.util.List;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardCarBasicInfoService {
	//carBasicInfo 리스트,보기,등록,수정,삭제 / 차량 기본정보에 등록할때 차량 사진등록함
	public List<RentCarBoardSynthesizeVO> carBasicInfoList(PageObjectCustom pageObject);
	
	//추가 차 이름 등 - carInfoNo 로 확인  리스트에서 같이 뽑아둠
	public RentCarBoardCarBasicInfoVO getCarBasicInfo(long carInfoNo);
	//파일업로드 정보 가져오기 - basic 과 묶여있다
//	public CarFileUploadVO getCarFileUpload(long carInfoNo);
	
	
	//write
	public int writeCarBasicInfoGetCarInfoNo(RentCarBoardCarBasicInfoVO carBasicInfoVO);
	//파일업로드
//	public int writeCarFileUpload(List<CarFileUploadVO> list);
	
	//update
	public int updateCarBasicInfo(RentCarBoardCarBasicInfoVO carBasicInfoVO);
	//delete
	public int deleteCarBasicInfo(long carInfoNo);
	//파일 삭제 (파일업로드는 db 삭제후 다시만든다)
//	public int deleteCarFileUpload(long carInfoNo);
//	//파일 업로드 (파일업로드는 db 삭제 하면 안된다)
//	public int updateFileUploadForNull(long carInfoNo);
	
	//차량 등록시 기본 차량정보 선택
	public List<RentCarBoardCarBasicInfoVO> getAllCarBasicInfo();
}
