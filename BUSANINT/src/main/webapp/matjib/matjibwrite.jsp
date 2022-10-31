<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<style>

</style>
<script>
var path = '${pageContext.request.contextPath}';
function matjibList(){
	
	location.href=path+"/matjib.do";
}

$(document).ready(function(){
	$("input[name=lat]").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40) ) {
			var inputVal = $(this).val();    
		$(this).val(inputVal.replace(/[^\.|^0(0)+|^0-9\.]/g, ''));
		}  
	});
});

$(document).ready(function(){
	$("input[name=lng]").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40) ) {
			var inputVal = $(this).val();    
		$(this).val(inputVal.replace(/[^\.|^0(0)+|^0-9\.]/g, ''));
		}  
	});
});

</script>

<section>
<div align=center>
<form action="<%=path%>/matjibInsert.do" method=post enctype="multipart/form-data">
<table border=1>
<tr><td width="150" align=center>음식점 이름</td><td colspan=3 width=200><input type=text name=main_title size=50></td></tr>
<tr><td colspan=4 align=center>위도와 경도를 입력해야 지도에 위치가 나옵니다 </td></tr>
<tr><td width="150" align=center>위도</td><td width=200><input type=text name=lat></td>
<td width="150" align=center>경도</td><td width=200><input type=text name=lng></td></tr>
<tr><td width="150" align=center>음식점 전화번호</td><td colspan=3 width=200><input type=text name=tel size=40 maxlength="20"></td></tr>
<tr><td width="150" align=center>음식점 소개글</td><td colspan=3 width=200>
<textarea name=introduce cols=60 rows=10></textarea></td></tr>
<tr><td width="150" align=center>영업시간</td><td colspan=3 width=200><input type=text name=business_hours size=70></td></tr>

<tr>
<td width="150" align=center>지역</td>

<td align=center width=50>
<select name=ward>
<c:forEach items="${li }" var="m">
<option value="${m.ward }">${m.ward }</option>
</c:forEach>
</select>
</td>

<td width="150" align=center >주소</td><td colspan=3><input type=text name=addr size=25></td>
</tr>

<tr><td width="150" align=center>대표메뉴</td><td colspan=3><input type=text name=menu size=40></td></tr>
<tr><td width="150" align=center>사진</td><td colspan=3><input type=file name=imgFile></td></tr>
<tr><td colspan=4 align=center><input type=submit value="글쓰기">&emsp;<input type=button value="목록으로" onClick="matjibList()"></td></tr>
</table>
</form>
</div>
<br>
</section>


<%@ include file="../include/bottom.jsp" %>
