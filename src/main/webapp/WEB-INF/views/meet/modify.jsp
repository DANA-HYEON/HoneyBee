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
 <!-- kakao map api -->
 <!-- services 라이브러리 불러오기 -->
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ed5d0df10f1c229f2d8ea4a01f8f665&libraries=services,clusterer,drawing"></script>
  <!-- 제이쿼리 ui css -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <!--제이쿼리 js-->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!--제이쿼리 ui js-->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <!-- timepicker -->
 <script type="text/javascript" src="/resources/timepicker/jquery.timepicker.js"></script>
 <link rel="stylesheet" href="/resources/timepicker/jquery.timepicker.css">
 
 <!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</head>
<body>
<form name="frm" role="form" action="/meet/modify" method="post">
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
                        <li class="btn"><input type="file" name="uploadFile2" multiple>첨부파일</li>
                    </ul>
                </div>
            </div>

            <div class="b bottom">
                <div class="bottom title">모임 상세</div>
                <div class="bottom_box">
                    <div class="bot left">
                        <ul class="bottom_content">
                            <li>모임모집시작일자 <input type="text" class="datepicker" name="recsDt" value='<c:out value="${meet.recsDt}"/>' readonly><input class="platanusTime" name="recsDt2"  readonly/></li>
                            <li>모임모집종료일자 <input type="text" class="datepicker" name="receDt" value='<c:out value="${meet.receDt}"/>' readonly><input class="platanusTime" name="receDt2" readonly/></li>
                        	<li>모임시작일자 <input type="text" class="datepicker" name="startDt" value='<c:out value="${meet.startDt}"/>' readonly><input class="platanusTime" name="startDt2" value='<c:out value="${meet.startDt}"/>' readonly/></li>
                            <li>모임종료일자 <input type="text" class="datepicker"  name="endDt" value='<c:out value="${meet.endDt}"/>' readonly><input class="platanusTime" name="endDt2"  readonly/></li>
                            <li>모집인원 <input type="text" id="recNo" name="recNo" value='<c:out value="${meet.recNo}"/>'></li>
                            <li>비용 <input id="free" type="radio" name="charge" value="N">무료<input id="charge" type="radio" name="charge" value="Y" >유료</li>
                            <li>온오프라인유무 <input id="ON" type="radio" name=onoff value="ON">온라인<input id="OFF" type="radio" name="onoff" value="OFF">오프라인</li>
                            <!-- <li>모임장소<input type="text" name="place" value='<c:out value="${meet.place}"/>' style="display:inline-block;"></li> -->
                            <li>링크<input type="text" name="link" value='<c:out value="${meet.link}"/>'></li>
                        </ul>


                        <!-- 하드코딩 -->
                        <input type='hidden' name="cid2" value="RC002">
                        <input type='hidden' name="id" value="tony">

                    </div>
                    <div class="bot right">
                        <div class="thumb title">썸네일</div>
                        <!-- modal -->
                        <!-- <div id="uploadDiv" class="modal">
							<input type="file" name="uploadFile">
							<button id='uploadBtn'>업로드 하기</button>
						</div>


                        <p><a href="#uploadDiv" rel="modal:open">사진 업로드</a></p> -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						  사진 업로드
						</button>
						
						
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="staticBackdropLabel">썸네일 업로드</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <input type="file" name="uploadFile">
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="button" id='uploadBtn' class="btn btn-primary">업로드 하기</button>
						      </div>
						    </div>
						  </div>
						</div> 
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

                <div><strong>모임 장소</strong></div>
                <div class="input-group mb-3">
				  <button class="btn btn-outline-secondary" type="button" id="button-addon1"><strong>도로명 주소</strong></button>
				  <input type="text" class="form-control" name="place" placeholder="아래 지도 리스트에서 선택해주세요." aria-label="Example text with button addon" aria-describedby="button-addon1">
				</div>
				<div class="input-group mb-3">
				  <button class="btn btn-outline-secondary" type="button" id="button-addon1"><strong>상세 주소</strong></button>
				  <input type="text" class="form-control" name="placeDetail" placeholder="상세 주소를 수기입력해주세요." aria-label="Example text with button addon" aria-describedby="button-addon1">
				</div>
                
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <!-- <form onsubmit="searchPlaces(); return false;"> -->
				                    키워드 : <input type="text" value="${meet.place}" id="keyword" size="15"> 
				                    <button name="mapSubmit" onclick="searchPlaces(); return false;">검색하기</button> 
				                <!-- </form> -->
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>

                <button type="submit" data-oper='modify'>수정 완료</button>
                <button type="reset" data-oper='delete'>모임 삭제</button>
                <button type="submit" data-oper='list'>목록으로</button>

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
	
	var mainAddress = "${meet.place}";
	var mainAddress = mainAddress.split(", ");

	$('input[name=startDt]').val(startDt[0]);
	$('input[name=startDt2]').val(startDt[1]);

	$('input[name=endDt]').val(endDt[0]);
	$('input[name=endDt2]').val(endDt[1]);

	$('input[name=recsDt]').val(recsDt[0]);
	$('input[name=recsDt2]').val(recsDt[1]);

	$('input[name=receDt]').val(receDt[0]);
	$('input[name=receDt2]').val(receDt[1]);
	
	$('input[name=place]').val(mainAddress[0]);
	$('input[name=placeDetail]').val(mainAddress[1]);
	$('#keyword').val(mainAddress[0]);	
});
</script>

