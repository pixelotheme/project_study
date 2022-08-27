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
						<option value="">회사 선택</option>
					<c:forEach items="${companys }" var="company">
						<option value="${company.companyName }">${company.companyName }</option>
					</c:forEach>
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
			
		<table width="100%"
			class="table table-striped table-bordered table-hover">
			
			
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/rentcarboard/view.do?carNo=${vo.carNo}&carInfoNo=${vo.carInfoNo }'">
						<td>
						<img alt="차량 이미지" src="/upload/${vo.realSavePath}/s_${vo.fileName}" width="100px">
						</td>
						
						<td data-carNo="${vo.carNo }">
						<td data-carInfoNo="${vo.carInfoNo }">
						<p>${vo.companyName}</p>
						<p>${vo.carName }</p>
						<p>${vo.insuranceType == null ? "자차미포함":"'vo.insuranceType'" }
						${vo.carTypes }
						${vo.carFuel }</p>
						<p><fmt:formatDate value="${vo.modelYears }" pattern="yyyy-MM"/> 
						, ${vo.rentAge }</p>
						</td>
						<td>
						<!-- 차 옵션 -->
						<p>${ vo.smoking == null ? "금연차량":"<strong>금연차량</strong>" }
						${ vo.navigation == null ? "네이게이션":"<strong>네이게이션</strong>" }</p>
						<p>${ vo.blackbox == null ? "블랙박스":"<strong>블랙박스</strong>" }
						${ vo.rearCamera == null ? "후방카메라":"<strong>후방카메라</strong>" }</p>
						<p>${ vo.frontSensor == null ? "전방센서":"<strong>전방센서</strong>" }
						${ vo.rearSensor == null ? "후방센서":"<strong>후방센서</strong>" }</p>
						<p>${ vo.sunroof == null ? "썬루프":"<strong>썬루프</strong>" }
						${ vo.bluetooth == null ? "블루투스":"<strong>블루투스</strong>" }</p>
						<p>${ vo.heatingSheet == null ? "열선시트":"<strong>열선시트</strong>" }
						${ vo.heatingHandle == null ? "열선핸들":"<strong>열선핸들</strong>" }</p>
						
						</td>
						<td >
						<span class="carPrice"><fmt:formatNumber value="${vo.price }" pattern="#,###"/></span>원
						</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
				

	<button type="button" onclick="location='/rentcarboard/rentCarCompanyList.do'">회사리스트</button>
<!-- 	<button type="button" onclick="location='/rentcarboard/rentCarCompanyWrite.do'">회사등록</button> -->
<!-- 	<button type="button" onclick="location='/rentcarboard/rentCarCompanyUpdate.do'">회사정보 수정</button> -->
	<button type="button" onclick="location='/rentcarboard/carBasicInfoList.do'">차종 리스트</button>
	
	<button type="button" onclick="location='/rentcarboard/rentCarWrite.do'">렌트카 등록</button>
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="list.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>