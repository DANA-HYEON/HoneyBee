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
 <!--제이쿼리 style css-->
 <link rel="stylesheet" href="/resources/demos/style.css">
 <!--제이쿼리 js-->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!--제이쿼리 ui js-->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                    <!-- <textarea rows="20" placeholder=" 내용을 입력해주세요." name="content"></textarea> -->
                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                </div>
                <div class="control">
                    <ul>
                        <li class="list +">+</li>
                        <li class="list -">-</li>
                        <li class="btn"><input type="file" name="uploadFile" multiple>첨부파일</li>
                    </ul>
                </div>
            </div>
            
            <div class="b bottom">
                <div class="bottom title">모임 상세</div>
                <div class="bottom_box">
                    <div class="bot left">
                        <ul class="bottom_content">
                            <li>모임시작일자 <input type="text" class="datepicker" name="startDt" placeholder="날짜를 선택해주세요." readonly></li>
                            <li>모임종료일자 <input type="text" class="datepicker" name="endDt" placeholder="날짜를 선택해주세요." readonly></li>
                            <li>모임모집시작일자 <input type="text" class="datepicker" name="recsDt" placeholder="날짜를 선택해주세요." readonly></li>
                            <li>모임모집종료일자 <input type="text" name="receDt" class="datepicker" placeholder="날짜를 선택해주세요." readonly></li>
                            <li>모집인원 <input type="text" name="recNo" placeholder="내용을 입력해주세요."></li>
                            <li>비용 <input type="checkbox" name="charge" value="N">무료 <input type="checkbox" name="charge" value="Y">유료</li>
                            <li>온오프라인유무 <input type="checkbox" name=onoff value="ON">온라인 <input type="checkbox" name="onoff" value="OFF">오프라인</li>
                            <li>모임장소<input type="text" name="place" placeholder="내용을 입력해주세요."></li>
                            <li>링크<input type="text" name="link" placeholder="대표 링크를 입력해주세요"></li> 
                        </ul>
                        <input type='hidden' name="cid2" value="RC002">
                        <input type='hidden' name="id" value="tony">
                        
                    </div>
                    <div class="bot right">
                        <div class="thumb title">썸네일</div>
                        <button value="첨부파일">첨부파일</button>
                        <div class="img"><img src="/resources/img/logo.png"></div>
                    </div>
                    
                </div>
                <div class="map" id="map" style="width:100%;height:500px;"></div>


                <button type="submit">모임 등록</button>
            </div>
        </div>
    </div>
  </form>
 
 
 
<script>
//datepicker
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

  $(function() {
      $("#datepicker1").datepicker();
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
				    });
				    setTimeout(function(){
					    $("form").submit();
				    },1000);
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

 </script>
</body>
</html>

<%@include file="../include/footer.jsp" %>