<script>
//모임장소 width 자동 설정
/*$(document).ready(function(){
	var length = "${meet.place}".length;
	console.log("length" + length);
	
	$("input[name=place]").css("width", 15 + length * 15);
	
}); */
</script>


<script>
//모집인원 유효성 검사
$('#recNo').on('keyup', function fn_nickChk() {
      var str = $('#recNo').val();
      var num_pattern = /^[0-9]*$/;
      
      
      if(str.search(num_pattern) == -1){
     	 alert("숫자만 입력할 수 있습니다.");
     	 $('#recNo').val(str.replace(/[^0-9+]/g,""));
      }
      
      if(str.length > 4){
     	 $('#recNo').val(str.substring(0,4));
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
	    $(".datepicker").datepicker();
	  });

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
$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");

		//모임 날짜 유효성검사
		var recsDt = $('input[name=recsDt]').val() +  $('input[name=recsDt2]').val();
		var receDt = $('input[name=receDt]').val() +  $('input[name=receDt2]').val();
		var startDt = $('input[name=startDt]').val() +  $('input[name=startDt2]').val();
		var endDt = $('input[name=endDt]').val() +  $('input[name=endDt2]').val();
		
 		function Checkform(){			
			
			//모임모집시작일자
			recsDt = checkDate(recsDt);
			//모임모집종료일자
			receDt = checkDate(receDt);
			//모임시작일자
			startDt = checkDate(startDt);
			//모임종료일자
			endDt = checkDate(endDt);
			
			//날짜를 숫자로 바꾸는 메서드
			function checkDate(text){
				var textNum = text.toString().replaceAll(/[^0-9]/g,"");
				var textInt = parseInt(textNum);
				console.log("결과 : " + textInt);
				return textInt;
			}
			
			if(!(recsDt <= receDt)){
				swal("모임모집종료일자는 모임모집시작일자보다 이전일 수 없습니다.");
				return false;
			}
			
			if(!(receDt <= startDt)){
				swal("모임 시작일자가 모임모집종료일자보다 이전일 수 없습니다.");
				return false;
			}
			
			if(!(startDt <= endDt)){
				swal("모임종료일자가 모임시작일자보다 이전일 수 없습니다.");
				return false;
			}
				
 			//필수 입력값 유효성검사
			/* var elements = document.frm.getElementsByTagName("input");
			for (var i = 0; i < elements.length; i++){
					if(elements[i].value == ""){
 						$("#errormsg").fadeIn().text("Error").css("color", "red");
						alert("필수 입력값이 부족합니다.");
						
						elements[i].focus();
						console.log(elements[i].name);
						$("input[name="+elements[i].name+"]").css("box-shadow","0px 0px 10px #000");
						
						return false;
					}
				}
			return true; */
			return true;
		} 

 	  if(Checkform()){
		 swal({
			  title: "정말 모임을 수정하시겠습니까?",
			  text: "잘못 입력한 부분은 없는지 확인해주세요!",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willDelete) => {
			  if (willDelete) {
					oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
				
				    swal("게시물 수정이 완료되었습니다!", {
				      icon: "success",
				    }).then((willDelete)=>{
				    	//날짜 date, time 값 합쳐서 보내기
						var totalstartDt = $('input[name=startDt]').val() + " " +  $('input[name=startDt2]').val()
						var totalendDt = $('input[name=endDt]').val() + " " +  $('input[name=endDt2]').val()
						var totalrecsDt = $('input[name=recsDt]').val() + " " +  $('input[name=recsDt2]').val()
						var totareceDt = $('input[name=receDt]').val() + " " +  $('input[name=receDt2]').val()
						
						var place = $('input[name=place]').val() + ", " + $('input[name=placeDetail]').val();
						
						$('input[name=startDt]').val(totalstartDt);
						$('input[name=endDt]').val(totalendDt);
						$('input[name=recsDt]').val(totalrecsDt);
						$('input[name=receDt]').val(totareceDt);
						$('input[name=place]').val(place);
						
						//현재날짜 추출
			 			var date = new Date();
					    var year = date.getFullYear();
					    var month = ("0" + (1 + date.getMonth())).slice(-2);
					    var day = ("0" + date.getDate()).slice(-2);
					    var hour = date.getHours();
				        hour = hour < 10 ? '0' + hour.toString() : hour.toString();
				        var minites = date.getMinutes();
				        minites = minites < 10 ? '0' + minites.toString() : minites.toString();
				        
					    var currDt = parseInt(year + month + day + hour + minites);
					    
			 			console.log("오늘 날짜 " + currDt);
			 			
			 			//현재 날짜 < 모임모집시작일자 : 모집대기
			 			if(currDt < recsDt){
			 				$('input[name=cid2]').val("RC001");
			 			}
			 			
			 			//모임모집시작일자 <= 현재날짜 : 모집중
			 			if(recsDt <= currDt){
			 				$('input[name=cid2]').val("RC002");
			 			}
			 			
			 			//모임모집종료일자 < 현재일자 || 모임종료일자 < 현재일자 : 모집완료
			 			if(receDt < currDt || endDt < currDt){
			 				$('input[name=cid2]').val("RC003");
			 			}
			 			
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

			 if(operation === 'delete'){
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
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//카카오 주소 검색 결과를 담는 배열
var kakaoAddressData = [];

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    ps.keywordSearch( keyword, placesSearchCB);
    
    
     $.ajax({
        url:'https://dapi.kakao.com/v2/local/search/address.json?query='+ encodeURIComponent(keyword),
        headers: {'Authorization' : 'KakaoAK 00688f553c2ee44b7665781229f621c5'},
        type:'GET',
     }).done(function(data){
    	 kakaoAddressData = data;
         displayPlaces(data.documents);
         displayPagination(data.documents.length);
         if(data.documents.length == 0){
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
         }
     }); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
 function placesSearchCB(data, status, pagination) {
	
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT && kakaoAddressData == null) {
    	 
        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
} 

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	//리스트 ul영역
    var listEl = document.getElementById('placesList'), 
  	//리스트 div영역
    menuEl = document.getElementById('menu_wrap'),
  	//다른 노드를 담는 임시 컨테이너 역할을 하는 특수 목적의 노드(가상의 노드 객체)
    fragment = document.createDocumentFragment(), 
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
       	// 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].address_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
 
 if(places.address != null){
	 console.log("1");
	 var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>';
	               

	    if(places.road_address != null) {
	    	itemStr +=  '<div class="info">' +'<h5>' + places.road_address.building_name + '</h5>';
	        itemStr += '    <span>' + places.road_address.address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address.address_name + '</span>';
	      	itemStr += '  <span class="tel">' + places.road_address.zone_no  + '</span>' +
	                	'</div>';           
	    } else {
	    	itemStr +=  '<div class="info">' +'   <h5>' + places.address.address_name + '</h5>';
	        //itemStr += '   <span class="jibun gray">' +  places.address.address_name + '</span>';
	    }
	                 

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	    //return fragment.appendChild(el);
 }else if(places.address == null){
	 console.log("2");
	 var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' + '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';                      
	 
	     el.innerHTML = itemStr;
	     el.className = 'item';
	 
	     //return fragment.appendChild(el);
	     return el;
	 }/* else{
		 console.log("3");
		 var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>';
		               

		    	itemStr +=  '<div class="info">' +'   <h5>' + places.address_name + '</h5>';
		        //itemStr += '   <span class="jibun gray">' +  places.address.address_name + '</span>';
		    
		 
		     el.innerHTML = itemStr;
		     el.className = 'item';
		 
		     //return fragment.appendChild(el);
		     return el;
	 } */
 }

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
 function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
} 

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
 $(document).on("click", "#placesList li", function(e){
	 console.log($(this).find('span')[1].innerText);
	 var place = $(this).find('span')[1].innerText;
	 $("input[name='place']").val(place);
 });
</script>
 
<script>
 //썸네일 사진 업로드
 $(document).ready(function() {
	 //이미지 수정 업로드 하지 않을 경우 기존 값을 그대로 유지
	console.log("img :" + "${meet.img}");
	$('input[name=img]').val("${meet.img}");
	 
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
