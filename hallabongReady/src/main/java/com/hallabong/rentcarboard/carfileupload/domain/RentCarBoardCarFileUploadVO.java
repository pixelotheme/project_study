package com.hallabong.rentcarboard.carfileupload.domain;

import lombok.Data;

@Data
public class RentCarBoardCarFileUploadVO {
	//fileUpload
	private Long uploadNo;
	private Long carInfoNo;//차번호 -> 바뀜
	private String orgFileName;//처음 파일 제목
	private String fileName; //중복으로 인해 변환된 파일 이름
	private String realSavePath;
	private Long fileSize;
	
//	private String attachFileName;//순수 파일명 - uuid_가 포함되어있다
//	private String attachUploadPath; // 저장 위치 -- yyyy/MM/dd 
//	private String attachUuid; // uuid 문자열 ->uuid_를 제거하면 파일명이 나온다
//	private boolean attachImage; //이미지가 아니면 a 태그로 다운로드도 가능하다
	
	private String fileType;
}
