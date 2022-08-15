package com.dogs.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogs.util.PageObjectCustom;
import com.dogs.notice.domain.NoticeVO;
import com.dogs.notice.service.NoticeService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/notice")
@Controller
@Log4j
public class NoticeController {

	@Autowired
	@Qualifier("NoticeServiceImpl")
	private NoticeService service;
	
	@GetMapping("/list")
	public void list(PageObjectCustom pageObject, Model model) {
		
		log.info("리스트 "+pageObject);
		
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
	}
	
	
	
	@GetMapping("/write")
	public void write() {
		log.info("공지 쓰기");
		
	}
	@PostMapping("/write")
	public void write(PageObjectCustom pageObject, NoticeVO vo) {
		
		
	}
	
}
