<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--  <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script> -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

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
	margin-top: 650px;
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

.innerposttitle {
	width: 450px;
	border: 1px black;
}

.date {
	width: 120px;
	border: 1px black;
}

.viewnum {
	width: 80px;
	border: 1px black;
}

.post {
	border: 1px solid black;
	margin-left: 120px;
	top: 100px;
}

.status {
	width: 80px;
}

.board {
	position: relative;
}

.select {
	position: absolute;
	left: 180px;
	top: 290px;
}

.selectpost, .selectreply {
	color: black;
	font-size: small;
	color: rgba(58, 7, 7, 0.829);
	font-display: unset;
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
	<div class="select">
		<a class="selectpost" href="posted"> 내가 쓴 글 | </a> <a
				class="selectreply" href="mreply"> 내가 쓴 모임게시물 댓글 |</a> <a
				class="selectreply" href="freply"> 내가 쓴 자유게시물 댓글 </a>

	</div>

	<div class="board">
		<div class="mypost">
			<form action="mypostdelete" method="post">
				<table class="post">


					<thead>
						<tr class="posttitle">
							<th class="num">게시번호</th>
							<th class="innerposttitle">제목</th>
							<th class="date">작성일</th>
							<th class="viewnum">조회수</th>
							<th class="status"><input type="checkbox" id="selectall"></th>
						</tr>
					</thead>
					<tbody>
					


						<c:forEach items="${list}" var="free">
							<tr>
								<td name="fno" value="${free.fno}"><c:out value="${free.fno}" /></td>
								<td><a class='move' href='readcontent' name="mypost" />
									<c:out value="${free.title}" /></a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${free.regdt}" /></td>
								<td><c:out value="${free.hit}" /></td>
								<td><input type="checkbox" name="mypostcheck"
									value="${free.fno}"></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<input type="submit">
			</form>



		</div>
	</div>
	<script> let testBtn = document.getElementById('selectall');
	testBtn.onclick = function () { alert('Hello world1'); }; 
		  </script>




	<script type="text/javascript">
		let checkbox = document.getElementsByName('mypostcheck');
		document.getElementById('selectall').onclick = function() {
			for (let i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = !checkbox[i].checked;
			}
		}
		let fno = document.getElementsByName("fno");
		let title = document.getElementsByName("mypost");
		for(let i=0; i<fno.length; i++){
		title[i].onclick = function stopDefault(e) {
			e.preventDefault();
			location.href="/free/get?fno="+fno[i].textContent
		}}
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