<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	small {
		color: red;
		display: none;
	}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
<form role="form" action="/register" method="post">
<div class="must">
	<h2>필수정보</h2><p>
	
	<div class="id">
		아이디 <input type="text" name="id" placeholder="아이디를 입력해주세요">
		<button id="idCheck">중복 확인</button><br>
		<small>이미 존재하는 아이디입니다.</small>
		<small>5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</small>
	</div><p>
	
	<div class="pwd">
		비밀번호 <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
		<small>8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</small>
	</div><p>
	
	<div class="name">
		이름 <input type="text" name="name" placeholder="이름을 입력해주세요.">
	</div><p>
	
	<div class="sex">
		성별 <input type="radio" id="male" name="sex" value="1"><label for="male">남성</label>
		<input type="radio" id="female" name="sex" value="2"><label for="female">여성</label>
	</div><p>
	
	<div class="nick">
		닉네임 <input type="text" name="nick" placeholder="닉네임을 입력해주세요.">
		<button id="nickCheck">중복 확인</button>
	</div><p>
	
	<div class="birth">
		생년월일
		<select id="birthYear"></select>
		년
		<select id="birthMonth"></select>
		월
		<select id="birthDay"></select>
		일
		<input type='hidden' name='birth' value='19950812'>
	</div><p>
		
	<div class="email">
		이메일 <input type="text">@<input type="text">
		<select name="domain">
			<option selected="selected">이메일 선택</option>
			<option value="naver">naver.com</option>
			<option value="google">google.com</option>
			<option value="daum">daum.net</option>
			<option value="w">직접 입력하기</option>
		</select>
		<button id="emailCheck">이메일 중복 체크</button>
		<input type='hidden' name="email" value=''>
	</div><p>
	
	<div class="telno">
		휴대폰 번호 <input type="text" name='telno' value='' onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');">
	</div><p>
</div>

<div id="interest">
	<h2>관심정보</h2>
	
	관심 지역 <!-- select에서 클릭을 둘 다 하면 완성되어서 이 옆에 select가 옮겨가는 식으로? 아니면 단추가 생기는 식으로 옮겨간다.(팀원들에게 조언 구하기) --><br>
	지역
	<!-- 클릭하면 관심 지역이 추가되는 +버튼 -버튼도 있어야한다. -->
	<!-- <div id="locationAdd"> -->
	<button onclick="add()">+</button>
	
	<select id="location" onchange="addSelect(this)">
		<option>--도시를 선택해주세요--</option>
		<option value="0">서울특별시</option>
		<option value="1">경기도</option>
		<option value="2">대구광역시</option>
		<option value="3">인천광역시</option>
		<option value="4">광주광역시</option>
		<option value="5">대전광역시</option>
		<option value="6">울산광역시</option>
	</select>
	
	<select id="locationSub">
		<option>--지역구를 선택해주세요</option>
	</select>
	<br>
	
	관심지역은 최대 3개까지 설정 가능합니다.<br>
	
	<div id="hobbyBox">
	
	</div>
	<br>
	관심 주제 <!-- 관심 지역과 상황 동일/ 단 여기는 checkbox 이용으로 좀 더 쉬울 예정. --><br>
	모임<br>
	<!-- onclick hobby+숫자로 이루어져있어서 리팩토링 가능 -->
	<input type="checkbox" id="hobby0" value="교육" onclick="goHobbyBox('hobby0')"> 교육 <br>
	<input type="checkbox" id="hobby1" value="세미나/컨퍼런스" onclick="goHobbyBox('hobby1')"> 세미나/컨퍼런스 <br>
	<input type="checkbox" id="hobby2" value="강연" onclick="goHobbyBox('hobby2')"> 강연 <br>
	<input type="checkbox" id="hobby3" value="취미/소모임" onclick="goHobbyBox('hobby3')"> 취미/소모임 <br>
	<input type="checkbox" id="hobby4" value="문화/예술/방송" onclick="goHobbyBox('hobby4')"> 문화/예술/방송 <br>
	<input type="checkbox" id="hobby5" value="공모전" onclick="goHobbyBox('hobby5')"> 공모전 <br>
	<input type="checkbox" id="hobby6" value="전시/박람회" onclick="goHobbyBox('hobby6')"> 전시/박람회 <br>
	<input type="checkbox" id="hobby7" value="이벤트/파티" onclick="goHobbyBox('hobby7')"> 이벤트/파티 <br>
	<input type="checkbox" id="hobby8" value="패션/뷰티" onclick="goHobbyBox('hobby8')"> 패션/뷰티 <br>
	<input type="checkbox" id="hobby9" value="기타" onclick="goHobbyBox('hobby9')"> 기타 <br>
