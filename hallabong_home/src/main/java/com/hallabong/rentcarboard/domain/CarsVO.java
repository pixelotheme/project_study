package com.hallabong.rentcarboard.domain;

import lombok.Data;

@Data
public class CarsVO {

	//cars 테이블 차등록
	private Long carNo;
	private long companyNo;
	//companyNo 중복 - 각자 테이블 입력으로 변경
	private String carName;
	private Long price;
	private String gearbox;
	private Long modelYears;
	private String insuranceType;
	private String carTypes;
	private Long rentAge; //차량 대여 가능 나이
	private Long rentExperience; //차량 대여 가능 운전경력
	private String carFuel; // 차 연료 종류
	private Long carCapacity; // 승차정원
	private String license; //면허종류
}
