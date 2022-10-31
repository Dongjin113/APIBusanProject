<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %> 
<%
  String path = request.getContextPath();
%>   
<!DOCTYPE html>
<html>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style>

section{
	min-height:1000px;
	margin:auto;
}

.background{
  background: url("<%=path%>/img/배경최종.png");
  background-repeat:no-repeat;
  background-size: contain;
  position:relative;
  opacity: 0.75;
  margin:auto;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.tag{
width:100%;
	color:#E5F255;
	font-style:oblique;
	background-color:#45436C;
	text-align:center;
	height:60px;
	line-height:30px;
	font-weight: bold;
	opacity: 0.5;
	position:absolute;
	z-index: 3;
}

a:hover { 
	color:skyblue; 
}

.title{
	height:30px;
	line-height:30px;
	color:white;
	font-style:oblique;
	font-weight: bolder;
	font-size: 40px;
	position:absolute;
	z-index: 2;
}
</style>
<head>
<body>
<meta charset="UTF-8">
<nav>
<div class="tag">
#서구 &emsp;#사하구 &emsp;#강서구 &emsp;#동래구 &emsp;#동구 &emsp;#북구 &emsp;#사상구 &emsp;#영도구 &emsp; <br>
#금정구 &emsp;#수영구 &emsp;#해운대구 &emsp;#기장군 &emsp;#연제구 &emsp;#중구 &emsp;#남구 &emsp;#부산진구
</div>
</nav>
</head>
<div class="item background">






<section>

<br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br>
<div class="title">
<a href="<%=path %>/index.do">공공API를 사용한 부산여행 정보</a>
</div>

</section>


</div>

</body> 
</html>