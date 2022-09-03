<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세정보 작성</title>

   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	
	// 리스트버튼 클릭 이벤트 -> 글보기로 이동
	$("#listBtn").on("click", function(){
		// alert("글보기로 이동");
		location = "list.do?"
					+ "&page=" + "${param.page}"
					+ "&perPageNum=" + "${param.perPageNum}"
					+ "&key=" + "${param.key}"
					+ "&word=" + "${param.word}";
	});

	// 글수정 버튼 이벤트
	$("#updateBtn").on("click", function(){
		// alert("글등록으로 이동");
		location = "update.do?bookingNo=${vo.bookingNo}"
		+ "&page=" + "${param.page}"
		+ "&perPageNum=" + "${param.perPageNum}"
		+ "&key=" + "${param.key}"
		+ "&word=" + "${param.word}";
	});
	
	// 삭제 버튼 이벤트
	$("#deleteBtn").on("click", function(){
		// alert("새로고침 클릭");
		if(confirm("삭제?")){
		location = "delete.do?bookingNo=${vo.bookingNo}&perPageNum=${param.perPageNum}";
			}
	});
	
});
</script>
</head>
<body>
<div class="container">
	<!-- 페이지 제목 줄 -->
	<div class="row">
		<div class="col-md-12">
		<h2>예약 상세정보 작성</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	

	
	<!-- 데이터 표시 -->
${vo }
<!-- /.row -->
<div class="row">
	<!-- /.col-lg-12 차량 정보 표시 -->
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">차량 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
					<div class="form-group">
						<label>회사이름</label> <input class="form-control" value="${vo.companyName }" />
					</div>
					<div class="form-group">
						<label>차량이름</label> <input class="form-control" value="${vo.companyName }" />
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" value="${vo.carFuel }"  />
					</div>
					<div class="form-group">
						<label>보험종류</label> <input class="form-control" value="${vo.insuranceType }" />
					</div>
					<div class="form-group">
						<label>대여일</label> <input class="form-control" value="${param.rentalDate }" />
					</div>
					<div class="form-group">
						<label>반납일</label> <input class="form-control" value="${param.returnDate }"  />
					</div>
					<div class="form-group">
						<label>상품금액</label> <input class="form-control" value="${vo.prePrice }" />
					</div>
					<div class="form-group">
						<label>최종금액</label> <input class="form-control" value="${vo.totalPrice }"  />
					</div>


				

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 차량 정보 표시 -->
</div>
<!--/. row -->

<!-- row 회원정보 열-->
<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">회원 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="name" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="email" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control" name="tel" readonly="readonly" />
					</div>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">사용자 정보 입력</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form method="post">
				<input type="hidden" value="${vo.carNo }" name="carNo">
				<input type="hidden" value="${vo.companyNo }" name="companyNo">
				<input type="hidden" value="${vo.carInfoNo }" name="carInfoNo">
				<input type="hidden" value="${companyCarsNo.companyCarsNo }" name="companyCarsNo">
				<input type="hidden" value="${vo.prePrice }" name="prePrice" />
				<input type="hidden" value="${vo.totalPrice }" name="totalPrice" />				
				<input type="hidden" value="test" name="consumerId" />		
				<input type="text" value="${vo.companyName}" name="companyName" />		
<%-- 				<input type="hidden" value='${param.rentalDate }' name="rentalDate"> --%>
<%-- 				<input type="hidden" value='${param.returnDate }' name="returnDate"> --%>
				<input type="hidden" name="rentalDate" value='<fmt:formatDate value="${vo.rentalDate }" pattern="yyyy-MM-dd"/>'/>
				<input type="hidden" name="returnDate" value='<fmt:formatDate value="${vo.returnDate }" pattern="yyyy-MM-dd"/>'/>
<%-- 					<fmt:formatDate value="${param.returnDate }" pattern="yyyy-MM-dd"/> --%>
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="userName" />
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="userEmail" />
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control" name="userTel" />
					</div>
					<div class="form-group">
						<label>면허번호</label> <input class="form-control" name="drivingLicense" />
					</div>
					<button type="submit" class="btn btn-default">예약하기</button>
					<button type="reset" class="btn btn-default">새로고침</button>
				</form>

				

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>

	
</div>
<!-- /.row  -->
	<!-- /.데이터 표시 끝 -->
	
	<!--  버튼 -->
	<div class="row">
		<div class="col-md-4">
			<div class="btn-group" style="padding: 20px;">
			  <button type="button" class="btn btn-default" id="updateBtn">수정</button>
			  <button type="button" class="btn btn-default" id="deleteBtn">삭제</button>
			  <button type="button" class="btn btn-default" id="listBtn">리스트</button>
			</div>
		</div>
	</div>
	
	<!-- 버튼 끝-->
	
	
</div>

</body>
</html>