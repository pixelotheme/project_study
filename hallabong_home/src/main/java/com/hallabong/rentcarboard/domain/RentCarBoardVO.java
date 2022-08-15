package com.hallabong.rentcarboard.domain;

import lombok.Data;

@Data
public class RentCarBoardVO {

	//합쳐서 해보고 안되면 분리 or 특전 부분에서 분리한 vo 쓴다
	
	//렌트카 회사
	private long companyNo;
	private String companyName;//회사이름
	private String tel;
	private String address;
	
	//렌트카 게시판
	private Long rentNo;//글번호
	private long carNo; //리스트 불러올때, view 불러올때 사용예정
//	private long companyNo;
	private String title;
	private String id;
	private String insuranceInfo; //보험안내
	private String rentCarNote; // 참고사항
	private String cancelAndRefund; // 취소,환불
	//companyNo 는 위에서 이미 지정 - 각자 vo 따로만들어 줘서 다시 넣어줌
	
	
	//cars 테이블 차등록
//	private Long carNo;
	//companyNo 중복
	private String carName;
	private Long price;
	private String gearbox;
	private Long modelYears; //연식
	private String insuranceType;
	private String carTypes; //대형,중형...
	private Long rentAge; //차량 대여 가능 나이
	private Long rentExperience; //차량 대여 가능 운전경력
	private String carFuel; // 차 연료 종류
	private Long carCapacity; // 승차정원
	private String license; //면허종류
	
	//차량 옵션 --string으로 변경됨
	//carNo 중복
	private String smoking;
	private String navigation;
	private String blackbox;
	private String rearCamera;//전방카메라
	private String rearSensor;//후방센서
	private String frontSensor; 
	private String sunroof;
	private String bluetooth;
	private String heatingSheet; //열선시트
	private String heatingHandle; //열선핸들
	private String leatherSheet; //가죽시트
	private String ventilationSheet;//통풍시트
	private String carSeatPay;//유아용의자
	private String carSeatFree;
	private String driverAirbag;
	private String passengerAirbag;
	private String fourWheel;//4륜구동
	private String smartKey;
	private String rearAutomaticDoor;//후방 자동문
	private String freeCharge;//전기차 충전
	private String usb;
	private String aux;
	private String dmb;
	private String camping;
	
	//보험세부 내용
	//carNo 중복
	private long insuranceNo;
	private String category; //일반자차,고급자차
	private Long insurancePrice; //보험금
	private Long insuranceAge; //보험가입 가능 나이
	private Long insuranceExperience; //보험가입 가능 운전경력
	private Long compensation; //보상 한도(숫자로만)
	private String customerCharge; //사고시 고객 부담금

	
	
	//fileUpload
	//rentNo 중복
	private String orgFileName;//처음 파일 제목
	private String fileName; //중복으로 인해 변환된 파일 이름
	private String realSavePath;
}
