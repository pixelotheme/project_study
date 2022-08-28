<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<title>렌트카 리스트</title>
</head>
<body>
	<div class="container">
<div>
<span data-carNo="${companyCarsVO.carNo }"></span>
<span data-carInfoNo="${companyCarsVO.companyNo }"></span>
</div>
			<ul class="list-group">
		<!-- grid 를 사용한다면 class="col-md-2" 으로 할경우 깨짐 row 를 속성으로 넣어줘야 안깨진다 -->
		
				<li class="list-group-item"><label>번호</label><strong id="no">${companyCarsVO.companyCarsNo}</strong></li>
		
				<li class="list-group-item"><label>번호판</label>${companyCarsVO.licensePlate }</li>
		
				<li class="list-group-item"><label>정원</label>${companyCarsVO.booking == 1? "예약 불가":"예약 가능" }</li>
		
				<li class="list-group-item"><label>차종</label>${companyCarsVO.consumerId != null? "companyCarsVO.consumerId":"예약자가 없습니다" }</li>
			</ul>	
		<table width="100%"
			class="table table-striped table-bordered table-hover">




			<tbody>
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
				<tr>

					<td data-carNo="${companyCarsVO.carNo }"></td>
					<td data-carInfoNo="${companyCarsVO.companyNo }">
						<p>${companyCarsVO.companyCarsNo}</p>
					</td>
					<td>
						<!-- 차 옵션 --> ${companyCarsVO.licensePlate }
					</td>
					<td>${companyCarsVO.booking == 1? "예약 불가":"예약 가능" }</td>
					<td>${companyCarsVO.consumerId != null? "companyCarsVO.consumerId":"예약자가 없습니다" }</td>
				</tr>

			</tbody>

		</table>



		<button type="button"onclick="location='/companycars/companyCarsUpdate.do?companyCarsNo=${companyCarsVO.companyCarsNo }&carNo=${companyCarsVO.carNo}&companyNo=${companyCarsVO.companyNo }&carInfoNo=${param.carInfoNo }'">번호판 수정</button>
		<button type="button"onclick="location='/companycars/companyCarsDelete.do?companyCarsNo=${companyCarsVO.companyCarsNo }&carNo=${companyCarsVO.carNo}&companyNo=${companyCarsVO.companyNo }&carInfoNo=${param.carInfoNo }'">번호판 삭제</button>
<button type="button" onclick="location='/companycars/companyCarsList.do?carNo=${companyCarsVO.carNo}&companyNo=${companyCarsVO.companyNo }&carInfoNo=${param.carInfoNo }'">차량 번호판 리스트</button>


	</div>
</body>
</html>