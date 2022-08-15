<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script type="text/javascript">
$(function(){

	//검색 기본값 설정
	var searchForm = $("#searchForm");
	if("${param.key == ''}") $(searchForm).find("select").val("T");
	else{
	$(searchForm).find("select").val("${param.key}");
		}
	$(searchForm).find("input[name='word']").val("${param.word}");


	
	//period 설정
	$("#periodBtn > button").on("click",function(){
		var period = $(this).data("period");

		$("#period").val(period);
		$("#page").val(1);
		$("#actionForm").submit();
		})	


	$("#searchIdBtn").on("click",function(){
		$("#searchForm").submit();
		})


	
})

</script>

</head>
<body>

<form action="" id="actionForm">
	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }" id="perPageNum">
	<input type="hidden" name="page" value="${pageObject.page }" id="page">
	
	<!-- 페이징 넘길떄 검색데이터도 넘겨준다  -->
<%-- 	<input type="hidden" name="key" value="${pageObject.key}"> --%>
<%-- 	<input type="hidden" name="word" value="${pageObject.word}"> --%>
	<input type="hidden" name="period" value="${pageObject.period}" id="period">
	
</form>

	<div class="container">
		<h2>공지사항</h2>
		<!-- period 버튼 -->
		<div id="periodBtn">
			<button data-period="old" class="btn btn-default">지난공지사항</button>
			<button data-period="pre" class="btn btn-default">현재공지사항</button>
		</div>
		
		<!-- 검색 -->		
		<form action="" id="searchForm">
			<div>
				<select name="key"  >
					<option value="">--</option>
					<option value="T">제목</option>
					<option value="C">내용</option>
					<option value="TC">제목 or 내용</option>
				</select>
			
				<input name="word" value="${pageObject.word }">
				<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
				<input type="hidden" name="page" value="${pageObject.page }">
				<input type="hidden" name="period" value="${pageObject.period}">
				<button type="button" class="btn btn-default" id="searchIdBtn">Search</button>
			
			</div>
		</form>
		
		<table width="100%"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>#번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="vo">
					<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
						바꿔 넘겨준다 -->
					<tr class="move">
						<td class="bno">${vo.noticeNo }</td>
						<td>${vo.title }</td>
						<td>${vo.id }</td>
						<td><fmt:formatDate value="${vo.startDate }"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.endDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.updateDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
		
		<div>
			<pageNav:pageNav listURI="list" pageObject="${pageObject }"/>
		</div>
	</div>

</body>
</html>