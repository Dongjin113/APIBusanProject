<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<style>

</style>
<script>
var path = '${pageContext.request.contextPath}';
function travelList(){
	
	location.href=path+"/travel.do";
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
<form action="<%=path%>/travelInsert.do" method=post enctype="multipart/form-data">
<table border=1>

<tr>
<td width="150" align=center>관광지 장소</td>
<td colspan=3 width=200><input type=text name=place size=50 ></td>
</tr>

<tr>
<td width="150" align=center>위도</td><td width=200><input type=text name=lat ></td>
<td width="150" align=center>경도</td><td width=200><input type=text name=lng ></td>
</tr>

<tr>
<td width="150" align=center>글제목</td><td colspan=3 width=200>
<input type=text name=title size=40 ></td>
</tr>

<tr>
<td width="150" align=center>한줄 소개글</td><td colspan=3 width=200>
<input type=text name=subtitle size=40 ></td>
</tr>

<tr>
<td width="150" align=center>장애인 접근 시설</td><td colspan=3 width=200>
<input type=text name=disabled size=40  ></td>
</tr>

<tr>
<td width="150" align=center>가격</td><td colspan=3 width=200>
<input type=text name=price size=40 ></td>
</tr>

<tr>
<td width="150" align=center>전화번호</td><td colspan=3 width=200>
<input type=text name=tel size=40 ></td>
</tr>

<tr>
<td width="150" align=center>대중교통으로 오는 길</td><td colspan=3 width=200>
<input type=text name=public_transport size=40  ></td>
</tr>


<tr>
<td width="150" align=center>관광지 소개글</td><td colspan=3 width=200>
<textarea name=introduce cols=60 rows=10 ></textarea></td>
</tr>

<tr>
<td width="150" align=center>휴일</td><td colspan=3 width=200>
<input type=text name=dayoff size=70 ></td>
</tr>

<tr>
<td width="150" align=center>영업시간</td><td colspan=3 width=200>
<input type=text name=business_hours size=70 ></td>
</tr>

<tr>
<td width="150" align=center >지역</td>
<td align=center width=50>
<select name=ward>
<c:forEach items="${li }" var="li">
<c:if test="${li.ward eq m.ward}">
<option value="${li.ward }" selected>${li.ward }</option>
</c:if>
<c:if test="${li.ward ne m.ward}">
<option value="${li.ward }">${li.ward }</option>
</c:if>
</c:forEach>
</select>
</td>

<td width="150" align=center >주소</td>
<td colspan=3><input type=text name=addr size=25 ></td>
</tr>

<tr>
<td width="150" align=center>홈페이지 주소</td>
<td colspan=3><input type=text name=homepage size=40 ></td>
</tr>

<tr><td width="150" align=center>사진</td><td colspan=3><input type=file name=imgFile></td></tr>


<tr><td colspan=4 align=center>
<input type=submit value="글쓰기">&emsp;<input type=button value="목록으로" onClick="travelList()">
</td></tr>
</table>
</form>
</div>
<br>
</section>


<%@ include file="../include/bottom.jsp" %>
