<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
    <style>

        .navbar>.container, .navbar>.container-fluid, .navbar>.container-lg, .navbar>.container-md, .navbar>.container-sm, .navbar>.container-xl, .navbar>.container-xxl{
            margin-top: 20px;
        }

        .navbar-brand{
            margin-left: 10%;
        }

        .bg-light{
            background: transparent !important;
        }

        .search{
            width: 70%;
            height: 100px;
            border-radius: 25px;
            background-color: rgb(246, 218, 66);
            margin: auto;
            margin-top: 20px;
        }

    </style>
    <link rel="stylesheet" href="/resources/css/meet/board.css">
</head>
<body>

    <nav class="navbar navbar-light bg-light" style="background: transparent;">
        <div class="container-fluid" style="background-color:rgb(246, 218, 66);">
          <span class="navbar-brand mb-0 h1" style="font-weight: bold;">모임게시판</span>
        </div>
        <div class="container-fluid" style="background: transparent;">
            <span class="navbar-brand mb-0 h1" style="font-weight: bold; background-color: white;">상세검색</span>
          </div>
    </nav>


    <div class="search">
    <form action="/meet/list" method="post">
     <select class="cat" name='catTitle'>
     	<option>카테고리</option>
        <c:forEach items="${category}" var="category">
        <option><c:out value="${category.CName}"/></option>
        </c:forEach>
    </select>

    <select class="cat" >
      <option>서울특별시</option>
      <option>스터디</option>
      <option>취미</option>
      <option>사랑</option>
      <option>김자바</option>
      <option>이자바</option>
      <option>어쩌구</option>
      <option>저쩌구</option>
      <option>하이룽</option>
    </select>
    
    <select class="cat" >
      <option>구</option>
      <option>스터디</option>
      <option>취미</option>
      <option>사랑</option>
      <option>김자바</option>
      <option>이자바</option>
      <option>어쩌구</option>
      <option>저쩌구</option>
      <option>하이룽</option>
    </select>

    <select class="cat" >
      <option>비용</option>
      <option>유료</option>
      <option>무료</option>
    </select>

    <select class="cat" >
      <option>시간</option>
      <option>스터디</option>
      <option>취미</option>
      <option>사랑</option>
      <option>김자바</option>
      <option>이자바</option>
      <option>어쩌구</option>
      <option>저쩌구</option>
      <option>하이룽</option>
     </select>

     <div class="checkedBox"> <input type="checkbox">마감된 모임 포함</div>
    
     <input type="submit" value="검색">
     </form>
     </div>
     
     

    <div class="board_list_wrap">
      <div class="box"><a href="#">최신순</a></div>
      <div class="box"><a href="#">인기순</a></div>
      <table class="board_list">
          <caption>게시판 목록</caption>
          <thead>
              <tr>
                  <th>번호</th>
                  <th id="thumb">썸네일</th>
                  <th id="title">모임명</th>
                  <th>모집기간</th>
                  <th>모임일</th>
                  <th>작성자</th>
                  <th>마감인원</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>찜수</th>
              </tr>
          </thead>
          <tbody>
              <c:forEach items="${list}" var="meet">
              <tr>
                  <td class="freeBno"><c:out value="${meet.mno}" /></td>
                  <td><img src="/resources/img/logo.png"></td>
                  <td class="title">
                      <a  class='move' href='<c:out value="${meet.mno}"/>'>
                      <c:out value="${meet.title}" /></a>
                  </td>
                  <td><c:out value="${meet.recsDt}" /> ~ <c:out value="${meet.receDt}" /></td>
                  <td><c:out value="${meet.startDt}" /></td>
                   <td><c:out value="${meet.id}" /></td>
                  <td><c:out value="${meet.recNo}" /></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${meet.regDt}" /></td>
                  <td><c:out value="${meet.hit}" /></td>
                  <td><c:out value="${meet.thumb}" /></td>
              </tr>
              </c:forEach>
          </tbody>
      </table>
      <form id="searchForm">
          <select name='type'>
              <option value="TC">제목+내용</option>
              <option value="T">제목</option>
              <option value="C">내용</option>
              <option value="W">작성자 아이디</option>
          </select>
          <input type="text" name="keyword" />
          <button>Search</button>
      </form>
      <button class="meet_reg">모임 개설</a></button>
      
       
           <div class="paging">
	           <c:if test="${pageMaker.prev}">
	           	<a href="${pageMaker.startPage-1}" class="btn">&lt;</a>
	           </c:if>
	           
	           <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	           	<a href="${num}" class="num ${pageMaker.cri.pageNum == num ? 'on' : ''}">${num}</a>
	           </c:forEach>
	           
	           <!-- on 빼면 노란색 css빠짐 -->
	           
		       <c:if test="${pageMaker.next}">
		       <a href="${pageMaker.endPage + 1}" class="btn">&gt;</a>
		       </c:if>
     	   </div>
     	   
     	   <form id='actionForm' action="/meet/list" method="get">
     	   	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
     	   	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
     	   </form>
  </div>
  
  
  

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default closeBtn" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


<%@include file="../include/footer.jsp" %>

 <script type="text/javascript">
	 $(document).ready(function(){
		 var result = '<c:out value="${result}"/>';
		 
		 checkModal(result);
		 
		 history.replaceState({}, null, null);
		 
		 function checkModal(result){
			 if(result === '' || history.state){
				 return;
			 }
			 
			 if(parseInt(result) > 0){
				 $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			 }
			 
			 $("#myModal").modal("show");
		 }
		 
		 $(".meet_reg").on("click", function(){
			 self.location = "/meet/reg";
		 });
		 
		 var actionForm = $("#actionForm");
		 
		 $(".paging a").on("click", function(e){
			 e.preventDefault();
			 
			 console.log('click');
			 
			 actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			 actionForm.submit();
		 });
		 
		 $(".move").on("click", function(e){
			 e.preventDefault();
			 actionForm.append("<input type='hidden' name='mno' value='" +$(this).attr("href")+"'>");
			 actionForm.attr("action", "/meet/get");
			 actionForm.submit();
		 });
	 });
 </script>
 