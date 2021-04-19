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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
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
            <c:out value="${free.content}" escapeXml="false"/>
        </div>
        <div class="heartBtn">
            <a class='btn heart'><i class="fa fa-heart fa-3x" aria-hidden="true"></i><br>좋아요 <c:out value='${free.thumb}' /></a>
        </div>
        <button data-oper="list" class="lstBtn">목록</button>
        <button data-oper="report" class="reportBtn">신고</button>
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
				                        <input type="text" class="o-reply" name="o-reply" />
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">신고하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
            	<!-- 신고하는 대상(게시물, 댓글) 번호 -->
            	<div class="form-group" id="badFno">
            		<label>신고 게시물 번호</label>
            		<input type="text" class="form-control" name="badFno" value="<c:out value='${free.fno}'/>" readonly >
           		</div>
            	<div class="form-group" id="badFrno">
            		<label>신고 댓글 번호</label>
            		<input type="text" class="form-control" name="badFrno" value="" readonly >
           		</div>
            	<div class="form-group">
            		<label>제목</label>
            		<input class="form-control" name='reportTitle'>
            	</div>
            	<div class="form-group">
            		<label>신고 내용</label>
            		<textarea class="form-control" rows="3" name='reportContent'></textarea>
            	</div>
            </div>
            <div class="modal-footer">
                <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="sendBtn" type="button" class="btn btn-primary">신고하기</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<script type="text/javascript" src="/resources/js/freeReply.js"></script>
<script type="text/javascript" src="/resources/js/freeThumb.js"></script>
<script type="text/javascript" src="/resources/js/freeReport.js"></script>

<!-- 게시물 -->
<script type="text/javascript">
	$(document).ready(function() {

		let fnoValue = '<c:out value="${free.fno}"/>';

		// 좋아요 클릭
		// * 남은 과제 : 1) 이미 좋아요 한 상태면 분홍색 하트, 아니면 검은색 하트
		//			   2) 좋아요 누르면 실시간으로 좋아요 개수 바뀌게
		$(".heart").on("click", function(e) {
		    e.preventDefault();
		    freeService.thumbUp({id:"asdf", fno: fnoValue}, function(result) {
		    	alert(result);
		    	location.reload(); // 새로고침 안해도 되게 수정할 것!
		    });
        });
		
		// 신고 기능 구현
		let modal = $(".modal");
		let reportTitle = modal.find("input[name='reportTitle']");
		let reportContent = modal.find("textarea[name='reportContent']");
		let badFno = modal.find("input[name='badFno']");
		let badFrno = modal.find("input[name='badFrno']");

		let sendBtn = $("#sendBtn");

		// 게시물 신고창 띄우기
		$(".reportBtn").on("click", function(e) {
			reportTitle.val("");
			reportContent.val("");
			$("#badFrno").hide();

			$('#myModal').modal('show');
		});

		// 신고 등록
		sendBtn.on("click", function() {
			console.log("REPORT REPORT REPORT");

			if (reportTitle.val().trim() === "" || reportTitle.val().trim() === null) {
				alert("신고 제목을 입력해주세요.");
				return;
			} else if (reportContent.val().trim() === "" || reportContent.val().trim() === null) {
				alert("신고 내용을 입력해주세요.");
				return;
			}

			let inquiry = { id : "asdf", title : reportTitle.val(), content : reportContent.val() };
			let badValue = badFrno.val();
			(badValue === "" || badValue === null) ? inquiry.fno = fnoValue : inquiry.frno = badValue;

			console.log("FNO : " + inquiry.fno);
			console.log("FRNO : " + inquiry.frno);

			reportService.reportObj(inquiry, function(result) {
				alert(result);
				modal.modal("hide");
				modal.find("div[class='form-group']").show();
			})
		});

		// 댓글 신고창 띄우기
		$(document).on("click", ".reportRep", function(e) {
			e.preventDefault();
			let frnoValue = $(this).parent().parent().data("frno");

			reportTitle.val("");
			reportContent.val("");
			$("#badFno").hide();
			badFrno.val(frnoValue);

			$('#myModal').modal('show');
		});

	});
</script>


<!-- 댓글 -->
<script type="text/javascript">
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
					str += "	<span>" + list[i].reply + "</span><button class='modRep'>수정</button><button class='delRep'>삭제</button>"
					str += "	<button class='repl' onclick='comm(" + list[i].frno + ")'>답글</button><button class='reportRep'>신고</button></div>"
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
			$(".reply").val(thisEl.previousSibling.innerText);
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
					cnt = 0;
					showList(1);
				});
			} else { // 답글 입력
				let bundle = prev.prev().prev().data("bundle");
				let bunorder = writeRp.parent().attr("id");
 				let reply = {fno: fnoValue, id: "asdf", reply: $(".reply").val(), layer: layer + 1, bundle: bundle, bunorder: bunorder};

 				freeReplyService.add(reply, function(result) {
					alert(result);
					cnt = 0;
					showList(1);
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
		});


		// 댓글 좋아요
		$(document).on("click", ".thumb", function(e) {
			e.preventDefault();
			let frnoValue = $(this).data("frno");
			let reply = {id:"asdf", frno: frnoValue};

			freeService.replyThumbUp(reply, function(result) {
				alert(result);
				showList(1);
			});
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
		
		console.log(rp[0].outerHTML);
		console.log("=================");
		console.log(rp.clone().wrapAll("<div/>").parent().html());

		console.log(rp[0].outerHTML);
		console.log("=================");
		console.log(rp.clone().wrapAll("<div/>").parent().html());

		rp[0].outerHTML = "";
 		$("input[type='text']").val("");
		cnt = 0;
	}
</script>


<!-- TEST -->
<script type="text/javascript">

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

