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

</head>
<body>
<div class="container">

		<h2>이미지 게시판 보기</h2>

		${companyVO }
		${carsVO }
		${carOptionVO }
		${carInsuranceVO }
		${carFileUploadVO }
		<span>날짜 ${carsVO.modelYears }
		<img alt="이미지" src="${carFileUploadVO.fileName }">
		</span>
		<ul class="list-group">
		</ul>
	
	<!-- 자차미포함 일때 보험 가격탭 나온다 - -->
	
	
	
<!--  선택한 날짜 차이에 따라 가격이 변해야한다 -->	
	<input class="datepicker">
	
	

<button type="button" onclick="location='/rentcarboard/rentCarUpdate.do?carNo=${carsVO.carNo}'">차량 수정</button>
<button type="button" onclick="location='/rentcarboard/carInsuranceUpdate.do?carNo=${carsVO.carNo}'">보험 상세 수정</button>

<button type="button" onclick="location='/rentcarboard/deleteCar.do?carNo=${carsVO.carNo}'">차량 삭제</button>
<button type="button" onclick="location='/rentcarboard/list.do'">리스트</button>

</div>


</body>
</html>