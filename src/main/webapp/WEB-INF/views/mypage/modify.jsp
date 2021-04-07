<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Home</title>
<style>
a:link {
	color: red;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}

body {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	color: #444444;
	text-align: center;
	height: 2000px;
}

li {
	list-style-type: none;
}

.top {
	text-align: right;
}

.icon {
	padding: auto;
	height: 80px;
	width: 80px;
	float: right;
	vertical-align: baseline;
}

.mypagemenubar {
	text-align: left;
	font-size: large;
	color: white;
	background-color: coral;
}

.thumbnail {
	position: absolute;
	height: 200px;
	left: 230px;
	top: 40px;
	width: 200px;
	border: 1px solid gold;
}

.test {
	height: 300px;
	width: 300px;
	border: 1px solid gold;
	display: inline-block;
}

.mypage-top {
	position: relative;
	height: 400px;
}

.user_info {
	position: absolute;
	top: 300px;
}

.user_info_name, .pwd_msg {
	font-size: x-large;
	font-weight: bold;
	color: brown;
	text-align: left;
}

.user_gender, .user_region, .user_category, .user_birth {
	text-align: left;
	width: 400px;
	border-bottom: 1px solid black;
}

.pwd_change {
	position: absolute;
	top: 500px;
	margin-bottom: 20px;
}

.pwd_notice {
	background-color: gray;
	color: white;
	width: 500px;
	text-align: left;
}

.pwd_now, .pwd_new, .pwd_new_check {
	text-align: left;
}

.user_quit {
	position: absolute;
	top: 900px;
	text-align: left;
}

table {
	border-bottom: 1px solid gray;
	width: 300px;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>



</head>
<body>


	<!--메뉴바 시작 -->
<div class="mypagemenubar">
		<a href="home">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a
			href="posted">내가 쓴 글 </a> <a href="freply">내가 쓴 댓글 </a>
		<a href="rcvmsg">쪽지함 </a>
	</div>



	<!--  Header 끝 -->




	<div class="mypage-top">
		<div class="thumbnail">
			<span> 썸네일
				<div id="ex1" class="modal">
					<input type="file" id="isFile" name="isFile" accept="image/*" /> <a
						href="#" rel="modal:close">닫기</a>
				</div>
				<p>
					<a href="#ex1" rel="modal:open">사진 변경</a>
				</p>


				<div class="user_status"></div>
				<div class="user_info">
					<div class="user_info_name">회원정보</div>
					<div class="user_gender">
						<span>성별</span> <input type="radio" class="user_gender_male">
						남 <input type="radio" class="user_gender_female"> 여
					</div>
					<div class="user_birth">
						<span>생년월일</span> <select class="user_birth_year">
							<option>년도</option>
							<option>1993</option>
							<option>1994</option>
							<option>1995</option>
							<option>1996</option>
							<option>1997</option>
							<option>1998</option>
							<option>1999</option>
							<option>2000</option>
							<option>2001</option>
							<option>2002</option>
							<option>2003</option>
							<option>2004</option>
						</select> <select class="user_birth_month">
							<option>월</option>
							<option>12</option>
							<option>11</option>
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select> <select class="user_birth_day">
							<option>일</option>
							<option>12</option>
							<option>11</option>
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select>
					</div>
					<div class="user_region">
						<span>관심지역</span> <select class="user_region_select">
							<option>관심지역</option>
							<option>12</option>
							<option>11</option>
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select>


					</div>



					<div class="user_category">
						<span>관심분야</span> <select class="user_category_select">
							<option>관심분야</option>
							<option>12</option>
							<option>11</option>
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select><br>
						<div class="pwd_change_button">
							<button
								style="width: 200px; height: 40px; background-color: yellow; color: black; border: none;">적용</button>
						</div>
					</div>



					<br> <br>
					<div style="width: 1000px; border-bottom: 1px solid black"></div>
				</div>



				<div class="pwd_change">
					<div class="pwd_msg">비밀번호 변경</div>


					<div class="pwd_notice">
						개인정보 어쩌고 저쩌고<br> 비밀번호 어쩌고 저쩌고<br> 주민번호 어쩌고 저쩌고<br>
					</div>
					<div class="pwd_now">
						<div style="font-weight: bold">현재 비밀번호 입력</div>
						<input type="text" style="width: 400px"
							placeholder="현재비밀번호를 입력해주세요">
					</div>
					<div class="pwd_new">
						<div style="font-weight: bold">새로운 비밀번호 입력</div>
						<input type="text" style="width: 400px"
							placeholder="새로운비밀번호를 입력해주세요"><br> <span>비밀번호는
							대문자 소문자 어쩌고 저쩌고</span>
					</div>
					<div class="pwd_new_check">
						<div style="font-weight: bold">새로운 비밀번호 입력확인</div>
						<input type="text" style="width: 400px"
							placeholder="새로운 비밀번호를 다시 입력해주세요"><br>
						<div>새로운 비밀번호는 어쩌고 저쩌고</div>
					</div>

					<div class="pwd_change_button">
						<button
							style="width: 200px; height: 40px; background-color: yellow; color: black; border: none;">비밀번호
							변경완료</button>
					</div>
					<br>
					<div style="width: 1000px; border-bottom: 1px solid black"></div>
				</div>


				<div class="user_quit">
					<div>탈퇴 사유를 선택해주세요</div>
					<div>허니비의 더 나은 어쩌고</div>
					<br>
					<div>
						<input type="radio">탈퇴사유1
					</div>
					<div>
						<input type="radio">탈퇴사유2
					</div>
					<div>
						<input type="radio">탈퇴사유3
					</div>
					<div>
						<input type="radio">탈퇴사유4
					</div>
					<div style="display: inline-block; width: 400px;">
						<input type="radio">기타 <input type="text">
					</div>
					<br> <br>
					<div>탈퇴할 이메일 아이디를 확인해</div>
					<div>wjeorjwpr@naweirnhwoiqr.com</div>
					<br> <br>
					<div>본인인증을 위해 어쩌고 저쩌고</div>
					<input type="text" placeholder="내용을 입력해 주세요"><br> <br>




					<div class="pwd_change_button" style="text-align: left;">
						<button
							style="width: 200px; height: 40px; background-color: yellow; color: black; border: none;">회원
							탈퇴 완료</button>
					</div>
				</div>
</body>
</html>

