<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>렌트카 등록</title>

<script type="text/javascript"
	src="/resources/js/rentCarJS/companyWrite.js"></script>
<script>
	
</script>
</head>
<body>
	<div class="container">
	${carsVO }
	${carOptionVO }
	${carFileUploadVO }
		<h2>렌트카 수정</h2>
		<form method="post" id="actionForm" enctype="multipart/form-data">
		<input type="hidden" value="${varsVO.carNo }">
			<div>
			회사
				<select name="companyNo" >
					<c:forEach items="${companys }" var="company">
						<option value="${company.companyNo }" ${(carsVO.companyNo == company.companyNo)? 'selected':''} >${company.companyName }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label for="carName">차이름</label> <input name="carName" id="carName" value="${carsVO.carName }" />
			</div>
			<div>
				<label for="price">가격</label> <input name="price" id="price" value="${carsVO.price }"/>
			</div>
			<div>
			변속기
				<select name="gearbox">
					<option value="수동" ${(carsVO.gearbox == '수동')? 'selected':''}>수동</option>
					<option value="자동" ${(carsVO.gearbox == '자동')? 'selected':''}>자동</option>
				</select>
			</div>
			<div>
				<!-- yyyy-MM -->
				<label for="modelYears">연식</label> <input name="modelYears"
					id="modelYears" value="${carsVO.modelYears }" />
			</div>
			<div>
			보험
				<select name="insuranceType">
					<option value="자차미포함" ${(carsVO.insuranceType == '자차미포함')? 'selected':''}>자차미포함</option>
					<option value="일반자차포함" ${(carsVO.insuranceType == '일반자차포함')? 'selected':''}>일반자차포함</option>
					<option value="고급자차포함" ${(carsVO.insuranceType == '고급자차포함')? 'selected':''}>고급자차포함</option>
				</select>
			</div>
			<div>
			차종
				<select name="carTypes">
					<option value="소형" ${(carsVO.carTypes == '소형')? 'selected':''}>소형</option>
					<option value="중형"${(carsVO.carTypes == '중형')? 'selected':''}>중형</option>
					<option value="고급"${(carsVO.carTypes == '고급')? 'selected':''}>고급</option>
					<option value="suv/승합"${(carsVO.carTypes == 'suv/승합')? 'selected':''}>suv/승합</option>
					<option value="수입"${(carsVO.carTypes == '수입')? 'selected':''}>수입</option>
				</select>
			</div>
			<div>
				<!-- 숫자만 -->
				<label for="rentAge">대여가능 나이</label> <input name="rentAge"
					id="rentAge" value="${carsVO.rentAge }"/>
			</div>

			<div>
				<!-- 숫자만 -->
				<label for="rentExperience">대여가능 운전 경력</label> <input
					name="rentExperience" id="rentExperience"  value="${carsVO.rentExperience }"/>
			</div>
			<div>
				연료
				<select name="carFuel">
					<option value="휘발유"${(carsVO.carTypes == '휘발유')? 'selected':''}>휘발유</option>
					<option value="경유"${(carsVO.carTypes == '경유')? 'selected':''}>경유</option>
					<option value="LPG"${(carsVO.carTypes == 'LPG')? 'selected':''}>LPG</option>
					<option value="전기"${(carsVO.carTypes == '전기')? 'selected':''}>전기</option>
					<option value="하이브리드"${(carsVO.carTypes == '하이브리드')? 'selected':''}>하이브리드</option>
				</select>
			</div>
			<div>
				<!-- 정원 부터 -->
				<!-- 숫자만 -->
				<label for="carCapacity">정원</label> <input
					name="carCapacity" id="carCapacity" value="${carsVO.carCapacity }"/>
			</div>
			<div>
				<label for="license">면허</label> <input
					name="license" id="license" value="${carsVO.license }"/>
			</div>
			<div>
				<label for="insuranceInfo">보험내용</label>
				<textarea rows="10" name="insuranceInfo" id="insuranceInfo">${carsVO.insuranceInfo }</textarea>
			</div>
			<div>
				<label for="rentCarNote">참고사항</label>
				<textarea rows="10" name="rentCarNote" id="rentCarNote">${carsVO.rentCarNote }</textarea>
			</div>
			<div>
				<label for="cancelAndRefund">취소/환불규정</label>
				<textarea rows="10" name="cancelAndRefund" id="cancelAndRefund">${carsVO.cancelAndRefund }</textarea>
			</div>
				
			<div>
			기타 차량 옵션
			<p>
				<input type="checkbox" name="smoking" value="금연차량" ${(carOptionVO.smoking == '금연차량')? 'checked':''}>금연차량
				<input type="checkbox" name="navigation"value="네비게이션" ${(carOptionVO.navigation == '네비게이션')? 'checked':''}>네비게이션
				<input type="checkbox" name="blackbox"value="블랙박스"${(carOptionVO.blackbox == '블랙박스')? 'checked':''}>블랙박스
				<input type="checkbox" name="rearCamera"value="후방카메라"${(carOptionVO.rearCamera == '후방카메라')? 'checked':''}>후방카메라
			</p>
				<p>
				<input type="checkbox" name="frontSensor"value="전방센서"${(carOptionVO.frontSensor == '전방센서')? 'checked':''}>전방센서
				<input type="checkbox" name="rearSensor"value="후방센서"${(carOptionVO.rearSensor == '후방센서')? 'checked':''}>후방센서
				<input type="checkbox" name="sunroof"value="썬루프"${(carOptionVO.sunroof == '썬루프')? 'checked':''}>썬루프
				<input type="checkbox" name="bluetooth"value="블루투스"${(carOptionVO.bluetooth == '블루투스')? 'checked':''}>블루투스
				</p>
				<p>
				<input type="checkbox" name="heatingSheet"value="열선시트"${(carOptionVO.heatingSheet == '열선시트')? 'checked':''}>열선시트
				<input type="checkbox" name="heatingHandle"value="열선핸들"${(carOptionVO.heatingHandle == '열선핸들')? 'checked':''}>열선핸들
				<input type="checkbox" name="leatherSheet"value="가죽시트" ${(carOptionVO.leatherSheet == '가죽시트')? 'checked':''}>가죽시트
				<input type="checkbox" name="ventilationSheet"value="통풍시트" ${(carOptionVO.ventilationSheet == '통풍시트')? 'checked':''}>통풍시트
				</p>
				<p>
				<input type="checkbox" name="carSeatPay"value="카시트(유료)" ${(carOptionVO.carSeatPay == '카시트(유료)')? 'checked':''}>카시트(유료)
				<input type="checkbox" name="carSeatFree"value="카시트(무료)" ${(carOptionVO.carSeatFree == '카시트(무료)')? 'checked':''}>카시트(무료)
				<input type="checkbox" name="driverAirbag"value="운전석에어백" ${(carOptionVO.driverAirbag == '운전석에어백')? 'checked':''}>운전석에어백
				<input type="checkbox" name="passengerAirbag"value="조수석에어백" ${(carOptionVO.passengerAirbag == '조수석에어백')? 'checked':''}>조수석에어백
				</p>
				<p>
				<input type="checkbox" name="fourWheel"value="4륜구동" ${(carOptionVO.fourWheel == '4륜구동')? 'checked':''}>4륜구동
				<input type="checkbox" name="smartKey"value="스마트키" ${(carOptionVO.smartKey == '스마트키')? 'checked':''}>스마트키
				<input type="checkbox" name="rearAutomaticDoor"value="뒷자석자동문" ${(carOptionVO.rearAutomaticDoor == '뒷자석자동문')? 'checked':''}>뒷자석자동문
				<input type="checkbox" name="freeCharge"value="전기충전무료" ${(carOptionVO.freeCharge == '전기충전무료')? 'checked':''}>전기충전무료
				</p>
				<p>
				<input type="checkbox" name="usb"value="usb" ${(carOptionVO.usb == 'usb')? 'checked':''}>USB
				<input type="checkbox" name="aux"value="aux" ${(carOptionVO.aux == 'aux')? 'checked':''}>AUX
				<input type="checkbox" name="dmb"value="dmb" ${(carOptionVO.dmb == 'dmb')? 'checked':''}>DMB
				<input type="checkbox" name="camping"value="캠핑카" ${(carOptionVO.camping == '캠핑카')? 'checked':''}>캠핑카
				</p>
			</div>
			
			<div>
				<label for="license">사진</label> 
				<input type="file" name="uploadFile" multiple="multiple" >
			</div>
			
			<div>
			<label>기존 이미지</label>
			
				<img alt="" src="${carFileUploadVO.fileName }" width="100px">
				<p>${carFileUploadVO.orgFileName }[${carFileUploadVO.fileSize}]</p>

				<c:if test="${!empty carFileUploadVO.orgFileName }">
				<input name="del" value="${carFileUploadVO.fileName }" type="hidden">
				</c:if>
			</div>


			
			<div>
				<button id="submitBtn">등록</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
		</form>
		<!-- 


			 -->






	</div>
</body>
</html>