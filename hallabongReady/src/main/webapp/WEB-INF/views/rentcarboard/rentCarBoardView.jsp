<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>렌트카 view</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- datepicker -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 위치 중요 css -->
<link rel="stylesheet" type="text/css" href="/resources/css/rentCarCSS/rentCarDatePicker.css">
<!-- js -->
<script type="text/javascript" src="/resources/js/rentCarJS/rentCarDatePicker.js"></script>

<script type="text/javascript">
$(function(){
	
})
</script>

</head>
<body>
<div class="container">

		<h2>렌트카 게시판 보기</h2>
		
		<div>
		
				<ul class="list-group">
				${carsVO }
		<!-- grid 를 사용한다면 class="col-md-2" 으로 할경우 깨짐 row 를 속성으로 넣어줘야 안깨진다 -->
<%-- 				<li class="list-group-item"><label>번호</label><strong id="no">${carBasicInfoVO.carInfoNo }</strong></li> --%>
<%-- 				<li class="list-group-item"><label>모델</label>${carBasicInfoVO.carName }</li> --%>
<%-- 				<li class="list-group-item"><label>연료</label>${carBasicInfoVO.carFuel }</li> --%>
<%-- 				<li class="list-group-item"><label>정원</label>${carBasicInfoVO.carCapacity }</li> --%>
<%-- 				<li class="list-group-item"><label>차종</label>${carBasicInfoVO.carTypes }</li> --%>
				<li class="list-group-item"><label>회사 이름</label>${companyVO.companyName }</li>
				<li class="list-group-item">
					<label>회사 연락처</label> - ${companyVO.tel }
				</li>
				<li class="list-group-item">
					<label>회사 주소</label>${companyVO.address }
				</li>
				<li class="list-group-item">
					<label>회사 등록 id</label>${companyVO.id }
				</li>
				<li class="list-group-item">
					<label>차등록번호</label>
					<p>${carsVO.carNo }</p>
				</li>
				<li class="list-group-item">
					<label>회사 번호</label>${carsVO.companyNo }
				</li>
				<li class="list-group-item">
					<label>가격</label>${carsVO.price}
				</li>
				<li class="list-group-item">
					<label>기어</label>${carsVO.gearbox}
				</li>
				<li class="list-group-item">
					<label>보험종류</label>${carsVO.insuranceType }
				</li>
				<li class="list-group-item">
					<label>대여가능 나이</label>${carsVO.rentAge }
				</li>
				<li class="list-group-item">
					<label>대여 가능 운전 경력</label>${carsVO.rentExperience }
				</li>
				<li class="list-group-item">
					<label>면허</label>${carsVO.license }
				</li>
				<li class="list-group-item">
					<label>보험 안내</label>${carsVO.insuranceInfo }
				</li>
				<li class="list-group-item">
					<label>참고사항</label>${carsVO.rentCarNote }
				</li>
				<li class="list-group-item">
					<label>취소/환불</label>${carsVO.cancelAndRefund }
				</li>
				<li class="list-group-item">
					<label>연식</label>${carsVO.modelYears }
				</li>
				<li class="list-group-item">
					<label>렌트카 등록 아이디</label>${carsVO.id }
				</li>
			</ul>	
			
		
		</div>
		${companyVO }
			<ul class="list-group">
				<li class="list-group-item">
					<p>
					회사명 : ${companyVO.companyName }				
					</p>
					<p>
					연락처 : ${companyVO.tel }				
					</p>
					<p>
					주소 : ${companyVO.address }				
					</p>
				</li>
				<li></li>
			</ul>
		
		<div>
		
		${carFileUploadVO }
		
		</div> 
		<span>날짜 ${carsVO.modelYears }
		
		
		</span>
		<div>
		${carBasicInfoVO}
		</div>
		
		<!-- 차량 옵션 -->
		<div>
		${carOptionVO }
						<!-- 차 옵션 -->
<%-- 						<p>${ vo.smoking == null ? "금연차량":"<strong>금연차량</strong>" } --%>
<%-- 						${ vo.navigation == null ? "네이게이션":"<strong>네이게이션</strong>" } --%>
<%-- 						${ vo.blackbox == null ? "블랙박스":"<strong>블랙박스</strong>" } --%>
<%-- 						${ vo.rearCamera == null ? "후방카메라":"<strong>후방카메라</strong>" }</p> --%>

<%-- 						<p>${ vo.frontSensor == null ? "전방센서":"<strong>전방센서</strong>" } --%>
<%-- 						${ vo.rearSensor == null ? "후방센서":"<strong>후방센서</strong>" }</p> --%>
<%-- 						<p>${ vo.sunroof == null ? "썬루프":"<strong>썬루프</strong>" } --%>
<%-- 						${ vo.bluetooth == null ? "블루투스":"<strong>블루투스</strong>" }</p> --%>

