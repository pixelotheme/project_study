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


	//대여,반납일
	$("#dateChange").on("change",function(){

		 var prePrice =  "${vo.prePrice}";
		 var rentalDate = $("#rentalDate").val();
		 var returnDate = $("#returnDate").val();
		if(!rentalDate){
			alert("대여일을 선택해주세요")
			return
			}
		if(!returnDate){
			alert("반납일을 선택해주세요")
			return			
			}
//		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: $("#plusPrice").data("price")}
		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: prePrice}
		
		alert(JSON.stringify(Date))

		$.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/totalPrice.do',
			     data: JSON.stringify(Date),
			     contentType: "application/json; charset=utf-8",
//			     success: function (data,status, xhr) {
			     success: function (data,status, xhr) {
			        if (data) {
						if(data.totalPrice == prePrice){
							alert("대여,반납일을 다시선택해주세요")
							}
						else{
							alert("성공 "+data.totalPrice);
							var ajaxPrice = data.totalPrice;

							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = "<p>"+formatPrice+"</p>"
							$("#bookingPrice").html(str);
							$("#totalPrice").attr("value", ajaxPrice)
							}

//			         $("#totalPrice").val(data);
			        }
			     },
			     error: function (xhr,status, error){
			    	  	alert("에러"+error);
			    	  }
			   });//end of ajax
	
	})
	
	
});
jQuery(document).ready(function() {

//	   alert("로딩 완료"); 
		//페이지 로드가 끝나면 value에 넣어주고 - selected 된 것을 바꿔준다
	   $("#bookingStatus option[value=${bookingVO.bookingStatus}]").prop('selected','selected').change();
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
						<label>차량이름</label> <input class="form-control" value="${vo.carName }" />
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" value="${vo.carFuel }"  />
					</div>
					<div class="form-group">
						<label>보험종류</label> <input class="form-control" value="${vo.insuranceType }" />
					</div>
					<div class="form-group">
						<label>대여일</label> <input class="form-control" value='<fmt:formatDate value="${bookingVO.rentalDate }" pattern="yyyy-MM-dd"/>' />
					</div>
					<div class="form-group">
						<label>반납일</label> <input class="form-control" value='<fmt:formatDate value="${bookingVO.returnDate }" pattern="yyyy-MM-dd"/>'  />
					</div>
					<div class="form-group">
						<label>상품금액</label> <input class="form-control" value="${vo.prePrice }" />
					</div>
					<div class="form-group">
						<label>최종금액</label> <input class="form-control" value="${bookingVO.totalPrice }"  />
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
				
				<input type="hidden" value="${bookingVO.bookingNo }" name="bookingNo">
				<input type="hidden" value="${bookingVO.carNo }" name="carNo">
				<input type="hidden" value="${bookingVO.companyNo }" name="companyNo">
				<input type="hidden" value="${bookingVO.carInfoNo }" name="carInfoNo">
				<input type="hidden" value="${bookingVO.companyCarsNo }" name="companyCarsNo">
				<input type="hidden" value="${vo.prePrice }" name="prePrice" />
				<input type="hidden" value="${bookingVO.totalPrice }" name="totalPrice" id="totalPrice" />				
				<input type="hidden" value="test" name="consumerId" />		
				<input type="hidden" value="${bookingVO.companyName}" name="companyName" />	
				<input type="hidden" value="${bookingVO.paymentType}" name="paymentType" />	
				<input type="hidden" value="${bookingVO.paymentAccount}" name="paymentAccount" />	
					
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="userName" value="${bookingVO.userName }"/>
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="userEmail" value="${bookingVO.userEmail }"/>
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control" name="userTel" value="${bookingVO.userTel }"/>
					</div>
					<div class="form-group">
						<label>면허번호</label> <input class="form-control" name="drivingLicense"value="${bookingVO.drivingLicense }" />
					</div>
					
					<div id="dateChange">
						<div>
							<label for="rentalDate">대여일</label>
							<input class="datepicker" id="rentalDate" name='rentalDate' value='<fmt:formatDate value="${bookingVO.rentalDate }" pattern="yyyy-MM-dd"/>'/>
						</div>
						<div>
							<label for="returnDate">반납일</label>
							<input class="datepicker" id="returnDate" name='returnDate' value='<fmt:formatDate value="${bookingVO.returnDate }" pattern="yyyy-MM-dd"/>'>
						</div>
					</div>
					
					<div id="bookingPrice">
						<fmt:formatNumber value="${vo.prePrice}" pattern="#,###" />
					</div>
					<!-- 관리자 권한일때만 수정가능 -->					
					<div>
						<select name="bookingStatus" id="bookingStatus">
							<option value="예약">예약</option>
							<option value="결제">결제</option>
							<option value="대여">대여</option>
							<option value="반납">반납</option>
						</select>
					
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