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
<tr><td width="150" align=center>음식점 이름</td><td colspan=3 width=200><input type=text name=main_title size=50 value="${m.main_title }"></td></tr>
<tr><td width="150" align=center>위도</td><td width=200><input type=text name=lat value="${m.lat }"></td>
<td width="150" align=center>경도</td><td width=200><input type=text name=lng value="${m.lng }"></td></tr>
<tr><td width="150" align=center>음식점 전화번호</td><td colspan=3 width=200><input type=text name=tel size=40 value="${m.tel }" ></td></tr>
<tr><td width="150" align=center>음식점 소개글</td><td colspan=3 width=200>
<textarea name=introduce cols=60 rows=10 >${m.introduce }</textarea></td></tr>
<tr><td width="150" align=center>영업시간</td><td colspan=3 width=200><input type=text name=business_hours size=70 value="${m.business_hours }"></td></tr>

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

<td width="150" align=center >주소</td><td colspan=3><input type=text name=addr size=25 value="${m.addr }"></td>
</tr>

<tr><td width="150" align=center>대표메뉴</td><td colspan=3><input type=text name=menu size=40 value="${m.menu }"></td></tr>
<tr><td width="150" align=center>사진</td><td colspan=3><input type=file name=imgFile ></td></tr>
<tr><td colspan=4 align=center>
<input type=submit value="수정하기">&emsp;
<input type=button value="삭제하기" onClick="delFood()">&emsp;
<input type=button value="목록으로" onClick="matjibList()"></td></tr>
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
function delFood(){
	location.href=path+"/delFood.do?SEQ=" +$('#SEQ').val() ; 
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


<%@ include file="../include/bottom.jsp" %>
