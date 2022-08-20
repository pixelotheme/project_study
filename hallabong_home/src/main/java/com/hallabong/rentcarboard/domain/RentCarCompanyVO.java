package com.hallabong.rentcarboard.domain;

import lombok.Data;

@Data
public class RentCarCompanyVO {

	//렌트카 회사
	private long companyNo;
	private String companyName;//회사이름
	private String tel;
	private String address;
	private String id; //등록한 아이디
//	private String insuranceInfo; //보험안내 cars 로 이동
//	private String rentCarNote; // 참고사항
//	private String cancelAndRefund; // 취소,환불
	
	//주소 합치기위한 변수선언
	private String zipcode; // 우편번호
	private String streetAdr; //도로명
	private String detailAdr;// 상세주소
	
		
	
	
}
