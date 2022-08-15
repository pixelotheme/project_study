<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script type="text/javascript" src="/resources/js/regEx.js"></script>
<script type="text/javascript" src="/resources/js/form.js"></script>

<script type="text/javascript">
$(function(){
	if(!checkReg("startDate","공지시작일", reg_date, reg_date_mg)) return false;
	if(!checkReg("endDate","공지종료일", reg_date, reg_date_mg)) return false;
})
</script>

</head>
<body>

	<div class="container">
		<form method="post">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="title" required="required"/>
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea rows="3" class="form-control" name="content" required="required""></textarea>
			</div>
			<div class="form-group">
				<label for="startDate">시작일 </label> 
				<input name="startDate" type="text" class="form-control" id="startDate"/>
			</div>
			<div class="form-group">
				<label for="endDate">종료일 </label> 
				<input name="endDate" type="text" class="form-control" id="endDate"/>
			</div>
			
		</form>
	</div>

</body>
</html>