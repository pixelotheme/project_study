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

		<h2>이미지 게시판 보기</h2>

		${companyVO }
		${carsVO }
		${carOptionVO }
		
		<div>
		
		${carFileUploadVO }
		</div> 
		<span>날짜 ${carsVO.modelYears }
		
		
		</span>
		<div>
		${carBasicInfoVO}
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
	
	

<button type="button" onclick="location='/rentcarboard/rentCarUpdate.do?carNo=${carsVO.carNo}'">차량 정보 수정</button>

<c:if test="${!empty carInsuranceVO }">
<button type="button" onclick="location='/rentcarboard/carInsuranceUpdate.do?carNo=${carsVO.carNo}&carInfoNo=${carBasicInfoVO.carInfoNo }'">보험 상세 수정</button>
</c:if>
<c:if test="${empty carInsuranceVO }">
<button type="button" onclick="location='/rentcarboard/carInsuranceWrite.do?carNo=${carsVO.carNo}'">보험 등록</button>

</c:if>
<button type="button" onclick="location='/rentcarboard/deleteCar.do?carNo=${carsVO.carNo}'">차량 삭제</button>
<button type="button" onclick="location='/rentcarboard/list.do'">리스트</button>
<!-- if(id = carsVO.id)  일때만 보이도록-->
<button type="button" onclick="location='/rentcarboard/companyCarsList.do?carNo=${carsVO.carNo}&companyNo=${carsVO.companyNo }&carInfoNo=${carBasicInfoVO.carInfoNo }'">차량 번호판 리스트</button>


</div>


</body>
</html>