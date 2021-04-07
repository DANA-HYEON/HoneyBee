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
    <link rel="stylesheet" href="/resources/css/free/reg.css">
    <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	

	<%@include file="../include/header.jsp" %>
    <div class="container">
        <form role="form" action="/free/modify" method="post">
            <div class="reg-head">
            	<input type="text" name="title" value='<c:out value="${free.title}"/>'>
            </div>
            
            <textarea name='content'><c:out value='${free.content}' /></textarea>
            <script>
                    CKEDITOR.replace( 'content' );
            </script>
            
           	<input type="hidden" name="fno" value="<c:out value='${free.fno}' />">
           	<input type="hidden" name="id" value="<c:out value='${free.id}' />">
           	
           	<input type="hidden" name="hit" value="<c:out value='${free.hit}' />">
           	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}' />">
           	<input type="hidden" name="amount" value="<c:out value='${cri.amount}' />">
           	<input type="hidden" name="type" value="<c:out value='${cri.type}' />">
           	<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}' />">

            <button type="submit" data-oper='modify'>수정완료</button>
            <button type="submit" data-oper='list'>목록으로</button>
        </form>

    </div>
    <%@include file="../include/footer.jsp" %>
    
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			
			var operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'list') {
				formObj.attr("action", "/free/list").attr("method", "get");
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}	
			formObj.submit();
		});
	});
</script>
