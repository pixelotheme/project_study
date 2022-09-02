package com.hallabong.rentcarbooking.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class RentCarBookingVO {

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rentalDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date returnDate;
	
	private long prePrice;
}
