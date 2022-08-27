package com.hallabong.rentcarboard.carfileupload.mapper;

import java.util.List;

import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;

public interface RentCarBoardCarFileUploadMapper {
	//파일업로드 정보 가져오기 - basic 과 묶여있다
	public RentCarBoardCarFileUploadVO getCarFileUpload(long carInfoNo);
	
	//차량 기본정보 등록할때 같이등록된다(파일업로드)
	public int writeCarFileUpload(List<RentCarBoardCarFileUploadVO> list);
	
	
	//파일 삭제 (파일업로드는 db 삭제후 다시만든다)
	public int deleteCarFileUpload(long carInfoNo);
	//파일 업로드 (파일업로드는 db 삭제 하면 안된다)
	public int updateFileUploadForNull(long carInfoNo);
}
