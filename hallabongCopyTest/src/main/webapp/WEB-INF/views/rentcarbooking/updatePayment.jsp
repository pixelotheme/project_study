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




	
	$("#accountTransfer").hide();
	$("#creditCard").hide();
	
	$("#paymentType").on("change", function(){
		var type = $("#paymentType").val();
// 		alert(type);
		if(type == '카드'){
			$("#creditCard").show();
			$("#accountTransfer").hide();
			}
		else if(type == '계좌이체'){
			$("#accountTransfer").show();
			$("#creditCard").hide();
			}

		})
	$("#paymentID").on("click",function(){
		event.preventDefault();
		var type = $("#paymentType").val();
		if(type == ""){
			alert("결제방법을 선택해주세요")
			return;
			}
		else{
			if(type == '카드'){
// 				alert(type+"1")
				
				$("#accountTransferId").html("");
				}
			else{
// 				alert(type+"2")
				$("#creditCardSpan").html("");
				}
			$("#paymentForm").submit();
			}
		})

		//랜덤 값 계좌처럼 출력
		var random = "${random}";
		random = random.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, "-")
	$("#paymentAccountID").val(random);


		
});
// 		$("#paymentType").val("${param.paymentType}");
		
		jQuery(document).ready(function() {

//		 	   alert("로딩 완료"); 
				//페이지 로드가 끝나면 value에 넣어주고 - selected 된 것을 바꿔준다
			   $("#paymentType option[value=${vo.paymentType}]").prop('selected','selected').change();
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
<!-- /.row -->

<!-- row 회원정보 열-->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">사용자 정보 입력</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" id="paymentForm">
				<input type="hidden" value="${vo.bookingNo }" name="bookingNo" />
				
				
					<div class="form-group">
						<label>결제종류</label>
						<select name="paymentType" id="paymentType">
							<option value="">결제 방법 선택</option>
							<option value="카드">신용카드</option>
							<option value="계좌이체">계좌이체</option>
						</select>
					</div>
					<div class="form-group" id="companyDIV">
						<label>결제회사</label>
						<span id="creditCardSpan">
							<select name="paymentCompany" id="creditCard">
								<option value="삼성">삼성</option>
								<option value="현대" >현대</option>
								<option value="농협" >농협</option>
								<option value="신한" >신한</option>
							</select>
						
						</span >
						<span id="accountTransferId">
							<select name="paymentCompany" id="accountTransfer">
								<option value="${vo.companyName }">${vo.companyName }</option>
<%-- 								<option value="${vo.companyName }">${vo.companyName }</option> --%>
							</select>
						</span>						
					</div>
						<div class="form-group">
							<label>결제계좌</label> 
							<input class="form-control" name="paymentAccount" value="${vo.paymentAccount}"/>
								
						</div>

					<button type="submit" class="btn btn-default" id="paymentID">예약하기</button>
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