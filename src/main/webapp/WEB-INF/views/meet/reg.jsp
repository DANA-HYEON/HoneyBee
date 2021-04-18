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
 <!-- modal -->
 <script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
<form role="form" action="/meet/reg" method="post">
    <div class="wrap">
        <div class="box">
            <div class="b top">
                <div class="top title">모임 개설</div>
                <div class="sub title">
                    <select class="cat" name='cid'>
                        <c:forEach items="${category}" var="category">
				        	<c:if test="${category.CId != 'M000'}">
				        	<option value='<c:out value="${category.CId}"/>'><c:out value="${category.CName}"/></option>
				        	</c:if>
				        </c:forEach>
                    </select>
                    <input type="text" name="title" value='<c:out value="${meet.mno}"/>'>
                </div>
                <div class="content">
                	<textarea rows="1" placeholder="모임 요약내용을 입력해주세요." name="smry"></textarea>
                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                </div>
                <div class="control">
                    <ul>
                        <li class="list +">+</li>
                        <li class="list -">-</li>
                        <li class="btn"><input type="file" name="uploadFile2" multiple>첨부파일</li>
                    </ul>
                </div>
            </div>

            <div class="b bottom">
                <div class="bottom title">모임 상세</div>
                <div class="bottom_box">
                    <div class="bot left">
                        <ul class="bottom_content">
                            <li>모임시작일자 <input type="text" class="datepicker" name="startDt" placeholder="날짜를 선택해주세요." readonly><input class="platanusTime" name="startDt2"  placeholder="시간" readonly/></li>
                            <li>모임종료일자 <input type="text" class="datepicker" name="endDt" placeholder="날짜를 선택해주세요." readonly><input class="platanusTime" name="endDt2"  placeholder="시간" readonly/></li>
                            <li>모임모집시작일자 <input type="text" class="datepicker" name="recsDt" placeholder="날짜를 선택해주세요." readonly><input class="platanusTime" name="recsDt2"  placeholder="시간" readonly/></li>
                            <li>모임모집종료일자 <input type="text" class="datepicker" name="receDt" placeholder="날짜를 선택해주세요." readonly><input class="platanusTime" name="receDt2"  placeholder="시간" readonly/></li>
                            <li>모집인원 <input id="recNo" type="text" name="recNo" placeholder="내용을 입력해주세요."></li>
                            <li>비용 <input type="radio" name="charge" value="N">무료 <input type="radio" name="charge" value="Y">유료</li>
                            <li>온오프라인유무 <input type="radio" name=onoff value="ON">온라인 <input type="radio" name="onoff" value="OFF">오프라인</li>
                            <li>모임장소<input type="text" name="place" placeholder="내용을 입력해주세요."></li>
                            <li>링크<input type="text" name="link" placeholder="대표 링크를 입력해주세요"></li>
                        </ul>
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
                        <div class="img"><img id="profile" src="/resources/img/logo.png"></div>
                        <input type="hidden" name="img">
                    </div>

                </div>
                <div class="map" id="map" style="width:100%;height:500px;"></div>


                <button type="submit">모임 등록</button>
            </div>
        </div>
    </div>
  </form>


<script>
//모집인원 유효성 검사
   $('#recNo').on('keyup', function fn_nickChk() {
         var str = $('#recNo').val();
         var num_pattern = /^[0-9]*$/;
         
         if(str.search(num_pattern) == -1){
        	 alert("숫자만 입력할 수 있습니다.");
         }
   });
</script>

<script>
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
			  title: "정말 모임을 게시하시겠습니까?",
			  text: "잘못 입력한 부분은 없는지 확인해주세요!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
					oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

				    swal("게시물 작성이 완료되었습니다!", {
				      icon: "success",
				    }).then((willDelete)=>{$("form").submit();})

			  } else {
			    swal("게시물 게시가 취소되었습니다!");
			  }
			});

		// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		 // 에디터의 내용이 textarea에 적용된다.
		 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

		 // 에디터의 내용에 대한 값 검증은 이곳에서
		 // document.getElementById("ir1").value를 이용해서 처리한다.

		 console.log(document.getElementById("ir1").value);
		 try {
		     elClickedObj.form.submit();
		 } catch(e) {}
		}
	});
</script>

 <script>
 //썸네일 사진 업로드
 $(document).ready(function() {
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
						
					    var date = new Date();
						var year = date.getFullYear();
						var month = ("0" + (1 + date.getMonth())).slice(-2);
						var day = ("0" + date.getDate()).slice(-2);
					
						var callFileName = year + "/" + month + "/" + day + "/" + result[0].fileName;
					 	document.getElementById('profile').src = "display?fileName=" + callFileName;
					 	$('input[name=img]').val(callFileName);
						$(".uploadDiv").html(cloneObj.html());
					}
				});

			});
		});
 
 </script>
</body>
</html>

<%@include file="../include/footer.jsp" %>
