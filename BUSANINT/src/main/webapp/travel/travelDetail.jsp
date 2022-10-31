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
<c:if test="${m.SEQ le 120}">
<img src="${m.imgaddr}" alt="" title="이미지2" width=700 height=500 >
</c:if>
<c:if test="${m.SEQ gt 120}">
<img src="<%=path %>/img/${m.imgaddr}" alt="" title="이미지2" width=700 height=500 >
</c:if>
</td></tr>
</table>

<form action="<%=path%>/UpdateTravel.do" method=post enctype="multipart/form-data">
<input type=hidden name=SEQ id=SEQ value=${m.SEQ }>
<table border=1>
<tr height=50><td width="120" align=center>관광지 장소</td><td colspan=3 width=200>${m.place }</td></tr>
<tr height=50><td width="120" align=center>글제목</td><td colspan=3 width=200>${m.title }</td></tr>
<tr height=50><td width="120" align=center>한줄 소개글</td><td colspan=3 width=700>
${m.subtitle }</td></tr>

<tr height=50><td width="120" align=center>장애인 접근 시설</td><td colspan=3 width=200>${m.disabled }</td></tr>

<tr height=50>
<td width="120" align=center >가격</td><td align=center width=500>${m.price}</td>

<td width="120" align=center >전화번호</td><td colspan=3>${m.tel}</td>
</tr>

<tr height=60><td width="120" align=center >대중교통으로 오는 길</td><td colspan=3>${m.public_transport }</td></tr>
<tr height=500><td width="120" align=center>소개글</td><td colspan=3>${m.introduce}</td></tr>
<tr height=50><td width="120" align=center>휴일</td><td colspan=3>${m.dayoff }</td></tr>
<tr height=50><td width="120" align=center>영업시간</td><td colspan=3>${m.business_hours}</td></tr>
<tr height=50><td width="120" align=center>지역</td><td >${m.ward}</td><td width="120" align=center>주소</td><td colspan=3>${m.addr}</td></tr>
<tr height=50><td width="120" align=center>홈페이지 주소</td><td colspan=3><a href="${m.homepage}">${m.homepage}</a></td></tr>
<tr height=50><td colspan=4 align=center>

<input type=button value="목록으로" onClick="travelList()">

</td>
</tr>
</table>
</form>
</div>
<br>
</section>

<script>
var path = '${pageContext.request.contextPath}';
function travelList(){
	location.href=path+"/travel.do";
}


</script>


<%@ include file="../include/bottom.jsp" %>
