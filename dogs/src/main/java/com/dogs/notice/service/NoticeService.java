package com.dogs.notice.service;

import java.util.List;

import com.dogs.notice.domain.NoticeVO;
import com.dogs.util.PageObjectCustom;

public interface NoticeService {

	public List<NoticeVO> list(PageObjectCustom pageObject);
	
}
