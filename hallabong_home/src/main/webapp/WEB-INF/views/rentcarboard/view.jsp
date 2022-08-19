<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>렌트카 view</title>

</head>
<body>
<div class="container">

		<h2>이미지 게시판 보기</h2>

		${companyVO }
		${carsVO }
		${carOptionVO }
		${carInsuranceVO }
		${carFileUploadVO }
		<span>날짜<fmt:formatDate value="${carsVO.modelYears }" pattern="yyyy-MM"/></span>
		<ul class="list-group">
		</ul>
	

</div>


</body>
</html>