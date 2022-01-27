<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
<title> 회원가입 </title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	.container {
		width:500px;
		margin: auto;
		margin-top: 60px;
	}
	
	#ment {
		margin-top: 50px;
		font-size: 50px;
	}
	
	#ment {
		margin-top: 50px;
	}
</style>
</head>
<body>

	<main class="main">
		<%@include file="/WEB-INF/views/inc/header.jsp" %>
		
		<div class="container" align="center">

			<h1 align="center" id="ment">* 환영합니다! *</h1>
			
			<div class="welcome">
				<div align="center">국내 최고의 중고거래 사이트 고구마 장터에 회원으로 가입되신것을 축하드립니다!</div>
				<div align="center">고구마켓에서 따듯하고 달콤한 중고거래 하세요!</div>
			</div>
			<div id="cam" align="center">
				<img src="/goguma/asset/img/userregister.png" style="width: 130px">
			</div>
			
			<div id="back" align="center">
				<button class="margin-auto" type ="button" onclick="location.href='/goguma/main.do'">메인으로 돌아가기</button>
			</div>
		

		</div>
		
		
		

	</main>
</body>
</html>




