<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 보기</title>

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
		location = "update.do?bookingNo=${vo.bookingNo}&companyCarsNo=${vo.companyCarsNo}"
		+ "&carNo=${vo.carNo}&companyNo=${vo.companyNo}&carInfoNo=${vo.carInfoNo}"
		+ "&page=" + "${param.page}"
		+ "&perPageNum=" + "${param.perPageNum}"
		+ "&key=" + "${param.key}"
		+ "&word=" + "${param.word}";
	});
	
	// 삭제 버튼 이벤트
	$("#deleteBtn").on("click", function(){
		// alert("새로고침 클릭");
		if(confirm("삭제?")){
		location = "delete.do?bookingNo=${vo.bookingNo}&companyCarsNo=${vo.companyCarsNo}";
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
		<h2>예약 보기</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	

	
	<!-- 데이터 표시 -->
	${vo }
	<div class="row">
		<div class="col-md-12">
			<!-- 데이터 들어가는공간 -->
			<div class="list-group">
					<div class="list-group-item">
						<label>번호</label>
<%-- 						<span id="no" data-no="${vo.no }">${vo.no }</span> --%>
					</div>
					<div class="list-group-item">
						<label>제목</label>
<%-- 						<span>${vo.title }</span> --%>
					</div>
					<div class="list-group-item">
						<label>내용</label>
<%-- 						<span><pre>${vo.content }</pre></span> --%>
					</div>
					<div class="list-group-item">
						<label>작성자</label>
<%-- 						<span>${vo.writer }</span> --%>
					</div>
					<div class="list-group-item">
						<label>작성일</label>
<%-- 						<span><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></span> --%>
					</div>
					<div class="list-group-item">
						<label>조회수</label>
<%-- 						<span>${vo.hit }</span> --%>
					</div>
			</div>			
		</div>
	</div>
	
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