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



<title>렌트카 회사 리스트</title>
</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline">
			<!-- 검색 key -->
			<div class="input-group">
				<select class="form-control" name="key" id="key">
						<option value="companyName">회사명 검색</option>
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
			
			<tr>
				<th>글번호</th>
				<th>회사명</th>
				<th>연락처</th>
				<th>주소</th>
				<th>등록자 - 안보이게 (로그인아이디와 비교)</th>
			</tr>
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/rentcarcompany/rentCarCompanyUpdate.do?companyNo=${vo.companyNo}'">
						<td>
						${vo.companyNo}
						</td>
						<td>
						${vo.companyName}
						</td>
						<td>
						${vo.tel}
						</td>
						<td>
						${vo.address}
						</td>
						<td>
						${vo.id}
						</td>
						
					</tr>
				</c:forEach>

			</tbody>

		</table>
		
<!-- 		<div class="list-group"> -->
<!-- 		<div></div> -->
		
<%-- 		<c:forEach items="${list }" var="vo"> --%>
<%-- 			<a href="/rentcarcompany/rentCarCompanyUpdate.do?companyNo=${vo.companyNo}" class="list-group-item"> --%>
<%-- 				<p>${vo.companyNo}. ${vo.companyName}</p> --%>
<!-- 				<hr> -->
<%-- 				<strong>${vo.id}</strong> (${vo.tel}) --%>
<!-- 			</a> -->
<%-- 		</c:forEach> --%>
<!-- 		</div> -->
		
				
				
				

	<button type="button" onclick="location='/rentcarcompany/rentCarCompanyWrite.do'">회사등록</button>
<!-- 	<button type="button" onclick="location='/rentcarcompany/rentCarCompanyUpdate.do'">회사정보 수정</button> -->
	
<!-- 	<button type="button" onclick="location='/rentcarboard/rentCarWrite.do'">차량등록</button> -->
	<button type="button" onclick="location='/rentcarboard/rentCarBoardList.do'">렌트카 리스트</button>
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="rentCarCompanyList.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>