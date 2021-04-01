<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	

    <div class="container">
		<%@include file="../include/header.jsp" %>
        <form role="form" action="/free/reg" method="post">
            <div class="reg-head">
            	<input type="text" name="title" />
            </div>


            <textarea name='content'></textarea>
            <script>
                    CKEDITOR.replace( 'content' );
            </script>

            <button type="reset" class="cancel">작성취소</button>
            <button type="submit">작성완료</button>
        </form>

	    <%@include file="../include/footer.jsp" %>
    </div>
    
    
</body>
</html>