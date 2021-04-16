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
                        <a class='move' href='<c:out value="${free.fno}"/>'><c:out value="${free.title}" />   <small>[<c:out value="${free.replyCnt}" />]</small></a>
                    </td>
                    <td><c:out value="${free.id}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${free.regdt}"/></td>
                    <td><c:out value="${free.hit}"/></td>
                    <td><c:out value="${free.thumb}"/></td>
                </tr>
            </c:forEach>
        </table>

        <div class="bottom-line">
            <form id="searchForm" action="/free/list" method="get">
                <select name='type'>
                    <option value="TC" <c:out value='${pageMaker.cri.type eq "TC" ? selected : ""}'/>>제목+내용</option>
                    <option value="T"  <c:out value='${pageMaker.cri.type eq "T" ? selected : ""}'/>>제목</option>
                    <option value="C"  <c:out value='${pageMaker.cri.type eq "C" ? selected : ""}'/>>내용</option>
                    <option value="W"  <c:out value='${pageMaker.cri.type eq "W" ? selected : ""}'/>>작성자</option>
                </select>
                <input type="text" name="keyword" />
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
                <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
                <button>Search</button>
            </form>

            <button id="reg" type="button">글쓰기</button>
        </div>
        <div class="paging">
        	<ul class="pagination">
        		<c:if test="${pageMaker.prev}"><li class="pageBtn prev"><a href="${pageMaker.startPage -1}" class="btn">&lt;</a></li></c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	            	<li class="pageBtn pages"><a href="${num}" class="num ${pageMaker.cri.pageNum == num ? 'on' : '' }">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="pageBtn next"><a href="${pageMaker.endPage +1}" class="btn">&gt;</a></li>
				</c:if>
            </ul>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
    
    <form id='actionForm' action="/free/list" method="get">
    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    	<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>">
    	<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
    </form>

    
<script type="text/javascript">
	$(document).ready(function() {
		$("#reg").on("click", function() {
			self.location = "/free/reg";
		});
		
		// paging
		var actionForm = $("#actionForm");
		$(".pageBtn a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='fno' value='"  + $(this).attr("href") + "'>");
			actionForm.attr("action", "/free/get");
			actionForm.submit();
		});
		
		// search
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("검색어를 입력해주세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1"); 
			
			e.preventDefault();
			searchForm.submit();
		});

	});
</script>