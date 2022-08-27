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
	//다음 api js 파일로 옮김
$(function(){

	$("#InsurancePlus").hide();
	
	$("#InsurancePlusbtn").on("click",function(){
		$("#InsurancePlus").show();
		})	

	$("#selectCompany").on("change",function(){

		var checkId = $(this).find(':selected').data("id")
// 		alert(checkId);
		//아이디 비교할 예정 다르면 선택불가
		})
})
	
</script>
</head>
<body>
	<div class="container">
		<h2>렌트카 등록</h2>
		<form method="post" id="actionForm">
			<div>
			회사
				<select name="companyNo" id="selectCompany">
						<option>회사 선택</option>
					<c:forEach items="${companys }" var="company">
						<option value="${company.companyNo }" data-id="${company.id }">${company.companyName }</option>
					</c:forEach>
				</select>
				
			차량
				<select name="carInfoNo">
					<c:forEach items="${allCarBasicInfo }" var="carBasicInfo">
						<option value="${carBasicInfo.carInfoNo }">
						${carBasicInfo.carName }, 
						${carBasicInfo.carTypes }, 
						${carBasicInfo.carFuel},
						${carBasicInfo.carCapacity }
						</option>
					</c:forEach>
				</select>
			</div>
<!-- 			<div> -->
<!-- 				<label for="carName">차이름</label> <input name="carName" id="carName" /> -->
<!-- 			</div> -->
			<div>
				<label for="price">가격</label> <input name="price" id="price" />
			</div>
			<div>
			변속기
				<select name="gearbox">
					<option value="수동">수동</option>
					<option value="자동">자동</option>
				</select>
			</div>
			<div>
				<!-- yyyy-MM -->
				<label for="modelYears">연식</label> <input name="modelYears"
					id="modelYears" placeholder="yyyy-MM 형식"/>
			</div>
			<div>
			보험
				<select name="insuranceType">
					<option value="자차미포함">자차미포함</option>
					<option value="일반자차포함">일반자차포함</option>
					<option value="고급자차포함">고급자차포함</option>
				</select>
			</div>
<!-- 			<div> -->
<!-- 			차종 -->
<!-- 				<select name="carTypes"> -->
<!-- 					<option value="소형">소형</option> -->
<!-- 					<option value="중형">중형</option> -->
<!-- 					<option value="고급">고급</option> -->
<!-- 					<option value="suv/승합">suv/승합</option> -->
<!-- 					<option value="수입">수입</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
			<div>
				<!-- 숫자만 -->
				<label for="rentAge">대여가능 나이</label> <input name="rentAge"
					id="rentAge" />
			</div>

			<div>
				<!-- 숫자만 -->
				<label for="rentExperience">대여가능 운전 경력</label> <input
					name="rentExperience" id="rentExperience" />
			</div>
<!-- 			<div> -->
<!-- 				연료 -->
<!-- 				<select name="carFuel"> -->
<!-- 					<option value="휘발유">휘발유</option> -->
<!-- 					<option value="경유">경유</option> -->
<!-- 					<option value="LPG">LPG</option> -->
<!-- 					<option value="전기">전기</option> -->
<!-- 					<option value="하이브리드">하이브리드</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				정원 부터 -->
<!-- 				숫자만 -->
<!-- 				<label for="carCapacity">정원</label> <input -->
<!-- 					name="carCapacity" id="carCapacity" /> -->
<!-- 			</div> -->
			<div>
				<label for="license">면허</label> <input
					name="license" id="license" />
			</div>
			<div>
				<label for="insuranceInfo">보험내용</label>
				<textarea rows="10" name="insuranceInfo" id="insuranceInfo"></textarea>
			</div>
			<div>
				<label for="rentCarNote">참고사항</label>
				<textarea rows="10" name="rentCarNote" id="rentCarNote"></textarea>
			</div>
			<div>
				<label for="cancelAndRefund">취소/환불규정</label>
				<textarea rows="10" name="cancelAndRefund" id="cancelAndRefund"></textarea>
			</div>
				
			<div>
			기타 차량 옵션
			<p>
				<input type="checkbox" name="smoking" value="금연차량">금연차량
				<input type="checkbox" name="navigation"value=네비게이션>네비게이션
				<input type="checkbox" name="blackbox"value="블랙박스">블랙박스
				<input type="checkbox" name="rearCamera"value="후방카메라">후방카메라
			</p>
				<p>
				<input type="checkbox" name="frontSensor"value="전방센서">전방센서
				<input type="checkbox" name="rearSensor"value="후방센서">후방센서
				<input type="checkbox" name="sunroof"value="썬루프">썬루프
				<input type="checkbox" name="bluetooth"value="블루투스">블루투스
				</p>
				<p>
				<input type="checkbox" name="heatingSheet"value="열선시트">열선시트
				<input type="checkbox" name="heatingHandle"value="열선핸들">열선핸들
				<input type="checkbox" name="leatherSheet"value="가죽시트">가죽시트
				<input type="checkbox" name="ventilationSheet"value="통풍시트">통풍시트
				</p>
				<p>
				<input type="checkbox" name="carSeatPay"value="카시트(유료)">카시트(유료)
				<input type="checkbox" name="carSeatFree"value="카시트(무료)">카시트(무료)
				<input type="checkbox" name="driverAirbag"value="운전석에어백">운전석에어백
				<input type="checkbox" name="passengerAirbag"value="조수석에어백">조수석에어백
				</p>
				<p>
				<input type="checkbox" name="fourWheel"value="4륜구동">4륜구동
				<input type="checkbox" name="smartKey"value="스마트키">스마트키
				<input type="checkbox" name="rearAutomaticDoor"value="뒷자석자동문">뒷자석자동문
				<input type="checkbox" name="freeCharge"value="전기충전무료">전기충전무료
				</p>
				<p>
				<input type="checkbox" name="usb"value="usb">USB
				<input type="checkbox" name="aux"value="aux">AUX
				<input type="checkbox" name="dmb"value="dmb">DMB
				<input type="checkbox" name="camping"value="캠핑카">캠핑카
				</p>
			</div>
			
<!-- 			<div> -->
<!-- 				<label for="license">사진</label>  -->
<!-- 				<input type="file" name="uploadFile" multiple="multiple" > -->
<!-- 			</div> -->



			
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