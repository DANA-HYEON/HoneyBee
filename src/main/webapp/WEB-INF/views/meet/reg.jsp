<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/meet/reigster.css">
</head>
<body>
<form role="form" action="/meet/reg" method="post">
    <div class="wrap">
        <div class="box">
            <div class="b top">
                <div class="top title">모임 개설</div>
                <div class="sub title">
                    <select class="cat" name='cid'>
                        <option>카테고리</option>
				        <c:forEach items="${category}" var="category">
				        	<option value="${category.CId}"><c:out value="${category.CName}"/></option>
				        </c:forEach>
                    </select>
                    <input type="text" name="title" value='<c:out value="${meet.mno}"/>' readonly="readonly">
                </div>
                <div class="content">
                	<textarea rows="1" placeholder="모임 요약내용을 입력해주세요." name="smry"></textarea>
                    <textarea rows="20" placeholder=" 내용을 입력해주세요." name="content"></textarea>
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
                            <li>모임시작일자 <input type="text" name="startDt" placeholder="내용을 입력해주세요."></li>
                            <li>모임종료일자 <input type="text" name="endDt" placeholder="내용을 입력해주세요."></li>
                            <li>모임모집시작일자 <input type="text" name="recsDt" placeholder="내용을 입력해주세요."></li>
                            <li>모임모집종료일자 <input type="text" name="receDt" placeholder="내용을 입력해주세요."></li>
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
                <div class="map"><input type="text" name="img" ></div>
                <button type="submit">모임 등록</button>
                <button type="reset">모임 등록</button>
            </div>
        </div>
    </div>
  </form>
</body>
</html>

<%@include file="../include/footer.jsp" %>