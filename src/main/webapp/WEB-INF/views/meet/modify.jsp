<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/meet/register.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- smartEditor -->
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- sweetAlert -->
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!-- modal -->
 <script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
 <link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 <!-- naver map api -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i1ygn9fyrm"></script>
  <!-- 제이쿼리 ui css -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <!--제이쿼리 js-->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!--제이쿼리 ui js-->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <!-- timepicker -->
 <script type="text/javascript" src="/resources/timepicker/jquery.timepicker.js"></script>
 <link rel="stylesheet" href="/resources/timepicker/jquery.timepicker.css">
</head>
<body>
<form role="form" action="/meet/modify" method="post">
    <div class="wrap">
        <div class="box">
            <div class="b top">
                <div class="top title">모임 개설</div>
                <div class="sub title">

                    <select id="cat" class="cat" name="cid3">
				        <option><c:out value="${meet.cid3}"/></option>
                    </select>


                    <input type="hidden" name="mno" value='<c:out value="${meet.mno}"/>'>
                    <input type="text" name="title" value='<c:out value="${meet.title}"/>'>
                </div>
                <div class="content">
                	<textarea rows="1"  name="smry"><c:out value="${meet.smry}"/></textarea>
                	<textarea name="ir1" id="ir1" rows="10" cols="100">${meet.content}</textarea>
                </div>
                <div class="control">
                    <ul>
                        <li class="list +">+</li>
                        <li class="list -">-</li>
                        <li class="btn"><button value="첨부파일">첨부파일</button></li>
                    </ul>
                </div>
            </div>
            
            <div class="b bottom">
                <div class="bottom title">모임 상세</div>
                <div class="bottom_box">
                    <div class="bot left">
                        <ul class="bottom_content">
                        	<li>모임시작일자 <input type="text" class="datepicker" name="startDt" value='<c:out value="${meet.startDt}"/>' readonly><input class="platanusTime" name="startDt2" value='<c:out value="${meet.startDt}"/>' readonly/></li>
                            <li>모임종료일자 <input type="text" class="datepicker"  name="endDt" value='<c:out value="${meet.endDt}"/>' readonly><input class="platanusTime" name="endDt2"  readonly/></li>
                            <li>모임모집시작일자 <input type="text" class="datepicker" name="recsDt" value='<c:out value="${meet.recsDt}"/>' readonly><input class="platanusTime" name="recsDt2"  readonly/></li>
                            <li>모임모집종료일자 <input type="text" class="datepicker" name="receDt" value='<c:out value="${meet.receDt}"/>' readonly><input class="platanusTime" name="receDt2" readonly/></li>
                            <li>모집인원 <input type="text" id="recNo" name="recNo" value='<c:out value="${meet.recNo}"/>'></li>
                            <li>비용 <input id="free" type="radio" name="charge" value="N">무료<input id="charge" type="radio" name="charge" value="Y" >유료</li>
                            <li>온오프라인유무 <input id="ON" type="radio" name=onoff value="ON">온라인<input id="OFF" type="radio" name="onoff" value="OFF">오프라인</li>
                            <li>모임장소<input type="text" name="place" value='<c:out value="${meet.place}"/>'></li>
                            <li>링크<input type="text" name="link" value='<c:out value="${meet.link}"/>'></li> 
                        </ul>
                        
                        
                        <!-- 하드코딩 -->
                        <input type='hidden' name="cid2" value="RC002">
                        <input type='hidden' name="id" value="tony">

                    </div>
                    <div class="bot right">
                        <div class="thumb title">썸네일</div>
                        <!-- modal -->
                        <div id="uploadDiv" class="modal">
							<input type="file" name="uploadFile">
							<button id='uploadBtn'>업로드 하기</button>
						</div>
						
						
                        <p><a href="#uploadDiv" rel="modal:open">사진 업로드</a></p>
                        <div class="img">
                        
                         <c:choose>
					         <c:when test="${meet.img == null}">
					         <td><img id="profile" src='/resources/img/logo.png'></td>
					         <input type="hidden" name="img">
					         </c:when>
					         <c:when test="${meet.img != null}">
					         <td><img id="profile" src='display?fileName=<c:out value="${meet.img}" />'></td>
					         <input type="hidden" name="img">
					         </c:when>
				       </c:choose>
                        </div>
                    </div>
                    
                </div>
                
                <div class="map" id="map" style="width:100%;height:500px;"></div>
                
                <button type="submit" data-oper='modify'>모임 수정</button>
                <button type="reset" data-oper='remove'>모임 삭제</button>
                <button type="submit" data-oper='list'>목록으로 가기</button>

                <!-- 추가 -->
                <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
                <input type='hidden' name='cid' value='<c:out value="${cri.cid}"/>'>

            </div>
        </div>
    </div>
  </form>
<%@include file="../include/footer.jsp" %>

<script>
$(document).ready(function(){
	var startDt = "${meet.startDt}";
	var startDt = startDt.split(" ");
	var endDt ="${meet.endDt}";
	var endDt = endDt.split(" ");
	var recsDt="${meet.recsDt}";
	var recsDt = recsDt.split(" ");
	var receDt="${meet.receDt}";
	var receDt = receDt.split(" ");
	
	

	
	$('input[name=startDt]').val(startDt[0]);
	$('input[name=startDt2]').val(startDt[1]);
	
	$('input[name=endDt]').val(endDt[0]);
	$('input[name=endDt2]').val(endDt[1]);
	
	$('input[name=recsDt]').val(recsDt[0]);
	$('input[name=recsDt2]').val(recsDt[1]);
	
	$('input[name=receDt]').val(receDt[0]);
	$('input[name=receDt2]').val(receDt[1]);
});
</script>

