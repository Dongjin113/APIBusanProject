<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<style>

</style>


<section>
<div align=center>
<br><br>

<table>
<tr><td width="150" align=center colspan=4>
<c:if test="${m.SEQ le 150}">
<img src="${m.imgaddr}" alt="" title="이미지2" width=700 height=500 >
</c:if>
<c:if test="${m.SEQ gt 150}">
<img src="<%=path %>/FoodIMG/${m.imgaddr}" alt="" title="이미지2" width=700 height=500 >
</c:if>
</td></tr>
</table>

<form action="<%=path%>/UpdateMatjib.do" method=post enctype="multipart/form-data">
<input type=hidden name=SEQ id=SEQ value=${m.SEQ }>
<table border=1>
<tr height=30><td width="120" align=center>음식점 이름</td><td colspan=3 width=200>${m.main_title }</td></tr>
<tr height=30><td width="120" align=center>음식점 전화번호</td><td colspan=3 width=200>${m.tel }</td></tr>
<tr height=120><td width="120" align=center>음식점 소개글</td><td colspan=3 width=700>
${m.introduce }</td></tr>
<tr height=30><td width="120" align=center>영업시간</td><td colspan=3 width=200>${m.business_hours }</td></tr>

<tr height=30>
<td width="120" align=center >지역</td><td align=center width=100>${m.ward }</td>

<td width="120" align=center >주소</td><td colspan=3>${m.addr }</td>
</tr>

<tr height=30><td width="120" align=center>대표메뉴</td><td colspan=3>${m.menu }</td></tr>
<tr height=30><td colspan=4 align=center>

<input type=button value="목록으로" onClick="matjibList()">

</td>
</tr>
</table>
</form>
</div>
<br>
</section>

<script>
var path = '${pageContext.request.contextPath}';
function matjibList(){
	location.href=path+"/matjib.do";
}


</script>


<%@ include file="../include/bottom.jsp" %>
