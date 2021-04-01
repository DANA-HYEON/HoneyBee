<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/meet_read.css">
</head>
<body>


  <nav class="navbar navbar-light bg-light" style="background: transparent;">
        <div class="container-fluid" style="background-color:rgb(246, 218, 66);">
          <span class="navbar-brand mb-0 h1" style="font-weight: bold;">모임게시판</span>
        </div>
        <div class="container-fluid" style="background: transparent;">
            <span class="navbar-brand mb-0 h1" style="font-weight: bold; background-color: white;">${meet.cid}</span>
          </div>
    </nav>


    <div class="total">
    <div class="wrap">
      <div class="meet left">
        <img src="/resources/img/logo.png">
      </div>

      <div class="meet right">
        <div class="meet top">
          <div class="title"><p><c:out value="${meet.title}"/></p></div>
          <hr class="line" style="border:1px color= silver;" width="90%">


        <div class="id">
          <img class="id img" src="/resources/img/logo.png"><p class="id name">이다현님</p>
        </div>
        </div>


        <div class="meet bottom">
          <div class="content">
            <ul>
              <li>모임일 <c:out value="${meet.startDt}"/> ~ <c:out value="${meet.endDt}"/></li>
              <li>모임장소 <c:out value="${meet.place}"/></li>
              <li>모임모집일 <c:out value="${meet.recsDt}"/> ~ <c:out value="${meet.receDt}"/></li>
              <li>모집인원   <c:out value="${meet.recNo}"/></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="mid">
      <div class="information">모임 상세 안내</div>
      <hr class="first_line" style="border:1px color= silver;" width="90%">
      <div class="data">
        개설자 정보
      </div>
      <div class="text">
        <c:out value="${meet.content}"/>
      </div>

      <hr class="second_line" style="border:1px color= silver;" width="90%">
      <button data-oper='modify' 
      		  class="btn btn-default"
      		  onclick="location.href='/meet/modify?mno=<c:out value="${meet.mno}"/>'">수정하기</button>
	  <button data-oper='list' class="btn btn-info" onclick="location.href='/meet/list'">목록으로 돌아가기</button>
    </div>
  </div>
  
	
</body>
</html>

<%@include file="../include/footer.jsp" %>