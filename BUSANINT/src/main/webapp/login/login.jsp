<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<script>
var  str = '<%= (String) session.getAttribute("sw") %>';

if (str=="F"){
	 alert("아이디와 패스워드를 확인해주세요");

	 location.href="resetsessionid.do";
} 


function joinK(){
	location.href="join.do";
}    
    
function ck(){
	if(f1.id.value==""){
		alert("아이디를 입력해주세요");
		f1.id.focus();
		return false;
	}else if(f1.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		f1.pwd.focus();
		return false;
	}
}
</script>
    

<section>
<br>
<div align=center>
<br><br><br><br><br>
<div align=center style="font-size:40px">
홈페이지 로그인
</div>
<br><br>
<form action="<%=path %>/login.do" onSubmit="return ck()" name=f1 method=post>
<table border=1  >
<tr><td width=300px>

<div align=center>
일반계정 <br>
Id =test1234 <br>
pwd=1111 
</div>
<div align=center>
<input type=text name=id style="width:300px;height:30px" placeholder="ID를 입력해주세요" value="admin"><br>

<div style="line-height:40%"><br></div>

<input type=password name=pwd style="width:300px;height:30px" placeholder="PASSWORD를 입력해주세요" value="1234"><br>
<br>
<input type=submit value="로그인">

<input type="button" onclick="joinK()" value="회원가입">

<div style="line-height:40%"><br></div>
</div>
</td></tr>
</table>
</form>
</div>





</section>


<%@ include file="../include/bottom.jsp" %>
