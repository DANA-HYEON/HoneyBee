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
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

    <!-- sweetAlert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- naver map api -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i1ygn9fyrm"></script>
</head>
<body>


  <nav class="navbar navbar-light bg-light" style="background: transparent;">
        <div class="container-fluid" style="background-color:rgb(246, 218, 66);">
          <span class="navbar-brand mb-0 h1" style="font-weight: bold;">모임게시판</span>
        </div>
        <div class="container-fluid" style="background: transparent;">
            <span class="navbar-brand mb-0 h1" style="font-weight: bold; background-color: white;">모임카테고리 : <c:out value="${meet.cid3}"/></span>
          </div>
    </nav>


    <div class="total">
    <div class="mid">
      <div class="meet left">
       <c:choose>
         <c:when test="${meet.img == null}">
         <td><img src='/resources/img/logo.png'></td>
         </c:when>
         <c:when test="${meet.img != null}">
         <td><img src='display?fileName=<c:out value="${meet.img}" />'></td>
         </c:when>
       </c:choose>
      </div>

      <div class="meet right">
        <div class="meet top">
          <div class="title"><p><c:out value="${meet.title}"/></p></div>
          <hr class="line" style="border:1px solid silver;" width="90%">
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
              <li>취소인원   <c:out value="${meet.cnclNo}"/></li>
              <li>유무료구분   <c:out value="${meet.charge}"/></li>
              <li>온오프라인유무   <c:out value="${meet.onoff}"/></li>
              <li>링크 <a id="link" href ="" target="_blank">${meet.link}</a></li>
              <li>모임개설일자   <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${meet.regDt}" /></li>
              <li>찜수   <c:out value="${meet.thumb}"/></li>
              <li>조회수   <c:out value="${meet.hit}"/></li>
            </ul>
          </div>
           <button id="inquiry">문의하기</button> <button id="wish">찜하기</button> <button id="apply">신청하기</button>
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
      <div class="text" style="margin-bottom:100px;">
      ${meet.content}
      </div>
      
	  <h6>모임 장소</h6>
      <div class="map" id="map" style="width:100%;height:500px;"></div>
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
	  	<input type='hidden' name='cid' value='<c:out value="${cri.cid}"/>'>
		<input type='hidden' name='order' value='<c:out value="${cri.order}"/>'>
	  </form>


        <!-- 댓글 읽기 창 -->
        <div class="bootstrap snippets bootdey">
            <div class="row">
                <div class="col-md-12">
                    <div class="blog-comment">
                        <h3 class="text-success">문의하기</h3>
                         <ul class="comments t1">
                         </ul>

                         <div class="write-repl">
                           <ul class="comments">
                               <h6>문의 입력</h6>
                               <input type="text" class="reply" name="replyContent">
                               <input id="regReplyBtn" type="submit" value="입력">
                           </ul>
                         </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>

  <script type="text/javascript" src="/resources/js/meetReply.js"></script>
  <script type="text/javascript" src="/resources/js/meetThumb.js"></script>
  <script type="text/javascript" src="/resources/js/meetApply.js"></script>

  <script>
  $(document).ready(function(){
	   var link = 'http://' + '<c:out value="${meet.link}"/>';
	   console.log(link);
	   $("#link").prop('href', link);  
  });
   
  </script>
  <script>
  var mnoValue = '<c:out value="${meet.mno}"/>';
  var eno = "HOHO995@naver.com" + mnoValue;
  var applyBtn = $("#apply");


  console.log("test : " + eno);


  function autoApplyCheck(){
	  meetApply.applyGet(eno, function(data){
		  console.log( "신청 되어있는 데이터 : " + data);


		  if(data != ''){
			  applyBtn.css("background-color" , "gray");
		  }else{
			  applyBtn.css("background-color" , "aqua");
		  }
	  });
  }

	//신청하기
	  $(document).on("click", "#apply", function(e){
		  e.preventDefault();
		  console.log("eno : " + eno);


		  meetApply.applyGet(eno, function(data){
			  console.log("신청 되어있는 데이터 : " + data);


			  if(data == ''){
				  applyBtn.css("background-color" , "gray");
				  var eno = {
						  id:"HOHO995@naver.com",

						  mno:mnoValue
				  };


				  meetApply.add(eno, function(result){
					  //alert("신청 되었습니다.");
					  swal("신청 되었습니다.", "해당 버튼을 한 번 더 클릭하면 취소 할 수 있습니다.", "success").then((value)=>location.reload());
					  //location.reload();
				  });
			  }

			  if(data != ''){
				  var result = confirm("이미 신청 되어있는 게시물입니다. 신청 취소 하시겠습니까?");

				  if(result){
					  applyBtn.css("background-color" , "aqua");
					  var eno = {
							  id:"HOHO995@naver.com",
							  mno:mnoValue
					  };

					  meetApply.removeApply(eno, function(result){
						  //alert("신청 취소 완료");
						  swal("신청 취소 완료").then((value)=>location.reload());
						  //location.reload();
					  });
					  //location.reload();
				  }
			  }
		  });
	  });
  </script>



  <script>
  var mnoValue = '<c:out value="${meet.mno}"/>';
  var thumbno = "HOHO995@naver.com" + mnoValue;
  var thumbsBtn = $("#wish");


  $(document).ready(function(){
	  autoThumbCheck();
	  autoApplyCheck();
  });

  function autoThumbCheck(){
	  meetService.getThumb(thumbno, function(data){
		  console.log("찜 추가되어있는 데이터 : " + data);

		  if(data != ''){
			  thumbsBtn.css("background-color" , "gray");
		  }else{
			  thumbsBtn.css("background-color" , "aqua");
		  }
	  });
  }
  
  

  //찜하기
  $(document).on("click", "#wish", function(e){
	  e.preventDefault();
	  console.log("thumbbno : " + thumbno);

	  meetService.getThumb(thumbno, function(data){
		  console.log("찜 추가되어있는 데이터 : " + data);

		  if(data == ''){
			  thumbsBtn.css("background-color" , "gray");
			  var thumb = {
					  id:"HOHO995@naver.com",
					  mno:mnoValue
			  };

			  meetService.add(thumb, function(result){
				  swal("찜 추가 되었습니다.", "해당 버튼을 한 번 더 클릭하면 취소 할 수 있습니다.", "success").then((value)=>location.reload());
				  //location.reload();
			  });
		  }

		  if(data != ''){
			  var result = confirm("이미 찜 되어있는 게시물입니다. 찜 취소 하시겠습니까?");

			  if(result){
				  thumbsBtn.css("background-color" , "aqua");
				  var thumb = {
						  id:"HOHO995@naver.com",
						  mno:mnoValue
				  };

				  meetService.remove(thumb, function(result){
					  swal("찜 취소 완료").then((value)=>location.reload());
					  //location.reload();
				  });
			  }

		  }
	  });
  });
  </script>


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

		      str += "<li name='replyList' class='clearfix " + list[i].bundle + "' data-layer= '" + list[i].layer +"' data-bundle='" + list[i].bundle +"' data-mrno='"+list[i].mrno+"' style='margin-left : " + list[i].layer * 7 + "%'>";
		      str += "<img src='/resources/img/logo.png' class='avatar' alt=''>";
              str += "<div class='post-comments'>";

		      if(list[i].layer == 1){
		      	str += "<i class='fa fa-share fa-flip-vertical re'></i>";
		      }

              str += "<p class='meta'>";
              str += "닉네임 : " + list[i].nick +"<small class='float-right'>" + replyService.displayTime(list[i].regDt) + "</small>";
              str += "</p>";
              str += "<input type='text' class='replyList' style='background-color:transparent;' id='"+ list[i].mrno + "'value='" + list[i].reply + "' readonly>";

              if(list[i].layer != 1){

              str += "<a href='#'><small class='float-right' id='reply' data-mrno='"+list[i].mrno+"'>답글</small></a>";
              };

              str += "<a href='#'><small class='float-right' id='modify' data-mrno='"+list[i].mrno+"'>수정</small></a>";
              str += "<a href='#'><small class='float-right' id='delete' data-bundle='" + list[i].bundle +"' data-layer='" +list[i].layer+ "' data-mrno='"+list[i].mrno+"'>삭제</small></a>";
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
	  reply : InputReply.val()
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

	  console.log(text);

	  if(text == '확인'){
		  $('#'+mrno).prop('readonly',true);

		  var reply = {mrno : mrno, reply : $('#'+mrno).val()};
		  $(this).text('수정');

		  replyService.update(reply, function(result){
			  alert(result);
			  showList(1);
		  });
	  }else{
		  $('#'+mrno).prop('readonly',false);
		  $(this).text('확인');

	  }
  });

  //대댓글 입력창 띄우기 이벤트 처리
   $(document).on("click", "#reply", function(e){
	   $(".float-right").off();
	  console.log("대댓글");
	  e.preventDefault(); //기본 a태그 작동 멈추기
	  var parentMrno = $()
	  var mrno = $(this).data("mrno");
	  console.log(mrno);

	  var str ="";


	  str += "<div class='write-repl' id='reply_reply' style='margin-bottom : 30px'>";
	  str += "<ul class='comments'>";
	  //str += "<i class='fa fa-share fa-flip-vertical re'></i>";
	  str += "<h6>댓글 입력</h6>";
	  str += "<input type='text' class='reply' name='replyR_Content'>";
	  str += "<input id='regR_ReplyBtn' type='submit' value='입력'>";
	  str += "<input id='canR_ReplyBtn' type='submit' value='취소'>";
	  str += "</ul>";
	  str += "</div>";

       if($("."+mrno).children(".write-repl").length == 0){
    	   $("."+mrno).append(str);

      }

  });

	  //대댓글 등록 이벤트 처리
	  $(document).on("click", "#regR_ReplyBtn", function(e){
		  e.preventDefault();
	  	  var InputR_Reply = $(".write-repl").find("input[name='replyR_Content']"); //댓글 입력창
		  var par = $("#reply_reply").prev().children("input").attr("id");
		  console.log("내용 : " + InputR_Reply.val() + "mrno : " + par);

		  var R_reply ={
		  mno:mnoValue,
		  id : "tony",
		  reply : InputR_Reply.val(),
		  layer : 1,
		  bundle :par,
		  bunOrder : par
	  };

	  	replyService.add(R_reply, function(result){
		  	alert(result);
		  	InputR_Reply.val('');
		  	showList(1);
	  	});
	  });

	  //대댓글 입력 취소
	  $(document).on("click", "#canR_ReplyBtn", function(e){
		  e.preventDefault();
		  console.log("대댓글 입력 취소");
		  $(this).parents(".write-repl").remove();
	  });


  //댓글 삭제 이벤트
  $(document).on("click", "#delete", function(e){
	  console.log("삭제");
	  e.preventDefault();
	  var mrno = $(this).data("mrno");
	  var layer = $(this).data("layer");
	  var bundle = $(this).data("bundle");
	  console.log("mrno : " + mrno + ", layer : " + layer + ", bundle : " + bundle);


	  //댓글 삭제시 대댓글이 달려 있을 경우 문구 띄우기. true일 겨우 대댓글도 같이 삭제
	 /*  var deleteResult = false;
	  var bundleArr = new Array();
	  var myMrnoArr = new Array();

	  if(layer == 0){
		 deleteResult = confirm("대댓글이 달려 있는 댓글입니다. 삭제 시 대댓글도 같이 삭제됩니다. 삭제하시겠습니까?");
		 console.log(deleteResult);
	  }

	  if(deleteResult){
		  $('li[name="replyList"]').each(function(){
			  var myBundle = $(this).data('bundle');

			  bundleArr.push(myBundle);
		  });

		  console.log(bundleArr);
	  }else{

	  }

		  for(var i = 0; i<bundleArr.length; i++){
			  if(bundle == bundleArr[i]){
				  console.log("같음");
				  var multi = $('.' + bundle);
				  var multi_array = [];

				  $.each(multi, function(index, item){
					  multi_array.push($(item).data("mrno"));
				  });

				  console.log(multi_array);

				  for(var j=0; j<multi_array.length; j++){
					  console.log(multi_array[j]);
					  replyService.remove(multi_array[j], function(result){
						  /* alert(result);
						  showList(1);
					  });

				  }
				  showList(1);
				  return;
			  }
		  } */

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
	  alert("수정완료...");
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
			 console.log("${cri.cid}");
			 operForm.submit();
		 });


		 $("button[data-oper='remove']").on("click", function(e){
			 e.preventDefault();
			 operForm.attr("action", "/meet/remove");
			 operForm.submit();
		 });
   });

   </script>

<script>
   $(document).ready(function($) {

	   var scrollPosition = $(".text-success").offset().top;
       $("#inquiry").click(function(event){
               event.preventDefault();
               $('html,body').animate({scrollTop:scrollPosition},700);
       });
});
</script>
<script>
  autosize($("textarea"));
 </script>
 
 
 <script>
//naver map api
var HOME_PATH = window.HOME_PATH || '.';

var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    });

var contentString = [
        '<div class="iw_inner">',
        '   <h3>서울특별시청</h3>',
        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
        '       <img src="'+ HOME_PATH +'/img/example/hi-seoul.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
        '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
        '   </p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);
</script>
<%@include file="../include/footer.jsp" %>
