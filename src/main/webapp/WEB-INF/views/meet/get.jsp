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
    
     <style>
      #modify {
        position: absolute;
            bottom: 3px;
            right: 60px;
    	}

     #delete {
        position: absolute;
            bottom: 3px;
            right: 110px;
   	 }
   	 
   	 .replyList{
   	 background-color:transparent;
   	 border: none;
   	 width : 500px;
   	 }
   	 
   	 
   	 input:focus {outline:none};

    </style>
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
                         <ul class="comments t1">
                            <!--  <li class="clearfix">
                                <img src="https://bootdey.com/img/Content/user_1.jpg" class="avatar" alt="">
                                <div class="post-comments">
                                    <p class="meta">
                                        <a href="#">김치국</a><small class="float-right">2021.03.25. 22:23:24</small>
                                        <a class="btn thumb float-right"><i class="fa fa-thumbs-up"></i> 13</a>  클릭하면 class=text-green 추가 
                                    </p>
                                    <span>김치국이냐 김칫국이냐 그것이 문제로다.</span>
                                    
                                    <a href="#"><small class="float-right">답글</small></a>
                                </div>
                                
                                        
                                        <form>
                                            <ul class="comments">
                                                <i class="fa fa-reply" style=""></i>
                                                <input type="text" class="reply">
                                                <input type="submit" value="입력">
                                            </ul>
                                        </form>
                                    </li>-->
                                </ul>  
                                
                                <div class="write-repl">
                                  <ul class="comments">
                                      <h6>댓글 입력</h6>
                                      <input type="text" class="reply" name="replyContent">
                                      <input id="regReplyBtn" type="submit" value="입력">
                                  </ul>
                                </div>
                             <!-- </li>  -->
                        <!--</ul> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
  
  <script type="text/javascript" src="/resources/js/meetReply.js"></script>
  
  <script>
  console.log("====================");
  console.log("JS TEST");
  
  var mnoValue = '<c:out value="${meet.mno}"/>';
  var replyUL = $(".t1");
  
  showList(1);
  
  function showList(page){
	  replyService.getList({mno : mnoValue, page : page || 1}, function(list){
		  var str = "";
		  
		  if(list == null || list.length == 0){
			  replyUL.html("");
			  
			  return;
		  }
		  
		  for(var i=0, len = list.length || 0; i<len; i++){
			  
		      str += "<li class='clearfix' data-mrno='"+list[i].mrno+"'>";
		      str += "<img src='/resources/img/logo.png' class='avatar' alt=''>";
              str += "<div class='post-comments'>";
              str += "<p class='meta'>";
              str += "닉네임 : " + list[i].nick +"<small class='float-right'>" + replyService.displayTime(list[i].regDt) + "</small>";     
              str += "</p>";
              str += "<input type='text' class='replyList' style='background-color:transparent;' id='"+ list[i].mrno + "'value='" + list[i].reply + "' readonly>";
              str += "<a href='#'><small class='float-right' id='reply' data-mrno='"+list[i].mrno+"'>답글</small></a>";
              str += "<a href='#'><small class='float-right' id='modify' data-mrno='"+list[i].mrno+"'>수정</small></a>";
              str += "<a href='#'><small class='float-right' id='delete' data-mrno='"+list[i].mrno+"'>삭제</small></a>";
              str += "</div>";
              str += "</li>";    

		  }
		  
		  replyUL.html(str);
	  });
	  
  }
  
  //댓글 등록
  var InputReply = $(".write-repl").find("input[name='replyContent']"); //댓글 입력창
  var regReplyBtn = $("#regReplyBtn"); //댓글 입력 버튼
  var regUpdateBtn = $("#modify"); // document.getElementById("modify");
  var regDeleteBtn = $(".t1"); //댓글 삭제 버튼
  
  regReplyBtn.on("click", function(e){
	  e.preventDefault();
	  console.log(InputReply.val());

	  var reply ={
	  mno:mnoValue,
	  id : "tony",
	  reply : InputReply.val(),

  };
  
  	replyService.add(reply, function(result){
	  	alert(result);
	  	InputReply.val('');
	  	showList(1);
  	});
  });
  

  
  //댓글 수정 이벤트 처리
  $(document).on("click", "#modify", function(e){
	  console.log("수정");
	  e.preventDefault(); //기본 a태그 작동 멈추기
	  var mrno = $(this).data("mrno");
	  console.log(mrno);
	  var text = $(this).text();
	  
	  if(text == '확인'){
		  $('#'+mrno).prop('readonly',true);
		  
		  var reply = {mrno : mrno, reply : $('#'+mrno).val()};
		  
		  replyService.update(reply, function(result){
			  alert(result);
			  showList(1);
		  });
	  }else{
		  $('#'+mrno).prop('readonly',false);
		  $(this).text('확인');
		  
	  }
  });
  
  //댓글 댓글 이벤트 처리
   $(document).on("click", "#reply", function(e){
	  console.log("대댓글");
	  e.preventDefault(); //기본 a태그 작동 멈추기
	  var mrno = $(this).data("mrno");
	  console.log(mrno);
	  
	  var str ="";
	  
	  
	  str += "<div class='write-repl' style='margin-bottom : 30px'>";
	  str += "<ul class='comments'>";
	  str += "<h6>댓글 입력</h6>";
	  str += "<input type='text' class='reply' name='replyContent'>";
	  str += "<input id='regReplyBtn' type='submit' value='입력'>";
	  str += "</ul>";
	  str += "</div>";
	  
      if($('#'+mrno).children(".write-repl").length == 0){
		  $('#'+mrno).append(str);
		  $("#reply").off();
      }
  }); 
  
  
  //댓글 삭제 이벤트 
  $(document).on("click", "#delete", function(e){
	  console.log("삭제");
	  e.preventDefault();
	  var mrno = $(this).data("mrno");
	  console.log(mrno);
	  
	  replyService.remove(mrno, function(result){
		  alert(result);
		  showList(1);
	  });
  });


  //for replyService add test
  /*
  replyService.add(
	  {reply: "TS TEST", id:"tony", mno:mnoValue}
	  , 
	  function(result){
		  alert("result : " + result);
  });
	  
  replyService.getList({mno:mnoValue, page:1}, function(list){
	  for(var i=0, len = list.length||0; i<len; i++){
		  console.log(list[i]);
	  }
  });
  
  
  //댓글 삭제 테스트
  replyService.remove(34, function(count){
	  console.log("삭제 성공 : " + count);
	  
	  if(count === "success"){
		  alert("removed");
	  }
  }, function(err){
	  alert('error....');
  })
  
  //35번댓글 수정
  replyService.update({
	  mrno : 35,
	  mno : mnoValue,
	  reply : "modified reply..........."
  }, function(result){
	  alert("수정완료...");ㄴ
  });
  
  replyService.get(32, function(data){
	  console.log(data);
  });
  */
  
  </script>
  
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