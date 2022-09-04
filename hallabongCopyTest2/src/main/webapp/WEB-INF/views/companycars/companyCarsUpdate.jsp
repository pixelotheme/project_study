<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>

<title>렌트카 리스트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>렌트카 수정</title>

<script type="text/javascript"
	src="/resources/js/rentCarJS/companyWrite.js"></script>
<script>
	//다음 api js 파일로 옮김
$(function(){
	

})
	
</script>

</head>
<body>
	<div class="container">
		<h2>번호판 수정</h2>
			
			<!-- 방금 등록한 차번호 -->
			<form action="" method="post">
				<input type="hidden" name="carNo" value="${param.carNo }">
				<input type="hidden" name="companyNo" value="${param.companyNo}">
				<input type="hidden" name="companyNo" value="${param.carInfoNo}">
						<div>
							<label for="licensePlate">번호</label> 
							<input name="licensePlate" id="licensePlate" value="${companyCarsVO.companyCarsNo}" readonly="readonly">
						</div>
						<div>
							<label for="licensePlate">번호판</label> 
							<input name="licensePlate" id="licensePlate" value="${companyCarsVO.licensePlate }">
						</div>
					
				
				
			<div>
				<button type="submit" id="submitBtn">등록</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
			</form>
			
			
			
			
		<!-- 


			 -->






	</div>
</body>
</html>