package com.hallabong.rentcarboard.domain;

import lombok.Data;

@Data
public class RentCarCompanyVO {

	//렌트카 회사
	private long companyNo;
	private String companyName;//회사이름
	private String tel;
	private String address;
}
