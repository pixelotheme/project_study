<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>렌트카 회사 수정</title>

<script type="text/javascript" src="/resources/js/rentCarJS/companyWrite.js"></script>
<script>
$(function(){

	var companyNo = 0;
	
	//렌트카 회사를 선택할때 변경되게
	$("#companySelect").on("change",function(){
		//넘어가는 데이터 회사 번호

		companyNo = $(this).val();
// 		alert(companyNo);
	 	$.getJSON(
		 		 "/rentcarboardajaxcontroller/companyView.do?companyNo="+companyNo,
		 		function(data){ 
					
		 			if(data){ 
			 			
		 			 
		 			 $("#companyName").val(data.companyView.companyName);
		 			 $("#tel").val(data.companyView.tel);
		 			 $("#updateCompanyNo").val(data.companyView.companyNo);
		 			 
		 			 $("#zipcode").val(data.companyView.zipcode);
		 			 $("#streetAdr").val(data.companyView.streetAdr);
		 			 $("#detailAdr").val(data.companyView.detailAdr);

		 			 $("#id").val(data.companyView.id);
		 			return ;
		 			} 
		 			else{
		 			
		 			if(cvo != null && cvo.length > 0){ alert("데이터가 있습니다.");}
		 			else{alert("데이터가 없습니다.");}
		 			
		 			}
		 		}
		 	).fail(function(xhr, status, error){
		 		if(error)
		 			error();
		 			
		 	});//getJSON() 의 끝
		 	
	
	})


//회사 삭제
	$("#deleteBtn").on("click", function(){
			alert(companyNo)
		location='companyDelete.do?companyNo='+companyNo;
		})
//리스트로 돌아가기
		$("#cancelBtn").on("click", function(){
		location='/rentcarcompany/rentCarCompanyList.do?';
		})
//수정시 아이디비교
		$("#submitBtn").on("click", function(){
			// "test" 자리에 로그인 아이디 넣어주면된다
			if($("#id").val() == "test"){
				
				$("#updateForm").submit();
				}
			else{
				alert("수정 권한이없습니다")
				}
		})


		//로드가 되면 change 시키는것은 어떤가
jQuery(document).ready(function() {

// 	   alert("로딩 완료"); 
	   $("#companySelect option[value=${param.companyNo}]").prop('selected','selected').change();
	});		
})

</script>
</head>
<body>
	<div class="container">
	<h2>렌트카 회사 등록</h2>
			<div>
			회사
				<select name="companyNo" id="companySelect">
						<option selected="selected">회사 선택</option>
					<c:forEach items="${companyVO }" var="company">
						<option value="${company.companyNo }" >${company.companyName }</option>
					</c:forEach>
				</select>
			</div>
	
		<form method="post" id="updateForm">
		<input type="hidden" value="" id="updateCompanyNo" name="companyNo">
		
		
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="id">등록한 아이디</label>
				<input name="id" id="id" class="form-control" readonly="readonly">
			</div>		
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="companyName">회사명</label>
				<input name="companyName" id="companyName" class="form-control" required="required">
			</div>		
			<div class="form-group">
				<!--  나중에 유효성검사 010-0000-0000 으로 자동으로 바뀌게 해주기 -->
				<label for="tel">연락처</label>
				<input name="tel" id="tel" class="form-control" required="required">
			</div>		
			
			<div>
			<label>현재 주소</label>
			<div></div>
			</div>
			<div class="input-group">
				<!--  주소 api 쓰기-->
<!-- 				<label for="address"></label> -->
				<p>    우편번호 : <input name="zipcode" id="zipcode" readonly size="10" class="form-control" placeholder="우편변호">
				    <input type="button" onclick="daumZipCode()" value="우편번호 찾기"> </p>
				    주소 : <input name="streetAdr" id="streetAdr" size="60" class="form-control" placeholder="주소"><br>
				    상세주소 : <input name="detailAdr" id="detailAdr" class="form-control" placeholder="상세주소">
			</div>		
			<div>
				<button type="button" id="submitBtn">수정</button>
				<button type="reset">새로입력</button>
				<button type="button" id="deleteBtn">회사 삭제</button>
				<button type="button" id="cancelBtn">취소, 리스트</button>
			</div>
		
		</form>
		
		
		
	</div>
</body>
</html>