<%-- 						<p>${ vo.heatingSheet == null ? "열선시트":"<strong>열선시트</strong>" } --%>
<%-- 						${ vo.heatingHandle == null ? "열선핸들":"<strong>열선핸들</strong>" }</p> --%>
						
									<p>
				${(carOptionVO.smoking == '금연차량')? '<strong>금연차량</strong>':'금연차량'}
				${(carOptionVO.navigation == '네비게이션')? '<strong>네비게이션</strong>':'네비게이션'}
				${(carOptionVO.blackbox == '블랙박스')? '<strong>블랙박스</strong>':'블랙박스'}
				${(carOptionVO.rearCamera == '후방카메라')? '<strong>후방카메라</strong>':'후방카메라'}
			</p>
				<p>
				${(carOptionVO.frontSensor == '전방센서')? '<strong>전방센서</strong>':'전방센서'}
				"${(carOptionVO.rearSensor == '후방센서')? '<strong>후방센서</strong>':'후방센서'}
				${(carOptionVO.sunroof == '썬루프')? '<strong>썬루프</strong>':'썬루프'}
				${(carOptionVO.bluetooth == '블루투스')? '<strong>블루투스</strong>':'블루투스'}
				</p>
				<p>
				${(carOptionVO.heatingSheet == '열선시트')? '<strong>열선시트</strong>':'열선시트'}
				${(carOptionVO.heatingHandle == '열선핸들')? '<strong>열선핸들</strong>':'열선핸들'}
				${(carOptionVO.leatherSheet == '가죽시트')? '<strong>가죽시트</strong>':'가죽시트'}
				${(carOptionVO.ventilationSheet == '통풍시트')? '<strong>통풍시트</strong>':'통풍시트'}
				</p>
				<p>
				${(carOptionVO.carSeatPay == '카시트(유료)')? '<strong>카시트(유료)</strong>':'카시트(유료)'}
				${(carOptionVO.carSeatFree == '카시트(무료)')? '<strong>카시트(무료)</strong>':'카시트(무료)'}
				${(carOptionVO.driverAirbag == '운전석에어백')? '<strong>운전석에어백</strong>':'운전석에어백'}
				${(carOptionVO.passengerAirbag == '조수석에어백')? '<strong>조수석에어백</strong>':'조수석에어백'}
				</p>
				<p>
				${(carOptionVO.fourWheel == '4륜구동')? '<strong>4륜구동</strong>':'4륜구동'}
				${(carOptionVO.smartKey == '스마트키')? '<strong>스마트키</strong>':'스마트키'}
				${(carOptionVO.rearAutomaticDoor == '뒷자석자동문')? '<strong>뒷자석자동문</strong>':'뒷자석자동문'}
				${(carOptionVO.freeCharge == '전기충전무료')? '<strong>전기충전무료</strong>':'전기충전무료'}
				</p>
				<p>
				${(carOptionVO.usb == 'usb')? '<strong>usb</strong>':'usb'}
				${(carOptionVO.aux == 'aux')? '<strong>aux</strong>':'aux'}
				${(carOptionVO.dmb == 'dmb')? '<strong>dmb</strong>':'dmb'}
				${(carOptionVO.camping == '캠핑카')? '<strong>캠핑카</strong>':'캠핑카'}
				</p>
						
		</div>
		
					<!-- 이미지바꾸기 -->
					
		<img alt="차량 이미지" src="/upload/${carFileUploadVO.realSavePath}/s_${carFileUploadVO.fileName}" width="100px">
<!-- 					<form action="carBasicInfoImageDelete.do" method="post" -->
<!-- 						enctype="multipart/form-data"> -->
<!-- 						<div class="form-group"> -->
<%-- 							<input type="hidden" name="del" value="${carFileUploadVO.fileName != null ? carFileUploadVO.fileName:"0" }"> --%>
<%-- 							<input type="hidden" name="carNo" value="${carsVO.carNo }"> --%>
<%-- 							<input type="hidden" name="carInfoNo" value="${carBasicInfoVO.carInfoNo}"> --%>
<!-- 						</div> -->
<!-- 						<button class="btn btn-default">이미지 삭제</button> -->
<!-- 						<button type="button" id="cancelBtn" class="btn btn-default">취소</button> -->
<!-- 					</form> -->

				<!-- 이미지바꾸기 끝-->
		
		<ul class="list-group">
		</ul>
		<div>
		보험
		${carInsuranceVO }
		</div>
	<!-- 자차미포함 일때 보험 가격탭 나온다 + 일반자차,고급자차 둘다 표시 -->
	
	
	
<!--  선택한 날짜 차이에 따라 가격이 변해야한다 -->	
	<input class="datepicker">
	
	
<button type="button" onclick="location='/rentcarboard/rentCarBoardList.do'">리스트</button>
<!--회사 등록된 아이디와  관리자아이디가 같을 때만 보이게 한다 -->
<c:if test="${companyVO.id eq 'admin'}">

<button type="button" onclick="location='/rentcarboard/rentCarBoardUpdate.do?carNo=${carsVO.carNo}'">차량 정보 수정</button>

<c:if test="${!empty carInsuranceVO }">
<button type="button" onclick="location='/carinsurance/carInsuranceUpdate.do?carNo=${carsVO.carNo}&carInfoNo=${carBasicInfoVO.carInfoNo }'">보험 상세 수정</button>
</c:if>
<c:if test="${empty carInsuranceVO }">
<button type="button" onclick="location='/carinsurance/carInsuranceWrite.do?carNo=${carsVO.carNo}'">보험 등록</button>

</c:if>
<button type="button" onclick="location='/rentcarboard/rentCarBoardDelete.do?carNo=${carsVO.carNo}'">차량 삭제</button>
<!-- if(id = carsVO.id)  일때만 보이도록-->
<button type="button" onclick="location='/companycars/companyCarsList.do?carNo=${carsVO.carNo}&companyNo=${carsVO.companyNo }&carInfoNo=${carBasicInfoVO.carInfoNo }'">차량 번호판 리스트</button>

</c:if>

</div>


</body>
</html>