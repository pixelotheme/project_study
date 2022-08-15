package com.hallabong.rentcarboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.service.RentCarBoardService;
import com.hallabong.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentCarBoard")
@Log4j
public class RentCarBoardController {

	@Autowired
	@Qualifier("rcbsi")
	private RentCarBoardService service;
	
	@GetMapping("/list")
	public void list(PageObjectCustom pageObject,Model model) {
		//key = 매장, word = 차량검색
		
		//게시글, 회사, 차, 차옵션, 차보험, 파일업로드 불러와야함
		//vo 한번에 뭉쳐서 테스트
		
		model.addAttribute("list", service.list(pageObject));
		
	}
}
