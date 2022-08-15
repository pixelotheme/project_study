package com.hallabong.rentcarboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.domain.RentCarBoardVO;
import com.hallabong.rentcarboard.mapper.RentCarBoardMapper;
import com.hallabong.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("rcbsi")
@Log4j
public class RentCarBoardServiceImpl implements RentCarBoardService {

	@Autowired
	private RentCarBoardMapper mapper;
	
	@Override
	public List<RentCarBoardVO> list(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		log.info("렌트카 리스트...." + pageObject);
		
		//List<RentCarBoardVO> 에 각테이블에서 가져온 데이터를 한번에 넣어준다
		
		return mapper.list(pageObject);
	}

}
