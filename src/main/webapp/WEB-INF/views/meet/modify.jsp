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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<form role="form" action="/meet/modify" method="post">
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
                    
                    
                    <input type="hidden" name="mno" value='<c:out value="${meet.mno}"/>'>
                    <input type="text" name="title" value='<c:out value="${meet.title}"/>'>
                </div>
                <div class="content">
                	<textarea rows="1"  name="smry"><c:out value="${meet.smry}"/></textarea>
                    <textarea rows="20" name="content"><c:out value="${meet.content}"/></textarea>
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
                            <li>모임시작일자 <input type="text" name="startDt" value='<c:out value="${meet.startDt}"/>'></li>
                            <li>모임종료일자 <input type="text" name="endDt" value='<c:out value="${meet.endDt}"/>'></li>
                            <li>모임모집시작일자 <input type="text" name="recsDt" value='<c:out value="${meet.recsDt}"/>'></li>
                            <li>모임모집종료일자 <input type="text" name="receDt" value='<c:out value="${meet.receDt}"/>'></li>
                            <li>모집인원 <input type="text" name="recNo" value='<c:out value="${meet.recNo}"/>'></li>
                            
                            
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
                        <button value="첨부파일">첨부파일</button>
                        <div class="img"><img src="/resources/img/logo.png"></div>
                    </div>
                    
                </div>
                <div class="map"><input type="text" name="img" value='<c:out value="${meet.img}"/>'></div>
                
                <button type="submit" data-oper='modfy'>모임 수정</button>
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

			 }
			 
			 formObj.submit();
		 });
		 
		 
		/* 카테코리 선택 검색 후 카테고리 유지 */
		 
		  console.log("${pickedCat}");
		
		 var pickedCat = "${pickedCat}";
		  if(pickedCat.length >= 1){
			 pickedCat = pickedCat[1];
		 } 
		 
		
		 $(".cat").val(pickedCat).prop("selected",true);
	 });
 </script>