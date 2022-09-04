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


<script type="text/javascript">
$(function(){
	
})
</script>

</head>
<body>
<div class="container">

		<h2>이미지 게시판 보기</h2>

		
		<div>
		${carBasicInfoVO}
		</div>
				<ul class="list-group">
		<!-- grid 를 사용한다면 class="col-md-2" 으로 할경우 깨짐 row 를 속성으로 넣어줘야 안깨진다 -->
				<li class="list-group-item"><label>번호</label><strong id="no">${carBasicInfoVO.carInfoNo }</strong></li>
				<li class="list-group-item"><label>모델</label>${carBasicInfoVO.carName }</li>
				<li class="list-group-item"><label>연료</label>${carBasicInfoVO.carFuel }</li>
				<li class="list-group-item"><label>정원</label>${carBasicInfoVO.carCapacity }</li>
				<li class="list-group-item"><label>차종</label>${carBasicInfoVO.carTypes }</li>
			</ul>	
			
					<!-- 이미지바꾸기 -->
			
							<img alt="차량 이미지" src="/upload/${carFileUploadVO.realSavePath}/s_${carFileUploadVO.fileName}" width="100px">
												
					<form action="carBasicInfoImageDelete.do" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="del" value="${carFileUploadVO.fileName != null ? carFileUploadVO.fileName:"0" }">
<%-- 							<input type="hidden" name="carNo" value="${carsVO.carNo }"> --%>
							<input type="hidden" name="carInfoNo" value="${carBasicInfoVO.carInfoNo}">
						</div>
						<button class="btn btn-default">이미지 삭제</button>
						
					</form>

				<!-- 이미지바꾸기 끝-->
		
		<ul class="list-group">
		</ul>
	
	

<button type="button" onclick="location='/carbasicinfo/carBasicInfoUpdate.do?carInfoNo=${carBasicInfoVO.carInfoNo}'">차량 기본 정보 수정</button>

<button type="button" onclick="location='/carbasicinfo/carBasicInfoDelete.do?carInfoNo=${carBasicInfoVO.carInfoNo}'">차량 기본 정보 삭제</button>
<button type="button" onclick="location='/carbasicinfo/carBasicInfoList.do'">리스트</button>

</div>


</body>
</html>