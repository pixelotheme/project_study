package com.hallabong.rentcarboard.service;

import java.util.List;

import com.hallabong.rentcarboard.domain.RentCarBoardVO;
import com.hallabong.util.PageObjectCustom;

public interface RentCarBoardService {
	
	public List<RentCarBoardVO> list(PageObjectCustom pageObject);
	
}
