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
    <link rel="stylesheet" href="/resources/css/meet/read.css">
    
    <!-- 희승 댓글 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/free/get.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


  <nav class="navbar navbar-light bg-light" style="background: transparent;">
        <div class="container-fluid" style="background-color:rgb(246, 218, 66);">
          <span class="navbar-brand mb-0 h1" style="font-weight: bold;">모임게시판</span>
        </div>
        <div class="container-fluid" style="background: transparent;">
            <span class="navbar-brand mb-0 h1" style="font-weight: bold; background-color: white;">모임카테고리 : ${meet.cid}</span>
          </div>
    </nav>


    <div class="total">
    <div class="mid">
      <div class="meet left">
        <img src="/resources/img/logo.png">
      </div>

      <div class="meet right">
        <div class="meet top">
          <div class="title"><p><c:out value="${meet.title}"/></p></div>
          <hr class="line" style="border:1px color= silver;" width="90%">
        </div>


        <div class="meet bottom">
          <div class="content">
            <ul>
              <li>모집상태   <c:out value="${meet.cid2}"/></li>
              <li>모임일 <c:out value="${meet.startDt}"/> ~ <c:out value="${meet.endDt}"/></li>
              <li>모임장소 <c:out value="${meet.place}"/></li>
              <li>모임모집일 <c:out value="${meet.recsDt}"/> ~ <c:out value="${meet.receDt}"/></li>
              <li>모집인원   <c:out value="${meet.recNo}"/></li>
              <li>현재인원   <c:out value="${meet.currNo}"/></li>
              <li>유무료구분   <c:out value="${meet.charge}"/></li>
              <li>온오프라인유무   <c:out value="${meet.onoff}"/></li>
              <li>링크   <c:out value="${meet.link}"/></li>
              <li>모임개설일자   <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${meet.regDt}" /></li>
              <li>찜수   <c:out value="${meet.thumb}"/></li>
              <li>조회수   <c:out value="${meet.hit}"/></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="mid">
      <div class="information">모임 상세 안내 </div>
      <hr class="first_line" style="border:1px color= silver;" width="90%">
      <div>모임 요약 내용 : <c:out value="${meet.smry}"/></div>
      <div class="data">
	        개설자 정보  
	        <div>
	        개설자 아이디 : 
        <c:out value="${meet.id}"/>
	        </div>
      </div>
      <div class="text">
        <c:out value="${meet.content}"/>
      </div>

      <hr class="second_line" style="border:1px color= silver;" width="90%">
      
      <button data-oper='modify' class="btn btn-default" >수정하기</button>
      <button type="reset" data-oper='remove'>모임 삭제</button>
	  <button data-oper='list' class="btn btn-info">목록으로 돌아가기</button>
	  
	  <form id='operForm' action="/meet/modify" method="get">
	  	<input type='hidden' id='mno' name='mno' value='<c:out value="${meet.mno}"/>'>
	  	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	  </form>
        
        
        <!-- 댓글 읽기 창 -->
        <div class="bootstrap snippets bootdey">
            <div class="row">
                <div class="col-md-12">
                    <div class="blog-comment">
                        <h3 class="text-success">댓글</h3>
                        <ul class="comments">
                            <li class="clearfix">
                                <img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">
                                <div class="post-comments">
                                    <p class="meta">
                                        <a href="#">김치국</a><small class="float-right">2021.03.25. 22:23:24</small>
                                        <a class="btn thumb float-right"><i class="fa fa-thumbs-up"></i> 13</a>  <!-- 클릭하면 class=text-green 추가  -->
                                    </p>
                                    <span>김치국이냐 김칫국이냐 그것이 문제로다.</span>
                                    
                                    <a href="#"><small class="float-right">답글</small></a>
                                </div>
                                <ul class="comments">
                                    <li class="clearfix">
                                        <img src="https://bootdey.com/img/Content/user_3.jpg" class="avatar" alt="">
                                        <div class="post-comments">
                                            <p class="meta">
                                                <a href="#">한글마춤뻡의정석</a> <small class="float-right">2021.03.25. 22:23:24</small>
                                                <a class="btn float-right text-green"><i class="fa fa-thumbs-up"></i> 13</a>
                                            </p>
                                            <span>
                                                김'칫'국이 올바른 표현입니다. 꼬우면 국립국어원에 물어보세요.
                                            </span>
                                            <a href="#"><small class="float-right">답글</small></a>
                                        </div>
                                        
                                        <form>
                                            <ul class="comments">
                                                <i class="fa fa-reply" style=""></i>
                                                <input type="text" class="reply">
                                                <input type="submit" value="입력">
                                            </ul>
                                        </form>
                                    </li>
                                </ul>
                                <div class="write-repl">
                                    <form>
                                        <ul class="comments">
                                            <h6>댓글 입력</h6>
                                            <input type="text" class="reply">
                                            <input type="submit" value="입력">
                                        </ul>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
  
  
   <script type="text/javascript">
   $(document).ready(function(){
	   
		 var operForm = $("#operForm");
		 
		 $("button[data-oper='modify']").on("click", function(e){
			 e.preventDefault();
			 
			 operForm.attr("action", "/meet/modify").submit();
			 

		 });
		 
		 $("button[data-oper='list']").on("click", function(e){
			
			 operForm.find("#mno").remove();
			 operForm.attr("action", "/meet/list");
			 operForm.submit();
		 });
		 
		 
		 $("button[data-oper='remove']").on("click", function(e){
			 e.preventDefault();
			 operForm.attr("action", "/meet/remove");
			 operForm.submit();
		 });
   });
	 
   </script>
<%@include file="../include/footer.jsp" %>