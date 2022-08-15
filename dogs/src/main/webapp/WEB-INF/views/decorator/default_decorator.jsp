<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 이영환 -->
<!-- 작성일 : 2020-06-30 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹짱:<decorator:title /></title>
<!-- CDN 방식의 Bootstrap 라이브러리 등록 -> 디자인의 웹표준을 구현한 웹 라이브러리 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- CDN 방식의 Google Icon 라이브러리 등록 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- jQuery UI 라이브러리 CDN 방식으로 등록 : datepicker나  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: black;
	padding: 25px;
	color: #ddd;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 400px;
	margin-top: 80px;
	margin-bottom: 120px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<decorator:head/>
</head>
<body>
	<header>
<!-- 		<div><img href="#"/></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="/notice/list.do">공지사항</a></li>
						<li><a href="/image/list.do">이미지</a></li>
						<li><a href="/board/list.do">게시판</a></li>
						<li><a href="/qna/list.do">질문답변</a></li>
						<li><a href="/center/list.do">고객센터</a></li>
						<c:if test="${!empty login }">
							<li><a href="/message/list.do">메시지</a></li>
							<c:if test="${login.gradeNo == 9 }">
								<li><a href="/member/list.do">회원관리</a></li>
								<li><a href="/grade/list.do">등급관리</a></li>
							</c:if>
						</c:if>
						
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty login }">
					      	<li><a href="/member/write.do">회원가입</a></li>
					      	<li><a href="/member/login.do">로그인</a></li>
				      	</c:if>
						<c:if test="${!empty login }">
					      	<li><a href="/member/view.do">
					      		</a></li>
					      	<li><a href="/member/logout.do">로그아웃</a></li>
				      	</c:if>
				    </ul>
					
				</div>
			</div>
		</nav>
	</header>
	<!-- header, article, section, footer : HTML 5에서 의미 없는 구성 태그인 div 태그를
		 의미있는 태그로 작성되도록 만든 태그 - 시멘틱 태그 -> 낮은 버전에서는 div로 인식하게 한다. -->
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar navbar-inverse navbar-fixed-bottom">
		<p>이 홈페이지의 저작권은 이영환에게 있습니다.</p>
	</footer>
</body>
</html>