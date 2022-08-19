<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>렌트카 회사 등록</title>

<script>
function daumZipCode() {
 new daum.Postcode({
     oncomplete: function(data) {
// 팝업에서 검색결과 항목을 클릭했을때 
//실행할 코드를 작성하는 부분.
 
         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 
//이를 참고하여 분기 한다.
         var fullAddr = ''; // 최종 주소 변수
         var extraAddr = ''; // 조합형 주소 변수
 
         // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 
         //가져온다.
// 사용자가 도로명 주소를 선택했을 경우         
         if (data.userSelectedType === 'R') { 
             fullAddr = data.roadAddress;
 
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             fullAddr = data.jibunAddress;
         }
 
         // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
         if(data.userSelectedType === 'R'){
             //법정동명이 있을 경우 추가한다.
             if(data.bname !== ''){
                 extraAddr += data.bname;
             }
             // 건물명이 있을 경우 추가한다.
             if(data.buildingName !== ''){
                 extraAddr += (extraAddr !== '' ? ', ' 
+ data.buildingName : data.buildingName);
             }
             // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
             fullAddr += (extraAddr !== '' ? 
                     ' ('+ extraAddr +')' : '');
         }
 
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('zipcode').value 
             = data.zonecode; //5자리 새우편번호 사용
         document.getElementById('streetAdr').value 
             = fullAddr;
 
         // 커서를 상세주소 필드로 이동한다.
         document.getElementById('detailAdr').focus();
     }
 }).open();
}
</script>
</head>
<body>
	<div class="container">
	<h2>렌트카 회사 등록</h2>
		<form method="post">
		
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
			<div class="input-group">
				<!--  주소 api 쓰기-->
<!-- 				<label for="address"></label> -->
				<p>    우편번호 : <input name="zipcode" id="zipcode" readonly size="10" class="form-control" placeholder="우편변호">
				    <input type="button" onclick="daumZipCode()" value="우편번호 찾기"> </p>
				    주소 : <input name="streetAdr" id="streetAdr" size="60" class="form-control" placeholder="주소"><br>
				    상세주소 : <input name="detailAdr" id="detailAdr" class="form-control" placeholder="상세주소">
			</div>		
			<div>
				<button>등록</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
		
		</form>
		
		
		
	</div>
</body>
</html>