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
		$("#InsurancePlus").fadeToggle(100);
		})	
		
		
	$("#submitBtn").on("click",function(){


			let carInsuranceVOList = [
				{
					category : $("#category1").val(),
					insurancePrice : $("#insurancePrice1").val(),
					insuranceAge :$("#insuranceAge1").val(),
					insuranceExperience :$("#insuranceExperience1").val(),
					compensation :$("#compensation1").val(),
					customerCharge :$("#customerCharge1").val(),
					carNo : "${param.carNo }"
				}
				,
				{
					category : $("#category2").val(),
				insurancePrice : $("#insurancePrice2").val(),
				insuranceAge :$("#insuranceAge2").val(),
				insuranceExperience :$("#insuranceExperience2").val(),
				compensation :$("#compensation2").val(),
				customerCharge :$("#customerCharge2").val(),
				carNo : "${param.carNo }"
				} 
	
				];

		alert(JSON.stringify(carInsuranceVOList))
//{ carInsuranceVOList : JSON.stringify(carInsuranceVOList) } 이렇게 넘겼다가 하루종일 못넘김 ;;
		   $.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/writeCarInsurance.do',
			     traditional: true,
			     data: JSON.stringify(carInsuranceVOList),
			     contentType: "application/json; charset=utf-8",
			     success: function (data,status, xhr) {
			        if (data) {
			          alert("성공 "+data);
			          location='/rentcarboard/list.do';
			        }
			     },
			     error: function (xhr,status, error){
			    	  	alert(error);
			    	  }
			   });//end of ajax
		
		})
	

})
	
</script>
</head>
<body>
	<div class="container">
		<h2>렌트카 등록</h2>
			
			<!-- 방금 등록한 차번호 -->

			
			 <div>
			보험 카테고리
				<select name="category" id="category1">
					<option value="일반자차" selected="selected">일반자차</option>
					<option value="고급자차">고급자차</option>
				</select>			
			</div>
			<div>
				<label for="insurancePrice">보험금</label> 
				<input name="insurancePrice" id="insurancePrice1">
			</div>
			
			<div>
				<label for="insuranceAge">보험 가입 대상 나이</label> 
				<input name="insuranceAge" id="insuranceAge1">
			</div>
			<div>
				<label for="insuranceExperience">보험 가입 운전경력</label> 
				<input name="insuranceExperience" id="insuranceExperience1">
			</div>
			<div>
				<label for="compensation">보상한도</label> 
				<input name="compensation" id="compensation1">
			</div>
			<div>
				<label for="customerCharge">고객 부담금</label> 
				<textarea rows="5" name="customerCharge" id="customerCharge1"></textarea>
			</div>
			
			<button id="InsurancePlusbtn" type="button">보험 내용 추가</button>
				<div id="InsurancePlus">
					<div>
					보험 카테고리
						<select name="category" id="category2">
							<option value="일반자차">일반자차</option>
							<option value="고급자차" selected="selected">고급자차</option>
						</select>			
					</div>
					<div>
						<label for="insurancePrice">보험금</label> 
						<input name="insurancePrice" id="insurancePrice2">
					</div>
					
					<div>
						<label for="insuranceAge">보험 가입 대상 나이</label> 
						<input name="insuranceAge" id="insuranceAge2">
					</div>
					<div>
						<label for="insuranceExperience">보험 가입 운전경력</label> 
						<input name="insuranceExperience" id="insuranceExperience2">
					</div>
					<div>
						<label for="compensation">보상한도</label> 
						<input name="compensation" id="compensation2">
					</div>
					<div>
						<label for="customerCharge">고객 부담금</label> 
						<textarea rows="5" name="customerCharge" id="customerCharge2"></textarea>
					</div>
				</div>
			
			<div>
				<button type="button" id="submitBtn">등록</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
		<!-- 


			 -->






	</div>
</body>
</html>