<script>
//모집인원 유효성 검사
   $('#recNo').on('keyup', function(){
         var str = $('#recNo').val();
         var num_pattern = /^[0-9]*$/;
         
         if(str.search(num_pattern) == -1){
        	 alert("숫자만 입력할 수 있습니다.");
         }
   });
</script>

<script>
$(document).ready(function(){
	//date, time picker
		$(".platanusTime").timepicker({
			timeFormat : "HH:mm",
			interval : 10,
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
	  
	  
	  $( function() {
	    $( ".datepicker").datepicker();
	  } );
	
	  $.datepicker.setDefaults({
	      dateFormat: 'yy-mm-dd',
	      prevText: '이전 달',
	      nextText: '다음 달',
	      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	      showMonthAfterYear: true,
	      yearSuffix: '년'
	  });
	  
	
});
</script>


 <script type="text/javascript">
 //naver smartEditor
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>

<script>
var elClickedObj = $("button[type='submit']");
elClickedObj.on("click", function(e){
		e.preventDefault();
		
		
		console.log("submit clicked");
		
		//날짜 date, time 값 합쳐서 보내기
		var totalstartDt = $('input[name=startDt]').val() + " " +  $('input[name=startDt2]').val()
		var totalendDt = $('input[name=endDt]').val() + " " +  $('input[name=endDt2]').val()
		var totalrecsDt = $('input[name=recsDt]').val() + " " +  $('input[name=recsDt2]').val()
		var totareceDt = $('input[name=receDt]').val() + " " +  $('input[name=receDt2]').val()
		$('input[name=startDt]').val(totalstartDt);
		$('input[name=endDt]').val(totalendDt);
		$('input[name=recsDt]').val(totalrecsDt);
		$('input[name=receDt]').val(totareceDt);
		
		 swal({
			  title: "정말 모임을 수정하시겠습니까?",
			  text: "잘못 입력한 부분은 없는지 확인해주세요!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

				    swal("게시물 수정이 완료되었습니다!", {
				      icon: "success",
				    }).then((willDelete)=>{
				    	$("form").submit();
				    	});

			  } else {
			    swal("게시물 수정이 취소되었습니다!");
			  }
			});

		// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		 // 에디터의 내용이 textarea에 적용된다.
		 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

		 console.log(document.getElementById("ir1").value);
		 try {
		    elClickedObj.form.submit();
		 } catch(e) {}
		}
	});
</script>

 <script type="text/javascript">
	 $(document).ready(function(){
		 var charge = "<c:out value='${meet.charge}'/>";
		 if(charge=="Y"){
			 console.log("성공!" + charge);
			 $("input:radio[id=charge]").prop("checked", true);
		 }else{
			 console.log("성공!" + charge);
			 $("input:radio[id=free]").prop("checked", true);
		 }
		 
		 var onOff = "<c:out value='${meet.onoff}'/>";
		 if(onOff=="ON"){
			 console.log("성공!" + onOff);
			 $("input:radio[id=ON]").prop("checked", true);
		 }else{
			 console.log("성공!" + onOff);
			 $("input:radio[id=OFF]").prop("checked", true);
		 }
		 
		 var formObj = $("form");
		 
		 $('button').on("click", function(e){
			 e.preventDefault();
			 
			 var operation = $(this).data("oper");
			 
			 console.log(operation);
			 
			 if(operation === 'remove'){
				 formObj.attr("action", "/meet/remove");
				 formObj.submit();

			 }else if(operation === 'list'){
				 formObj.attr("action", "/meet/list").attr("method", "get");


				 var pageNumTag = $("input[name='pageNum']").clone();
				 var amountTag = $("input[name='amount']").clone();
				 var keywordTag = $("input[name='keyword']").clone();
				 var typeTag = $("input[name='type']").clone();
				 var cidTag = $("input[name='cid']").clone();

				 formObj.empty();

				 formObj.append(pageNumTag);
				 formObj.append(amountTag);
				 formObj.append(keywordTag);
				 formObj.append(typeTag);
				 formObj.append(cidTag);
				 
				 formObj.submit();
			 }
			 //formObj.submit();
		 });

	 });
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
<script>
 //썸네일 사진 업로드
 $(document).ready(function() {
		    var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			
			var regex = new RegExp("(.*?)\.(jpg|png|JPG|PNG)$");
			var maxSize = 5242880;

			//업로드 파일 유효성 검사
			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				if (!regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없습니다.")
					return false;
				}
				return true;
			}

			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				
				//업로드한 썸네일 담기
				var files = inputFile[0].files;
				console.log(files);
				
				//업로드한 파일 유효성 검사
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
					
				}
				var mno = ${meet.mno};
				formData.append("mno", mno);
				
				$.ajax({
					url : '/meet/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						console.log(result[0].fileName);
						
					
						var callFileName = year + "/" + month + "/" + day + "/" + result[0].fileName;
					 	document.getElementById('profile').src = "display?fileName=" + callFileName;
					 	$('input[name=img]').val(callFileName);
						$(".uploadDiv").html(cloneObj.html());
					}
				});
				
				
			});
		});
 
 </script>
 <script>

 </script>