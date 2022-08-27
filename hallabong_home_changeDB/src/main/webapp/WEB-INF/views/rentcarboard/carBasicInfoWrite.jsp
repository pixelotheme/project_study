<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 기본정보</title>
</head>
<body>
	<div class="container">
	<h2>차량 기본정보 등록</h2>
		<form  method="post" id="actionForm" enctype="multipart/form-data">
		
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="carName">차 이름</label>
				<input name="carName" id="carName" class="form-control" required="required">
			</div>		
			<div>
			차종
				<select name="carTypes">
					<option value="소형">소형</option>
					<option value="중형">중형</option>
					<option value="고급">고급</option>
					<option value="suv/승합">suv/승합</option>
					<option value="수입">수입</option>
				</select>
			</div>	
			<div class="form-group">
				<label for="carCapacity">차량 정원</label>
				<input name="carCapacity" id="carCapacity" class="form-control" required="required">
			</div>		
			<div>
				연료
				<select name="carFuel">
					<option value="휘발유">휘발유</option>
					<option value="경유">경유</option>
					<option value="LPG">LPG</option>
					<option value="전기">전기</option>
					<option value="하이브리드">하이브리드</option>
				</select>
			</div>	
			
			<div>
				<label for="uploadFile">사진</label> 
				<input type="file" name="uploadFile" multiple="multiple" >
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