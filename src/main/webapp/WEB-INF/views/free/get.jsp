<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 - 허니비</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/free/get.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</head>
<body>
	<%@include file="../include/header.jsp" %>
    <div class="container">
        <div class="title">
            <h4><c:out value="${free.title}" /></h4>
            <div class="minibox">
                <div class="nick">
                    <img src="../../../resources/img/me.png" />
                    <small>nickname</small>
                </div>
                <div class="regdate">
                    <small><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${free.regdt}" /></small>
                </div>
            </div>
        </div>
        <hr class="solid">
        <div class="content">
            <c:out value="${free.content}" />
        </div>
        <button data-oper="list" class="lstBtn">목록</button>
        <button data-oper="modify" class="modBtn">수정</button>
        <button data-oper="delete" class="delBtn">삭제</button>
        <form id='operForm' action="/free/modify" method="get">
        	<input type='hidden' id="fno" name="fno" value='<c:out value="${free.fno}" />'>
        	<input type='hidden' name="pageNum" value='<c:out value="${cri.pageNum}" />'>
        	<input type='hidden' name="amount" value='<c:out value="${cri.amount}" />'>
        	<input type='hidden' name="type" value='<c:out value="${cri.type}" />'>
        	<input type='hidden' name="keyword" value='<c:out value="${cri.keyword}" />'>
        </form>
        
        <hr class="solid">
        
        <!-- 댓글 읽기 창 -->
        <div class="bootstrap snippets bootdey">
            <div class="row">
                <div class="col-md-12">
                    <div class="blog-comment">
                        <h3 class="text-success">댓글</h3>
                        <ul class="comments">

                       	</ul>

                       	<!-- 댓글 입력창 -->
	                    <div class="write-cm">
                       		<hr class="solid">
	                        <form>
		                        <ul class="comment">
		                        	<li>
				                        <h6>댓글 입력</h6>
				                        <input type="text" class="reply" name="o-reply" />
				                        <button id='regBtn' class="regBtn" type='button'>입력</button>
			                        </li>
		                        </ul>
	                        </form>
                        </div>
                        <!-- 답글 입력창 양식 -->
                        <!-- <div class="write-rp">
	                        <form>
		                        <ul class="re-comment">
			                        <h6>답글 입력</h6>
			                        <input type="text" class="reply">
			                        <button id='repRegBtn' type='button'>입력</button>
		                        </ul>
	                        </form>
                        </div> -->

                    </div>
                </div>
            </div>
        </div>
    </div>
	<%@include file="../include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/freeReply.js"></script>

