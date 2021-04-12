<%@ page import="java.util.*" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>

<body>

<form action="loginAction" method="post">
	<input type="text" name="id" value="${cookie.id.value}" placeholder="아이디를 입력해주세요."><br>
	<input type="password" name="pw" placeholder="비밀번호를 입력해주세요."><br>
	
	<input type="checkbox" id="remId"><label for="remId">로그인 상태 유지</label>
		<a href="">아이디/비밀번호 찾기</a><br>
		
	<input type="submit" value="로그인"><br>
	
	<a href="/register">회원가입</a>
</form>

</body>
</html>
<%@include file="include/footer.jsp" %>