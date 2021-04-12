<%@ page import="java.util.*" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>

<body>
<h1>Login Page</h1>
<h2><c:out value="${error}" /></h2>
<h2><c:out value="${logout}" /></h2>

<form role="form" action="/login" method="post">
	<div>
		<h6>아이디</h6>
		<input type="text" name="username" value="" placeholder="아이디를 입력해주세요." autofocus>
	</div>
	<div>
		<h6>비밀번호</h6>
		<input type="password" name="password" value="" placeholder="비밀번호를 입력해주세요.">
	</div>
	<div>
		<input type="checkbox" name='remember-me' id="rem"><label for="rem">로그인 유지</label>
	</div>
	
	<a href="">아이디/비밀번호 찾기</a><br>
	
	<div>
		<input type="submit" class="loginBtn" value="로그인">
	</div>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<a href="/register">회원가입</a>

</body>
</html>
<%@include file="include/footer.jsp" %>

<script>
	$(".loginBtn").on("click", function(e) {
		e.preventDefault();
		$("form").submit();
	});
</script>