<!-- 댓글 -->
<script>
	$(document).ready(function() {

		var fnoValue = '<c:out value="${free.fno}"/>';
		var replyUL = $(".comments");

    	showList(1);

		function showList(page) {
			freeReplyService.getList({fno:fnoValue, page: page || 1}, function(list) {
				let str = "";
				if (list == null || list.length == 0) {
					replyUL.html("");
					return;
				}

 				for (let i = 0, len = list.length || 0; i < len; i++) {
 					let showHide = list[i].layer === 0 ? 'none' : 'flex';

					str += "<li class='clearfix' id='" + list[i].frno + "' style='margin-left:" + list[i].layer * 4 + "%' data-frno='" + list[i].frno + "'>";
					str += "	<i class='fa fa-share fa-flip-vertical re' style='display:" + showHide + "'></i>"
					str += "	<img src='https://bootdey.com/img/Content/user_1.jpg' class='avatar' alt=''>";
					str += "	<div class='post-comments'><p class='meta'><a href='#'>" + list[i].id + "</a>";
					str += "	<small class='float-right'>" + freeReplyService.displayTime(list[i].regdt) + "</small>";
 					str += "	<a class='btn thumb float-right' data-frno='" + list[i].frno + "'><i class='fa fa-thumbs-up'></i>" + list[i].thumb + "</a></p>"
					str += "	<span>" + list[i].reply + "</span><button class='modRep'>수정</button><button class='delRep'>삭제</button><button class='repl' onclick='comm(" + list[i].frno + ")'>답글</button></div>"
					str += "	<input type='hidden' data-last=''>";
					str += "	<input type='hidden' data-bundle='" + list[i].bundle + "'>";
					str += "	<input type='hidden' data-order='" + list[i].bunorder + "'>";
					str += "	<input type='hidden' data-layer='" + list[i].layer + "'></li>"
				}

				replyUL.html(str);
			}); // end function
		} // end showList

		// 댓글 입력
		let cmt = $(".write-cm");
		let repInput = cmt.find("input[name='o-reply']");

		$("#regBtn").on("click", function(e) {
			if (repInput.val() === null || repInput.val().trim() === "") {
				alert("댓글을 입력해주세요.");
				return;
			}

			freeReplyService.add({fno: fnoValue, id:"asdf", reply: repInput.val()},
				function(result) {
					alert(result);
					repInput.val("");
					/* showList(1); */
					location.reload();
			});
		});

		// 댓글 수정창 띄우기
		$(document).on("click", ".modRep", function(e) {
			let thisEl = $(this)[0];
			let div = thisEl.parentNode.parentNode;
			comm(div.id);
			$(".reply")[0].value = thisEl.previousSibling.innerText;
			$(".write-rp").data("frno", div.id);
 		});

		// 댓글 수정 or 답글 입력

		$(document).on("click", "#repRegBtn", function(e) {
			let writeRp = $(".write-rp");
			let check = writeRp.data("frno");
			let prev = writeRp.prev();
			let layer = prev.data("layer");
			let order = prev.prev().data("order");

			if (!(check === null || check === "")) { // 댓글 수정
				let reply = {frno: check, reply: $(".reply").val()};

				freeReplyService.update(reply, function(result) {
					alert(result);
					/* showList(1); */
					location.reload();
				});
			} else { // 답글 입력
				let bundle = prev.prev().prev().data("bundle");
				let bunorder = order + (0.1 * (Math.pow(0.1, layer)));
 				let reply = {fno: fnoValue, id: "asdf", reply: $(".reply").val(), layer: layer + 1, bundle: bundle, bunorder: bunorder};

 				freeReplyService.add(reply, function(result) {
					alert(result);
					/* showList(1); */
 					location.reload();
 				});
 			}


		});


		// 댓글 삭제
		$(document).on("click", ".delRep", function(e) {
			let frno = $(this).parent().parent().data("frno");
			console.log(frno);

			freeReplyService.remove(frno, function(result) {
				alert(result);
				showList(1);
			});
		})


		// 댓글 좋아요 *********** 미완 ***************
		$(document).on("click", ".thumb", function(e) {
			e.preventDefault();
 			let frno = $(this).data("frno");
 			let thumb = parseInt($(this)[0].innerText) + 1;
 			console.log(thumb);

  		});


	}); // end of $(document).ready()

	// 답글 창 띄우기
	let cnt = 0;
	const reply = "<div class='write-rp' data-frno=''><form><ul class='re-comment'><h6>댓글 쓰기</h6>"
					+ "<input type='text' class='reply' value=''>"
					+ "<button id='repRegBtn' type='button'>입력</button>"
					+ "<input type='hidden' value='' /></ul></form></div>";

	function comm(id) {
		cnt == 0 ? show_box(id) : hide_box(id);
	}

	function show_box(id) {
		const comment = $("#" + id);

		comment[0].innerHTML += reply;
		$(".re-comment > input[type='hidden']").val(id);
 		cnt++;
	}

	function hide_box(id) {
		let rp = $(".write-rp");

		rp[0].outerHTML = "";
		cnt = 0;
	}
</script>


<!-- TEST -->
<script>

	/* var fnoValue = '<c:out value="${free.fno}"/>'; */

	// for freeReplyService add test
	/* freeReplyService.add(
		{reply: "TEST", id: "tester", fno: fnoValue},
		function(result) {
			alert("RESULT: " + result);
		}
	) */

	// getList test
	/* freeReplyService.getList({ fno:fnoValue, page:1 }, function(list) {
		for (var i = 0, len = list.length || 0; i < len; i++)
			console.log(list[i]);
	}); */

	// delete Test
	/* freeReplyService.remove(23, function(count) {
		if (count === "success")
			alert("REMOVED");
	}, function(err) {
		alert("ERROR...");
	}); */

	// update Test
	/* freeReplyService.update({
		frno : 24,
		fno : fnoValue,
		reply : "가나다라마바"
	}, function(result) {
		alert("수정 완료!");
	}); */

	// get Test
	/* freeReplyService.get(27, function(data) {
		console.log(data);
	}); */

</script>

<!-- 수정, 삭제, 목록으로 버튼 -->
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/free/modify").submit();
		});
		
		$("button[data-oper='delete']").on("click", function(e) {
			operForm.attr("action", "/free/del");
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#fno").remove();
			operForm.attr("action", "/free/list");
			operForm.submit();
		});
	});
</script>

