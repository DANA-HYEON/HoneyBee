<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
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

.innerposttitle {
	width: 650px;
	border: 1px black;
}

.date {
	width: 120px;
	border: 1px black;
}

.poststatus {
	width: 240px;
	border: 1px black;
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
</style>


<!--메뉴바 시작 -->
<div class="mypagemenubar">
	<a href="home">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a href="posted">내가
		쓴 글 </a> <a href="freply">내가 쓴 댓글 </a> <a href="rcvmsg">쪽지함 </a>
</div>


<!--  Header 끝 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>


</head>


<body>
	<div class="board">
		<div class="select">
			<a class="selectpost"> 수신함 | </a> <a class="selectreply"
				href="sendmsg"> 발신함 </a>

		</div>
		<div id="ex2" class="modal">
			수신인 <input type="text" class="receiverread" value="" /><br> <input
				type="text" class="msgcontentread" height:40px;/><br> <a
				href="#" rel="modal:close">닫기</a>
		</div>


		<div class="mypost">
			<form action="rcvmsgdelete" method="post">
				<table class="post">
					<thead>
						<tr class="posttitle">
							<th class="innerposttitle">보낸사람</th>
							<th class="poststatus">내용</th>
							<th class="date">작성일</th>
							<th class="check"><input type="checkbox" id="selectall"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach items="${rcvmsg}" var="rcvmsg">
								<td class="innerposttitle"><c:out value="${rcvmsg.id}" /></td>
								<td class="poststatus"><a href="#ex2" rel="modal:open"
									id="content"><c:out value="${rcvmsg.content}" /></a></td>
								<td class="date"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${rcvmsg.regDt}" /></td>
								<td><input type="checkbox" name="rcvmsgcheck"
									value="${rcvmsg.msgno}"></td>
						</tr>
						</c:forEach>

					</tbody>
				</table>
				<input type="submit" class="delete">
			</form>


		</div>
	</div>
	<script type="text/javascript">
		let checkbox = document.getElementsByName('rcvmsgcheck');
		document.getElementById('selectall').onclick = function() {
			for (let i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = !checkbox[i].checked;
			}
		}

		$("td").on("click", "a", function() {
			var msgcontent = $(this).text();
			var receiverread = $(this).parent().prev().text();
			$(".msgcontentread").val(msgcontent);
			$(".receiverread").val(receiverread);
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
