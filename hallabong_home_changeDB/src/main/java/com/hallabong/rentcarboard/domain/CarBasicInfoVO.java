package com.hallabong.rentcarboard.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CarBasicInfoVO {

	
	//carBasicInfo 테이블 생성 - 고정된 정보
	
	private Long carInfoNo;
	private String carName;
	private String carTypes;
	private Long carCapacity;
	private String carFuel;
	private Date writeDate;
	private Date updateDate;
}
