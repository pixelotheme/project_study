package com.dogs.notice.domain;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {

	private long noticeNo;
	private String title;
	private String id;
	private String content;
	private Date writeDate;
	private Date startDate;
	private Date endDate;
	private Date updateDate;
}
