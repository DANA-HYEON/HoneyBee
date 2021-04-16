<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
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

body {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	color: #444444;
	text-align: center;
}

footer {
	width: 100%;
	height: 150px;
	margin-top: 850px;
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

body {
	height: 1000px;
}

.header {
	height: 130px;
	background-color: yellow;
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

.shortcut {
	margin-right: 60px;
	color: white;
}

.mypagemenubar {
	text-align: left;
	font-size: large;
	background-color: orange;
}

.title {
	color: orange;
	size: 20px;
}

.pwd {
	width: 312px;
	height: 20px;
}

.btn {
	color: white;
	background-color: orange;
	border: white;
	width: 320px;
	height: 32px;
}

.mypost {
	position: absolute;
	left: 50px;
	top: 150px;
}

.num {
	width: 100px;
}

.posttitle {
	background-color: rgb(184, 182, 182);
	color: white;
	height: 40px;
}

.check {
	width: 600px;
}

.category {
	width: 100px;
	border: 1px black;
}

.meettitle {
	width: 240px;
	border: 1px black;
}

.peoplenum, .meetstatus, .recruteenddate, .meetstartdate, .meetenddate {
	width: 120px;
}

.post {
	border: 1px solid black;
	margin-left: 100px;
	height: 250px;
}

.check {
	width: 100px;
}

.board {
	position: relative;
	left: -60px;
	top: -50px;
}

.posttop {
	position: relative;
}

.selectbox {
	position: absolute;
	top: -20px;
	left: 100px;
}

.select {
	position: absolute;
	left: 170px;
	top: 120px;
}

.selectpost, .selectreply {
	color: black;
	font-size: small;
	color: rgba(58, 7, 7, 0.829);
}

.delete {
	position: absolute;
	right: 30px;
	background-color: rgba(78, 44, 3, 0.836);
	color: white;
	border: none;
}

.button {
	position: absolute;
	top: -25px;
	right: 0px;
}

.btn-delete {
	background-color: orange;
	border: none;
}

.btn-end {
	background-color: yellow;
	border: none;
}

.btn-msg {
	background-color: orange;
	border: none;
}

.applylist {
	position: relative;
	/*  display: none; */
	width: 800px;
}

.applyexit {
	text-align: right;
	background-color: rgb(184, 182, 182);
	right: 10px;
}

.board_page {
	
}
</style>


<!--메뉴바 시작 -->
<div class="mypagemenubar">
	<a href="home">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a href="posted">내가
		쓴 글 </a> <a href="freply">내가 쓴 댓글 </a> <a href="rcvmsg">쪽지함 </a>
</div>


<!--  Header 끝 -->



</head>


<body>
	<div class="board">




		<div class="mypost">
			<div class="posttop">
				<div class="selectbox">
					<select>
						<option>10개씩 보기</option>
						<option>20개씩 보기</option>
						<option>30개씩 보기</option>
					</select> 
					<select id="cid">
						<option>카테고리</option>
					<c:forEach items="${code}" var="code">
						<option value="${code.CId}">${code.CName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="button">
					<button class="btn-delete">삭제</button>
					<button class="btn-end">마감</button>
					<button class="btn-msg">쪽지</button>
				</div>
			</div>

			<table class="post">


				<thead>
					<tr class="posttitle">
						<th class="check"><input type="checkbox"></th>
						<th class="category">카테고리</th>
						<th class="meettitle">제목</th>
						<th class="peoplenum">모집인원</th>
						<th class="meetstatus">모임상태</th>
						<th class="recruteenddate">모집마감일</th>
						<th class="meetstartdate">모임시작일</th>
						<th class="meetenddate">모임마감일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${meet}" var="meet" varStatus="status">
						<tr>
							<td><input type="checkbox"></td>
							<td><c:out value="${nick[status.index].CName}"></c:out></td>
							<td><a href="#" value="${meet.mno}"><c:out value="${meet.title}" /></a></td>
							<td><c:out value="${meet.currNo}" /></td>
							<td><c:out value="${meet.cid2}" /></td>
							<td>${meet.receDt}</td>
							<td>${meet.startDt}</td>
							<td><c:out value="${meet.endDt}" /></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="applylist">
				<table>
					<tr class="posttitle">
						<th class="category">문의/신고번호</th>
						<th class="meettitle">닉네임</th>
						<th class="meetstatus">이메일</th>
						<th class="recruteenddate">신청일자</th>
						<th class="meetstartdate">처리상태</th>
						<th class="meetenddate">상태변경</th>
					</tr>
					<tr>
						<th class="category">문의/신고번호</th>
						<th class="meettitle"><a href="#" class="num on">닉네임</a></th>
						<th class="meetstatus">이메일</th>
						<th class="recruteenddate">신청일자</th>
						<th class="meetstartdate">처리상태</th>
						<th class="meetenddate">상태변경</th>
					</tr>
				</table>


				<div class="applyexit">닫기</div>
			</div>
			<button class="delete">삭제</button>
			<div class="board_page">
				<a href="#" class="bt first"></a> <a href="#" class="bt prev"></a> <a
					href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
		</div>
	</div>
<script>
var target=document.getElementById("cid");
target.onchange= function getproperty(e) {
	location.href="/mypage/redirecttest?cid="+target.options[target.selectedIndex].value
}

$("td").on(
		"click",
		"a",
		function(e) {
			e.preventDefault();
			location.href = "http://localhost:8080/meet/get?mno="
					+ $(this).attr("value");
		});
</script>

</body>
<footer>
	<div id="footer_box">
		<div id="address">
			<ul>
				<li>회사소개 | 서비스약관 및 정책 | 개인정보 취급방침 | 광고문의 | 투자정보 | 문의하기 | 제안하기 |
					고객센터</li>
				<li>주식회사 허니비 | TEAM BEMAJOR</li>
				<li>서울특별시 종로구 종로69 YMCA 7층 | TEL.02)722-1481 | FAX.02)722-1481<br>
					<br></li>
				<li>copyright ⓒ 허니비.com All rights reserved.</li>
			</ul>
		</div>
	</div>
</footer>
</html>
