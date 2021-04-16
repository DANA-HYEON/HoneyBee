<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<style>
    .header{
        height: 130px;
        background-color: yellow;
    }

    .top {
        text-align : right;
    }

    .icon {
        padding: auto;
        height: 80px;
        width: 80px;
        float : right;
        vertical-align: baseline;
    }

    .menubar{
        text-align: left;
        font-size: x-large;
    }

</style>
<body>
    <!-- 검색창까지 있는 해더 시작 -->
    <div class="header">

        <!-- 우측 최상단 로그인 고객센터 연결-->
        <div class="top">
        <a href="login">로그인</a> <a href="console.log('고객센터로 연결')">고객센터</a><br>
        </div>

        <!-- 로고 -->
        <img src="/resources/img/honeybee2.PNG" height="80px" width="180px" align="left" onclick="location.href='/'">
            
        <!-- 가운데 검색창 -->
        <div style="text-align:center; display:block; margin: 0 auto;">
        <input type="text" id="input" placeholder="검색어를 입력해주세요."><button id=
        
        
        
        "searchButton" onclick="console.log('연결 필요')">돋보기</button>
        </div>
                
        <!-- 우측 마이페이지 알림 포인트샵 메뉴-->
        <div>
            <img class="icon" src="/resources/img/mypage.PNG"/> <a href=http://localhost:8080/mypage/home>
            <img class="icon" src="/resources/img/alram.PNG" onclick="console.log('클릭시 새알림 창으로 새페이지 띄워지지않고 연결')">
            <img class="icon" src="/resources/img/shop.PNG" onclick="console.log('포인트샵으로 연결')">
        </div>
    </div>
    <!-- 검색창까지 있는 해더 종료 -->

    <!--메뉴바 시작 -->
    <div class="menubar">
        <!-- <a href="console.log('클릭시 카테고리 출력')">카테고리</a> -->
        <select class="cat">
       	  <option>카테고리</option>
	      <option>스포츠</option>
	      <option>스터디/자기개발</option>
	      <option>독서/토론</option>
	      <option>게임</option>
	      <option>여행</option>
	      <option>문화/예술</option>
	      <option>봉사활동</option>
	      <option>패션/뷰티</option>
	      <option>반려동물</option>
	      <option>원데이클래스</option>
	     </select>
        <a href="console.log('클릭시 자유게시판으로 이동 연결')">자유게시판</a>
        <a href="console.log('클릭시 모임매칭으로 이동 연결')">모임매칭</a>
    </div>
</body>
</html>