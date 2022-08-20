package com.hallabong.rentcarboard.domain;

import lombok.Data;

@Data
public class CarFileUploadVO {

	//fileUpload
	private Long uploadNo;
	private Long carNo;//차번호
	private String orgFileName;//처음 파일 제목
	private String fileName; //중복으로 인해 변환된 파일 이름
	private String realSavePath;
	private Long fileSize;
}