</div>
	
	<button type="reset" onclick="location.href='/'">취소</button>
	<button onclick="location.href='/tos'">다음</button>
	<button type="submit" id="regBtn">회원가입</button>
</form>
	
</body>

<!-- 아이디 -->
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#idCheck").on("click", function(e) {
			e.preventDefault();
			
			let check = '<c:out items="${check}" />';
			if (!check)
				$(".id small").css("display") = "block";
			
		});
		
	});
</script>

<!-- 생년월일 -->
<script>
	$(document).ready(function() {
		let today = new Date();
		let year = today.getFullYear();
		
		yearStr = "<option value=''>--</option>";
		monthStr = yearStr;
		dayStr = yearStr;
		
		let bYear = $("#birthYear");
		let bMonth = $("#birthMonth");
		let bDay = $("#birthDay");
		
		// 연도
		for (let i = year; i >= 1900 ; i--)
			yearStr += "<option value='" + i + "'>" + i + "</option>";
			
		// 월 (윤년 확인 -> 2월 29일까지.)
		for (let i = 1; i <= 12; i++)
			monthStr += "<option value='" + i + "'>" + i + "</option>";
			
		/* if (($("#birthYear option:selected").val() % 4 === 0) && ($("#birthMonth option:selected").val() === "2")) */
		
		// 일 (1, 3, 5, 7, 8, 10, 12월에는 31일까지, 다른 달은 30일까지, 윤달은 29일까지)
		for (let i = 1; i  <= 31; i++) {
			dayStr += "<option value='" + i + "'>" + i + "</option>";
		}
		
		$("#birthYear").html(yearStr);
		$("#birthMonth").html(monthStr);
		$("#birthDay").html(dayStr);
		
	});
</script>

	<!-- 관심 주제 checkbox이벤트 시작 -->
	<script>
		function goHobbyBox(id){
			let btn = document.getElementById(id);
			let content = document.createElement("button");
			let target = document.getElementById("hobbyBox");
			
			content.id = id;
			content.innerHTML = btn.value;
			content.onclick = remove(id);
			target.appendChild(content);
		}
		function remove(){
			
		}
	</script>

	<!-- 시군구 추가 메서드 2개 시작 -->
	<script>
	// 현재 문제점 : 시도 셀렉트 창을 선택시, 1:1 대응으로 군구 셀렉트 창이 대응되지 않는다.
	// 현재 단추는 제대로 인식함.
	// 그리고 3개까지 설정해야하는데 3개까지 설정 못함.
	function add(){
			let id = document.getElementById("locationAdd");
				id.innerHTML += "<button onclick='add()'>+</button>	<select id='location' onchange='addSelect(this)'>" +
								"<option>--도시를 선택해주세요--</option>" +
								"<option value='1'>서울특별시</option>"+
								"<option value='2'>경기도</option>"+
								"<option value='3'>대구광역시</option>"+
								"<option value='4'>인천광역시</option>"+
								"<option value='5'>광주광역시</option>"+
								"<option value='6'>대전광역시</option>"+
								"<option value='7'>울산광역시</option>"+
								"</select> <select id='locationSub'><option>--지역구를 선택해주세요</option></select><br>";
		
	}
	
	function addSelect(e){
		let city = new Array(["서울0","서울2","서울3"], ["경기1","경기2","경기3"], ["대구2","대구2","대구3"], ["인천3","인천2","인천3"],
					["광주4","광주2","광주3"], ["대전5","대전2","대전3"], ["울산6","울산2","울산3"]);

		let target = document.getElementById("locationSub");
		var select = city[(e.value)*1];
		
		target.options.length = 0;
		
		for(var x in select){
			let opt = document.createElement("option");
			opt.value = select[x];
			opt.innerHTML = select[x];
			target.appendChild(opt);
		}
	}
	</script>
	<!-- 시군구 추가 메서드 2개 종료 -->
	
</html>
<%@include file="include/footer.jsp" %>