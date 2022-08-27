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
<title>차량 기본정보</title>
</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline">
			<!-- 검색 key -->
			<div class="input-group">
				<select class="form-control" name="key" id="key">
						<option value="N">차량 이름</option>
						<option value="T">차종</option>
						<option value="F">연료</option>
				</select>
			</div>
			<!-- 검색 word -->
			<div class="input-group">
				<input type="text" class="form-control" placeholder="차량 이름 검색" name="word" value="${pageObject.word }">
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
			
			
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/carbasicinfo/carBasicInfoView.do?carInfoNo=${vo.carInfoNo}'">
						<td><img alt="차량 이미지" src="/upload/${vo.realSavePath}/${vo.fileName}" width="100px"> </td>
						
						<td data-carInfoNo="${vo.carInfoNo }">
						
						<p>
						${vo.carName }
						</p>
						<p>
						${vo.carFuel }
						</p>
						<p>
						${vo.carTypes }
						</p>

						</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>
				
<button onclick="location='carBasicInfoWrite.do'">차량 기본정보 등록</button>
<button type="button" onclick="location='/rentcarboard/rentCarBoardList.do'">렌트카 리스트</button>
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="list.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>