package com.hallabong.rentcarbooking.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.util.PageObjectCustom;
import com.hallabong.rentcarbooking.domain.RentCarBookingVO;
import com.hallabong.rentcarbooking.service.RentCarBookingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarbooking")
@Log4j
public class RentCarBookingController {

	@Autowired
	@Qualifier("bookingService")
	private RentCarBookingService service;
	
	//예약 리스트
	@GetMapping("list.do")
	public String list(PageObjectCustom pageObject, Model model) throws Exception {

		log.info("list controller "+pageObject);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "rentcarbooking/list";
	}
	
	//뷰
	@GetMapping("/view.do")
	public String view(long bookingNo, Model model) throws Exception{
		
		log.info("예약 보기-----------------");
		//회사이름,차량이름, 대여일, 반납일, 작성한 정보, 면허번호 
		model.addAttribute("vo", service.view(bookingNo));
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰
		
		//상품정보 - 연료 ,보험종류,
		
		return "rentcarbooking/view";
		
	}	
	
	//상세정보등록 - 결제전이니 예약 으로 등록
	@GetMapping("/booking.do")
	public String writeForm(RentCarBookingVO vo, Model model) throws Exception{
		
		log.info("예약 등록 폼 ------------------" + vo);
		
		RentCarBookingVO basicVO = new RentCarBookingVO();
		basicVO = service.getInfoForBooking(vo);
		basicVO.setTotalPrice(vo.getTotalPrice());
		basicVO.setCarNo(vo.getCarNo());
		basicVO.setCompanyNo(vo.getCompanyNo());
		basicVO.setCarInfoNo(vo.getCarInfoNo());
		basicVO.setRentalDate(vo.getRentalDate());
//		basicVO.setRentalDate(rentalDate);
		basicVO.setReturnDate(vo.getReturnDate());
		//대여일, 반납일, 종합가격 - vo에 담겨있다
		//회사이름,차량이름, , 연료 ,보험종류, 기존가격(prePrice 로 들어온다) - db에서 가져오기로 vo에 각 no 담아둠
		model.addAttribute("vo", basicVO);
		
		//companyCarsNo 도 booking 이 없는 번호중 1개 가져와야함으로 하나 가져와야함
		//필요한 정보 - carNo
		model.addAttribute("companyCarsNo", service.getCompanyCarsNo(basicVO.getCarNo()));
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰
		
		return "rentcarbooking/booking";
		
	}
	//상세정보등록
	@PostMapping("/booking.do")
	public String write(RentCarBookingVO vo) throws Exception{
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		log.info("예약 등록------------------"+ vo);
			
		//date 타입 으로 vo에 지정해두면 쿼리도 to_date 라고 쓰지않아도 된다
		//넘어가고 오는값은 계속 시분초까지 찍히지만 db에 그대로 저장시 java에서 지정함 포맷으로 잘려서 저장된다
		log.info(vo);
		
		service.write(vo);
		String companyName = java.net.URLEncoder.encode(vo.getCompanyName(), "utf-8");
		
//		return "redirect:payment.do?bookingNo="+bookingNo+"&companyName="+vo.getCompanyName();
		return "redirect:payment.do?bookingNo="+vo.getBookingNo()+"&companyName="+companyName;
		
	}	
	
	//상세정보 등록후 결제창 - 상세정보 db 올릴때 key도 같이 넘겨줘야함, 등록되면 결제 로 update 시켜줘야함 
	@GetMapping("/payment.do")
	public String paymentForm(RentCarBookingVO vo,Model model) {
		
		if(vo.getPaymentType() == null || !(vo.getPaymentType()).equals("") ) {
			
		int min = 100000000;
		int max = 999999999;
		int random = (int) ((Math.random() * (max - min)) + min);
		System.out.println(random);
		
		model.addAttribute("random", random);
		model.addAttribute("vo", vo);
		}else {
			model.addAttribute("vo", vo);
		}
		
		
		return "rentcarbooking/payment";
	}
	
	@PostMapping("/payment.do")
	public String payment(RentCarBookingVO vo) throws Exception {
		log.info(vo);
		//paymentType, paymentCompany, paymentAccount update 시킨다
		service.writePayment(vo);
		
		
		return "redirect:list.do";
	}
	
	
	//상세정보 수정(결제부분은 수정 안된다 , 관리자일때 예약상태 변경 가능)
	@GetMapping("/update.do")
	public String updateForm(RentCarBookingVO vo, Model model) throws Exception{
		
		log.info("예약 등록 폼 ------------------" + vo);
		
		RentCarBookingVO basicVO = new RentCarBookingVO();
		basicVO = service.getInfoForBooking(vo);
		basicVO.setTotalPrice(vo.getTotalPrice());
		basicVO.setCarNo(vo.getCarNo());
		basicVO.setCompanyNo(vo.getCompanyNo());
		basicVO.setCarInfoNo(vo.getCarInfoNo());
		basicVO.setRentalDate(vo.getRentalDate());
//		basicVO.setRentalDate(rentalDate);
		basicVO.setReturnDate(vo.getReturnDate());
		//대여일, 반납일, 종합가격 - vo에 담겨있다
		//회사이름,차량이름, , 연료 ,보험종류, 기존가격(prePrice 로 들어온다) - db에서 가져오기로 vo에 각 no 담아둠
		model.addAttribute("vo", basicVO);
		
		
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰
		
		//예약한 정보 가져오기
		model.addAttribute("bookingVO", service.view(vo.getBookingNo()));
		
		
		return "rentcarbooking/update";
		
	}
	//예약 보기 수정 처리
	@PostMapping("/update.do")
	public String update(RentCarBookingVO vo) throws Exception{
		
		log.info("예약 수정 처리------------------"+vo);
		
		service.update(vo);
		return "redirect:updatePayment.do?bookingNo="+vo.getBookingNo()
		;
		
	}	
	//상세정보 등록후 결제창 - 상세정보 db 올릴때 key도 같이 넘겨줘야함, 등록되면 결제 로 update 시켜줘야함 
	@GetMapping("/updatePayment.do")
	public String updatePaymentForm(RentCarBookingVO vo,Model model) throws Exception {
		
			log.info(vo);
			model.addAttribute("vo", service.view(vo.getBookingNo()));
		
		
		return "rentcarbooking/updatePayment";
	}
	
	@PostMapping("/updatePayment.do")
	public String updatePayment(RentCarBookingVO vo) throws Exception {
		log.info(vo);
		//paymentType, paymentCompany, paymentAccount update 시킨다
		service.updatePayment(vo);
		
		
		return "redirect:list.do";
	}
		
	
	//예약 삭제
	@GetMapping("/delete.do")
	public String delete(long bookingNo) throws Exception{
		
		log.info("예약 삭제------------------");
		service.delete(bookingNo);
		return "redirect:list.do";
		
	}	
	 
}
