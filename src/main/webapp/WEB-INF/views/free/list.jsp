<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 - 허니비</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free/list.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
  	<%@include file="../include/header.jsp" %>
    <div class="container" style="padding:50px 150px 0 150px">
        <table class="board_list">
            <caption>게시판 목록</caption>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>추천</th>
                </tr>
            </thead>
           	<c:forEach items="${list}" var="free">
                <tr>
                    <td class="freeBno"><c:out value="${free.fno}" /></td>
                    <td class="title">
                        <a href='/free/get?fno=<c:out value="${free.fno}"/>'><c:out value="${free.title}"></c:out></a>
                    </td>
                    <td><c:out value="${free.id}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${free.regdt}"/></td>
                    <td><c:out value="${free.hit}"/></td>
                    <td><c:out value="${free.thumb}"/></td>
                </tr>
            </c:forEach>

        </table>
        <div class="bottom-line">
            <form id="searchForm">
                <select name='type'>
                    <option value="tc">제목+내용</option>
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="w">작성자</option>
                </select>
                <input type="text" name="keyword" />
                <button>Search</button>
            </form>

            <button id="reg" type="button">글쓰기</button>
        </div>
        <div class="paging">
            <a href="#" class="btn">&lt;</a>
            <a href="#" class="num ">1</a>
            <a href="#" class="num on">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="num">4</a>
            <a href="#" class="num">5</a>
            <a href="#" class="num">6</a>
            <a href="#" class="num">7</a>
            <a href="#" class="btn">&gt;</a>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>

    
<script type="text/javascript">
	$(document).ready(function() {
		$("#reg").on("click", function() {
			self.location = "/free/reg";
		})
	})
</script>