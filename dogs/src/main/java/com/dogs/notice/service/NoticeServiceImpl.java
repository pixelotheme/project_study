package com.dogs.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dogs.notice.domain.NoticeVO;
import com.dogs.notice.mapper.NoticeMapper;
import com.dogs.util.PageObjectCustom;
import com.webjjang.util.PageObject;

@Service
@Qualifier("NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> list(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}


}
