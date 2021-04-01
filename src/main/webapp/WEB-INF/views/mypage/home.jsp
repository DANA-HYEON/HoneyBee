<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
}

footer {
	width: 100%;
	height: 150px;
	top: 300px;
	margin-top: 400px;
	background-color: lightgrey;
	border: solid 1px lightgrey;
}

#footer_box {
	width: 1140px;
	height: 150px;
	margin: 0 auto;
	border: solid 1px lightgrey;
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
	height: 200px;
	left: 230px;
	top: 40px;
	width: 200px;
	border: 1px solid gold;
}

.user_information {
	top: 40px;
	height: 200px;
	width: 300px;
	display: inline-block;
}

.mypage-top {
	position: absolute;
	top: 250px;
	left: 150px;
	width: 800px;
	display: flex;
	justify-content: space-around;
}

.mypage-bottom {
	display: inline-block;
	top: 400px;
	height: 600px;
	width: 1500px;
	position: relative;
}

.mypage-bottom-left {
	height: 400px;
	width: 200px;
	display: inline-block;
}

.mypage-bottom-right {
	height: 500px;
	width: 300px;
	display: inline-block;
}

.meeting-post {
	position: absolute;
	top: 300px;
	left: 0px;
	height: 220px;
	width: 300px;
	display: block;
	margin-left: 150px;
}

.user-enroll-list {
	position: absolute;
	top: 30px;
	left: 0px;
	height: 220px;
	width: 300px;
	display: block;
	margin-left: 150px;
}

.user-enroll-list-name {
	border-bottom: 1px solid black;
	text-align: left;
	width: 300px;
	margin-left: 150px;
	font-weight: bold;
	color: rgba(133, 39, 39, 0.973);
}

.meeting-post-name {
	position: absolute;
	top: 270px;
	left: 150px;
	height: auto;
	width: 300px;
	text-align: left;
	display: inline-block;
	border-bottom: 1px solid black;
	font-weight: bold;
	color: rgba(133, 39, 39, 0.973);
}

.mypage-bottom-right-name {
	position: absolute;
	top: 0px;
	border-bottom: 1px solid black;
	text-align: left;
	width: 300px;
	margin-left: 600px;
	margin-bottom: 8px;
	font-weight: bold;
	color: rgba(133, 39, 39, 0.973);
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

	<!-- 메뉴바 -->
	<div class="mypagemenubar">
		<a href="mypagehome">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a
			href="mypost">내가 쓴 글 </a> <a href="myreply">내가 쓴 댓글 </a> <a
			href="receivemsg">쪽지함 </a>
	</div>


	<!--  Header 끝 -->




	<div class="mypage-top" style="margin-bottom: 10px">
		<div class="thumbnail">
			<span> 썸네일
				<div id="ex1" class="modal">
					<input type="file" id="isFile" name="isFile" accept="image/*" /> <a
						href="#" rel="modal:close">닫기</a>
				</div>

				<p>
					<a href="#ex1" rel="modal:open">사진 변경</a>
				</p>


			</span>
		</div>

		<div class="user_information">
			<div class="name"></div>
				
				 <table
            border="1"
            width="50%"
            height="200"
            cellspacing="5">
            <thead>
                <tr>
                    <th colspan="2"><c:out value="${list.id}"/></th>
                </tr>
            </thead>

            <tbody>
                <tr align="center" bgcolor="white">
                    <td>이메일</td>
                    <td>값</td>
                </tr>
                <tr align="center" bgcolor="white">
                  <td>휴대전화</td>
                  <td>값</td>
                </tr>
                  <tr align="center" bgcolor="white">
                  <td>가입일</td>
                  <td>값</td>
                </tr>
                  <tr align="center" bgcolor="white">
                  <td>기타</td>
                  <td><input type="radio"></td>
                </tr>
            </tbody>
        </table>
		</div>


	</div>


	<div class="mypage-bottom">

		<div class="user-enroll-list-name">모임신청목록</div>
		<div class="user-enroll-list">
			<table>
				<th>승인완료</th>
				<th></th>
				<th>날짜</th>
				<tr>
					<!-- 두번째 줄 시작 -->
					
					<td colspan="3">모임이름</td>

				</tr>
				<!-- 두번째 줄 끝 -->
			</table>
		</div>

		<div class="meeting-post-name">
			모임개설목록
			<button>
				<a href="registercenter">더보기</a>
			</button>
		</div>
		<span class="meeting-post">
			<table>
				<th></th>
				<th></th>
				<th></th>
				<th>날짜</th>
				<tr>
					<!-- 두번째 줄 시작 -->
					<td colspan="3">모임이름</td>
				</tr>
				<!-- 두번째 줄 끝 -->
			</table>
		</span>
		<div class="mypage-bottom-right-name">모임 찜목록</div>
		<div class="mypage-bottom-right">
			<table>
				<th></th>
				<th></th>
				<th></th>
				<th>날짜</th>
				<tr>
					<!-- 두번째 줄 시작 -->
					<td colspan="3">모임이름</td>
				</tr>
				<!-- 두번째 줄 끝 -->
			</table>

		</div>
	</div>





	<footer>
		<div id="footer_box">
			<div id="address">
				<ul>
					<li>회사소개 | 서비스약관 및 정책 | 개인정보 취급방침 | 광고문의 | 투자정보 | 문의하기 | 제안하기
						| 고객센터</li>
					<li>주식회사 허니비 | TEAM BEMAJOR</li>
					<li>서울특별시 종로구 종로69 YMCA 7층 | TEL.02)722-1481 | FAX.02)722-1481<br>
						<br></li>
					<li>copyright ⓒ 허니비.com All rights reserved.</li>
				</ul>
			</div>
		</div>
	</footer>





</body>
</html>