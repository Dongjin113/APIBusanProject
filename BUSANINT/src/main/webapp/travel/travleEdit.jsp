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
<img src="<%=path %>/TravelIMG/${m.imgaddr}" alt="" title="이미지2" width=700 height=500 >
</c:if>
</td></tr>
</table>

<form action="<%=path%>/UpdateTravel.do" method=post enctype="multipart/form-data">
<input type=hidden name=SEQ id=SEQ value=${m.SEQ }>
<table border=1>

<tr>
<td width="150" align=center>관광지 장소</td>
<td colspan=3 width=200><input type=text name=place size=70 value="${m.place }"></td>
</tr>

<tr>
<td width="150" align=center>위도</td><td width=200><input type=text name=lat value="${m.lat }"></td>
<td width="150" align=center>경도</td><td width=200><input type=text name=lng value="${m.lng }"></td>
</tr>

<tr>
<td width="150" align=center>글제목</td><td colspan=3 width=200>
<input type=text name=title size=100 value="${m.title }" ></td>
</tr>

<tr>
<td width="150" align=center>한줄 소개글</td><td colspan=3 width=200>
<input type=text name=subtitle size=100 value="${m.subtitle }" ></td>
</tr>

<tr>
<td width="150" align=center>장애인 접근 시설</td><td colspan=3 width=200>
<input type=text name=disabled size=100 value="${m.disabled }" ></td>
</tr>

<tr>
<td width="150" align=center>가격</td><td colspan=3 width=200>
<input type=text name=price size=100 value="${m.price }" ></td>
</tr>

<tr>
<td width="150" align=center>전화번호</td><td colspan=3 width=200>
<input type=text name=tel size=80 value="${m.tel }" ></td>
</tr>

<tr>
<td width="150" align=center>대중교통으로 오는 길</td><td colspan=3 width=200>
<input type=text name=public_transport size=100 value="${m.public_transport }" ></td>
</tr>


<tr>
<td width="150" align=center>관광지 소개글</td><td colspan=3 width=200>
<textarea name=introduce cols=80 rows=30 >${m.introduce }</textarea></td>
</tr>

<tr>
<td width="150" align=center>휴일</td><td colspan=3 width=200>
<input type=text name=dayoff size=70 value="${m.dayoff }"></td>
</tr>

<tr>
<td width="150" align=center>영업시간</td><td colspan=3 width=200>
<input type=text name=business_hours size=70 value="${m.business_hours }"></td>
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
<td colspan=3><input type=text name=addr size=25 value="${m.addr }"></td>
</tr>

<tr>
<td width="150" align=center>홈페이지 주소</td>
<td colspan=3><input type=text name=homepage size=40 value="${m.homepage }"></td>
</tr>

<tr><td width="150" align=center>사진</td><td colspan=3><input type=file name=imgFile ></td></tr>

<tr>
<td colspan=4 align=center>
<input type=submit value="수정하기">&emsp;
<input type=button value="삭제하기" onClick="deltravel()">&emsp;
<input type=button value="목록으로" onClick="travelList()"></td></tr>
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

function deltravel(){
	location.href=path+"/deltravel.do?SEQ=" +$('#SEQ').val() ; 
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
