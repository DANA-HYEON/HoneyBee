<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 - 허니비</title>
    <link rel="stylesheet" href="/resources/css/free/reg.css">
	
	<!-- Bootstrap 4 CSS --> 	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

 	<!-- jQuery -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 	
 	<!-- Bootstrap 4 JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <!-- CKEditor 4 -->
    <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    
    <!-- Naver Smart Editor -->
	<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
    
</head>
<body>
	

    <div class="container">
		<%@include file="../include/header.jsp" %>
        <form id="regDate" role="form" action="/free/reg" method="post">
            <div class="reg-head">
            	<input type="text" name="title" />
            </div>

            <textarea name='content'></textarea>
            <button type="reset" class="cancel">작성취소</button>
            <button type="submit" class="write">작성완료</button>
        </form>

	    <%@include file="../include/footer.jsp" %>
    </div>
    
<script>
	CKEDITOR.replace( 'content' );
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		// 유효성 검사
		$(".write").on("click", function(e) {
			let titleVal = $(".reg-head").find("input[name='title']").val().trim();
			
			if (titleVal === "" || titleVal === null) {
				e.preventDefault();
				alert("제목을 입력해주세요.");
				return;
			}
		});
			
		// 게시물 작성 취소
		let regData = $("#regDate");
		$(".cancel").on("click", function(e) {
			let con = confirm("정말 게시물 작성을 취소하고\n목록으로 돌아가시겠습니까?");
			
			if (con === true) {
				regData.find("titleVal").remove();
				regData.attr("action", "/free/list");
				regData.attr("method", "get");
				regData.submit();
			}
		});
		
	});
</script>
    
</body>
</html>