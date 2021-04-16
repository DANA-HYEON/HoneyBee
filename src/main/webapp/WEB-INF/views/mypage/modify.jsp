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
	display: flex;
	justify-content: space-around;
	align-item: center;
}

.user_info {
	position: absolute;
	/* 	margin-top: 10px; */
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

.status {
	
}
</style>



</head>
<body>


	<!--메뉴바 시작 -->
	<div class="mypagemenubar">
		<a href="home">마이페이지</a> <a href="pwdcheck">회원정보수정</a> <a
			href="posted">내가 쓴 글 </a> <a href="freply">내가 쓴 댓글 </a> <a
			href="rcvmsg">쪽지함 </a>
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
			</span>
		</div>
		<form action="nickmodify" method="post">
			<table id="status" border="1" width="50%" height="200"
				cellspacing="5">
				<%-- 	<thead>
				<tr>
					<th colspan="2">${user.nick}</th>
				</tr>
			</thead>
 --%>
				<tbody>
					<tr align="center" bgcolor="white">
						<td>${user.nick}</td>
						<div id="ex2" class="modal">
							<input type="text" id="isnick" maxlength="10" />
							<button id="duplicatecheck">중복체크</button>
							<a href="#" rel="modal:close">닫기</a>
						</div>
						<td><a href="#ex2" rel="modal:open">닉네임변경</a></td>
					</tr>
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
				</tbody>
			</table>
		</form>
	</div>
	<div class="user_status"></div>
	<form action="myinfomodify" method="post">
		<div class="user_info">
			<div class="user_info_name">회원정보</div>
			<div class="user_gender">
				<span>성별</span> <input type="radio" class="user_gender_male"
					name="gender" value=1> 남 <input type="radio"
					class="user_gender_female" name="gender" value=2> 여
			</div>
			<div class="user_birth">
				<span>생년월일</span> <select id="user_birth_year" name="year">
					<option>년도</option>
					<option>1986</option>
					<option>1987</option>
					<option>1988</option>
					<option>1989</option>
					<option>1990</option>
					<option>1991</option>
					<option>1992</option>
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
					<option>2005</option>
					<option>2006</option>
					<option>2007</option>
					<option>2008</option>
					<option>2009</option>
					<option>2010</option>

				</select> <select id="user_birth_month" name="month">
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
				</select> <select id="user_birth_day" name="day">
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
				<span>관심지역</span> <select id="user_region_select" name="region">
					<option>관심지역</option>
					<c:forEach items="${upper}" var="upper">
						<option value="${upper.CId}">${upper.CName}</option>
					</c:forEach>
				</select> <select id="user_detailregion_select">
					<option>관심지역</option>
				</select>
			</div>



			<div class="user_category">
				<span>관심분야</span> <select id="user_category_select" name="category">
					<option>관심분야</option>
					<c:forEach items="${cat}" var="cat">
						<option value="${cat.CId}">${cat.CName}</option>
					</c:forEach>
				</select> <br>
				<div class="pwd_change_button">
					<button
						style="width: 200px; height: 40px; background-color: yellow; color: black; border: none;">적용</button>
				</div>
			</div>
	</form>


	<br>
	<br>
	<div style="width: 1000px; border-bottom: 1px solid black"></div>



	<div class="pwd_change">
		<div class="pwd_msg">비밀번호 변경</div>


		<div class="pwd_notice">
			개인정보 어쩌고 저쩌고<br> 비밀번호 어쩌고 저쩌고<br> 주민번호 어쩌고 저쩌고<br>
		</div>
		<div class="pwd_now">
			<div style="font-weight: bold">현재 비밀번호 입력</div>
			<input type="text" style="width: 400px" placeholder="현재비밀번호를 입력해주세요">
		</div>
		<div class="pwd_new">
			<div style="font-weight: bold">새로운 비밀번호 입력</div>
			<input type="text" style="width: 400px" placeholder="새로운비밀번호를 입력해주세요"><br>
			<span>비밀번호는 대문자 소문자 어쩌고 저쩌고</span>
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



	<script type="text/javascript">
		$('#user_region_select').on(
				'change',
				function() {
					$.ajax({
						url : "/mypage/detailregion",
						type : "post", //get으로 바꾸세요
						dataType : "json",
						data : {
							"cid" : $('#user_region_select').val()
						},
						success : function(data) {
							$("#user_detailregion_select").children('option:not(:first)').remove();
							for (let i = 0; i < data.length; i++) {
								$("#user_detailregion_select").append(
										'<option>' + data[i].cname
												+ '</option>');
							}
						}
					})
				});

		$('#user_detailregion_select').on('change', function() {
			alert($('#user_region_select').val());
		});

		$('#user_category_select').on('change', function() {
			alert($('#user_category_select').val());
		});

		/* 
		 $('#user_birth_year').on('change', function() {
		 alert("hi!");
		 });

		 $('#user_birth_month').on('change', function() {
		 alert("hi!");
		 });

		 $('#user_birth_day').on('change', function() {
		 alert("hi!");
		 }); */

		$('#duplicatecheck').on('click', function fn_nickChk() {
			var str = $('#isnick').val();
			var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			if (str.search(/\s/gi) != -1) {
				alert("닉네임에 공백은 사용할 수 없습니다.");
				return false;
			}

			if (special_pattern.test(str) == true) {
				alert("닉네임에 특수문자는 사용하실 수 없습니다.");
				return false;
			}
			$.ajax({
				url : "/mypage/nickChk",
				type : "post",
				dataType : "json",
				data : {
					"nick" : $('#isnick').val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 닉네임입니다.");
					} else if (data == 0) {
						if (confirm("사용 가능한 닉네임입니다. 변경하시겠습니까?")) {
							$.ajax({
								url : "/mypage/nickmodify",
								type : "post",
								dataType : "json",
								data : {
									"nick" : $('#isnick').val()
								},
								success : function(afternick) {
									$('#isnick').val() = afternick;
									alert("닉네임이 변경됐습니다.");
								}
							})
						}
					}
				}
			});
		});

		/* 여기까지 닉네임 변경  */
	</script>
</body>
</html>

