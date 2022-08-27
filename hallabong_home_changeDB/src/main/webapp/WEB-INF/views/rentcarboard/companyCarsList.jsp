<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">



<title>렌트카 리스트</title>
</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline">
			<!-- 검색 key -->
			<div class="input-group">
				<select class="form-control" name="key" id="key">
						<option value="P">번호판</option>
						<option value="C">예약자</option>
				</select>
			</div>
			<!-- 검색 word -->
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search" name="word" value="${pageObject.word }">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- 검색 종료 -->
		<!-- 정렬을 위한 버튼 -->	
			
			
		<table width="100%"
			class="table table-striped table-bordered table-hover">
			
			
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/rentcarboard/companyCarsView.do?companyCarsNo=${vo.companyCarsNo}&carNo=${vo.carNo}&companyNo=${vo.companyNo }&carInfoNo=${param.carInfoNo }'">
						<td>
						</td>
						
						<td data-carNo="${vo.carNo }"></td>
						<td data-carInfoNo="${vo.companyNo }">
						<p>${vo.companyName}</p>
						<p>${vo.carName }</p>
						</td>
						<td>
						<!-- 차 옵션 -->
						${vo.licensePlate }
						</td>
						<td >
						${vo.booking }
						</td>
						<td >
						${vo.consumerId }
						</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
				

	<button type="button" onclick="location='/rentcarboard/companyCarsWrite.do?carNo=${param.carNo}&companyNo=${param.companyNo }&carInfoNo=${param.carInfoNo }'">번호판 등록</button>
	
	<button type="button" onclick="location='/rentcarboard/view.do?carNo=${param.carNo}&carInfoNo=${param.carInfoNo }'">렌트카 보기</button>
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="list.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>