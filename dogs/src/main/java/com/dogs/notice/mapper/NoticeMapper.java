package com.dogs.notice.mapper;

import java.util.List;

import com.dogs.notice.domain.NoticeVO;
import com.dogs.util.PageObjectCustom;
import com.webjjang.util.PageObject;

public interface NoticeMapper {

	public List<NoticeVO> list(PageObjectCustom pageObject);
	
	public long getTotalRow(PageObjectCustom pageObject);
}
