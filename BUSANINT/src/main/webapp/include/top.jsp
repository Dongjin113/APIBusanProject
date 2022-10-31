<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %> 
<%
  String path = request.getContextPath();
  String id = (String) session.getAttribute("id");
  String name = (String) session.getAttribute("name");
  String role = (String) session.getAttribute("role");
%>   
<c:set var="id" value="${id}" />
<c:set var="role" value="${role}" />
<c:set var="bad" value="${GoodBadButton.bad}" />
<c:set var="good" value="${GoodBadButton.good }"/>
<c:set var="seq" value="${GoodBadButton.SEQ}"/>





<!DOCTYPE html>
<html>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
    $(document).ready(function () {
        $('.bxslider').bxSlider({
            auto: true, // 자동으로 애니메이션 시작
            speed: 500,  // 애니메이션 속도
            pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
            mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
            slideWidth: 1500,
			captions: true, // 이미지 위에 텍스트를 넣을 수 있음
            pager: true // 페이지 표시 보여짐
            
        });
    });
    

    var  id = '<%= (String) session.getAttribute("id") %>';
</script>

<style>
#header{
	height:20px;
	line-height:15px;
	font-style:oblique;
	font-weight: bolder;
	font-size: 25px;
}
section{
	min-height:550px;
	padding:20px;
}
.login.menu{
	text-align:right;
	background-color:white;
	width:95%;
}
.menu.main{
	height:40px;
	line-height: 40px;
	width:100%;
}


.tag{
	width:95%;
	color:#E5F255;
	font-style:oblique;
	background-color:#45436C;
	text-align:center;
	height:60px;
	line-height:30px;
	font-weight: bold;
	opacity: 0.5;
}

a:link, a:visited{
	color: black;
	text-decoration: none;
}

a.menu.nav:link, a.menu.nav:visited{
	color: black;
	text-decoration: none;
	font-weight: bold;
}
a.login.nav:link, a.login.nav:visited{
	color: black;
	text-decoration: none;
	font-weight: bold;
}

a:hover { 
	color:skyblue; 
}

</style>
<head>
<meta charset="utf-8">
<title>공공API를 사용한 부산여행 정보</title>
</head>
<header>
<div id=header>
<br>
&emsp;&emsp;<a href="start.jsp">공공API를 사용한 부산여행 정보</a> <br>
</div>
<nav class="login menu">
<% if(name==null){%>
<a href="login.jsp" class="login nav">로그인 </a> 
<% }else{%>

<a href="<%=path %>/myinfor.do?id=<%=id%>"><b><%=name %></b></a>님 환영합니다 &emsp;
&emsp;<a href="logout.do" class="login nav">로그아웃</a><br><br>
<%} %>

</nav>
</header>


<nav class="menu main">
&emsp;&emsp;
<%if(role==null||role.equals("일반회원")){ %>
&emsp;<a href="<%=path %>/index.do" class="menu nav">홈으로</a> 
&emsp;<a href="travel.do" class="menu nav">관광지 소개</a> 
&emsp;<a href="matjib.do" class="menu nav">맛집 소개</a> 
<%}else if(role.equals("관리자")){%>
&emsp;<a href="<%=path %>/index.do" class="menu nav">홈으로</a> 
&emsp;<a href="travel.do" class="menu nav">관광지 소개</a> 
&emsp;<a href="matjib.do" class="menu nav">맛집 소개</a> 
&emsp;<a href="member.do" class="menu nav">회원관리</a> 
&emsp;<a href="foodData.do" class="menu nav">맛집 Data 받아오기</a>
&emsp;<a href="travelData.do" class="menu nav">관광지 Data 받아오기</a>
<%} %>
<hr width=95%>
</nav>



<body>
