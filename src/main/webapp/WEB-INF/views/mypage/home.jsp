<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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

.uploadResult {
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

.mypage-thumb {
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

.mypage-thumb-name {
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

.mypage-subscribe {
	height: 500px;
	width: 300px;
	display: inline-block;
}

.mypage-subscribe-name {
	top: 0px;
	border-bottom: 1px solid black;
	text-align: left;
	width: 300px;
	margin-left: 680px;
	margin-bottom: 8px;
	font-weight: bold;
	color: rgba(133, 39, 39, 0.973);
}
</style>
</head>
<body>

	<!-- 메뉴바 -->
	<div class="mypagemenubar">
		<a href="home">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a
			href="posted">내가 쓴 글 </a> <a href="freply">내가 쓴 댓글 </a> <a
			href="rcvmsg">쪽지함 </a>
	</div>


	<!--  Header 끝 -->




	<div class="mypage-top" style="margin-bottom: 10px">
		<div class="uploadResult">
			<img id="profile" src="" width="200px" height="200px"> <span>
				썸네일
				<div id="uploadDiv" class="modal">
					<input type="file" name="uploadFile">
					<button id='uploadBtn'>업로드 하기</button>
				</div>

				<p>
					<a href="#uploadDiv" rel="modal:open">사진 변경</a>
				</p>


			</span>
		</div>

		<div class="user_information">
			<div class="name"></div>

			<table border="1" width="50%" height="200" cellspacing="5">
				<thead>
					<tr>
						<th colspan="2">${user.nick}</th>
					</tr>
				</thead>

				<tbody>
					<tr align="center" bgcolor="white">
						<td>이메일</td>
						<td><c:out value="${user.email}" /></td>
					</tr>
					<tr align="center" bgcolor="white">
						<td>휴대전화</td>
						<td><c:out value="${user.telno}" /></td>
					</tr>
					<tr align="center" bgcolor="white">
						<td>가입일</td>
						<td><c:out value="${user.regdt}" /></td>
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
				<c:forEach items="${enrollStatus}" var="enrollStatus"
					varStatus="status">
					<tr>
						<td><c:out value="${enrollStatus.CName}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${meet[status.index].regDt}" /></td>
					<tr>
						<td colspan="3"><a href=# value="${meet[status.index].mno}"
							class="testofmeet"><c:out value="${meet[status.index].title}" /></a></td>
					</tr>

					</tr>
				</c:forEach>
				<td></td>
				<tr>

				</tr>
				<!-- 두번째 줄 끝 -->
			</table>
		</div>

		<div class="meeting-post-name">
			모임개설목록
			<button>
				<a href="/mypage/regCenter">더보기</a>
			</button>
		</div>
		<span class="meeting-post">
			<table>
				<c:forEach items="${meet}" var="tes">
					<td></td>
					<td></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${tes.regDt}" /></td>
					<tr>
						<td colspan="3"><a href="#" value="${tes.mno}"><c:out
									value="${tes.title}" /></a></td>
					</tr>
				</c:forEach>

			</table>
		</span>
		<div class="mypage-thumb-name">모임 찜 목록</div>
		<div class="mypage-thumb">
			<table>
				<c:forEach items="${thumbList}" var="thumbList" varStatus="status">
					<th></th>
					<th></th>
					<th></th>
					<th><fmt:formatDate pattern="yyyy-MM-dd"
							value="${thumbRegDate[status.index].regDt}" /></th>
					<tr>
						<!-- 두번째 줄 시작 -->
						<td colspan="3"><a href="#" value="${thumbList.mno}"><c:out
									value="${thumbList.title}" /></a> <br></td>
					</tr>
				</c:forEach>
				<!-- 두번째 줄 끝 -->
			</table>

		</div>

		<div class="mypage-subscribe-name">구독목록</div>
		<div class="mypage-subscribe">
			<table>
				<c:forEach items="${subscribeList}" var="subscribe"
					varStatus="status">
					<th></th>
					<th></th>
					<th></th>
					<!-- 두번째 줄 시작 -->
					<tr>
						<th colspan="3"><a href="#" value="${subscribe.id}"><c:out
									value="${subscribe.nick}" /></a><br></th>
					</tr>
				</c:forEach>
				<!-- 두번째 줄 끝 -->
			</table>

		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			var regex = new RegExp("(.*?)\.(jpg|png|JPG|PNG)$");
			var maxSize = 5242880;

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				if (!regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없습니다.")
					return false;
				}
				return true;
			}

			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				$.ajax({
					url : '/meet/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);

						$(".uploadDiv").html(cloneObj.html());
					}
				});

			});
		});

		$("td").on(
				"click",
				"a",
				function(e) {
					e.preventDefault();
					location.href = "http://localhost:8080/meet/get?mno="
							+ $(this).attr("value");
				});

		$("th").on(
				"click",
				"a",
				function(e) {
					e.preventDefault();
					location.href = "http://localhost:8080/mypage/posted?id="
							+ $(this).attr("value");
				});

		/* 	let today = new Date();   
			let year = today.getFullYear(); // 년도
			let month = ("0" + (1 + date.getMonth())).slice(-2);
		    let day = ("0" + date.getDate()).slice(-2);
			let filepath = year + '/' + month + '/' + day + '/' */

		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);

		document.getElementById('profile').src = "display?fileName=/" + year + "/" + month + "/" + day + "/" + "${getimg.img}"
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