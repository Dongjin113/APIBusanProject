<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<style>
section{
width:95%;
}
.introduce{
padding:20px;
}
#matjibwrite{
padding-right:60px;
}
a.introduce.div:link, a.introduce.div:visited{
	
	color: black;
	text-decoration: none;
	font-weight: bold;
}
#GoodBad{
text-align:right;
}

</style>

<script>
var path = '${pageContext.request.contextPath}';
	function matjibWrite(){
		
		location.href=path+"/matjibwrite.do";
	}
	
</script>




<section>
<div align=center>

<div class="tag" align=center>
<c:forEach  items="${wd}"  var="wd" varStatus="status">

<c:url  value="matjib.do"  var="url">
    <c:param name="startIdx"  value="1"   />
    <c:param name="searchCondition"  value="ward"   />
    <c:param name="searchKeyword"  value="${wd.ward }"   />
  </c:url>
  
<a style='text-decoration:none' href="${url }" >#${wd.ward } &emsp;</a>

<c:if test="${status.count eq 8}"> <br></c:if>

</c:forEach>
</div>

<br>


<table>
<tr><td colspan=2> <div align=left style="font-size:20px"><b>&emsp;&emsp;맛집소개</b> 

<div align=right>
<form action="<%=path%>/matjib.do"> 

<select name= searchCondition>

<option value="main_title">가게명</option>
<option value="menu">메뉴</option>
<option value="ward">지역</option>


</select>


<input type=text name="searchKeyword" >
<input type=submit value="찾기">
</form>
</div>

</div>
<div style="line-height:20%"><br></div></td></tr>
<c:forEach  items="${li}"  var="m"  varStatus="status" >
<tr><td colspan=2>
<hr width=1100></td></tr>

<tr>

   
<td>
<%if(role == null || role.equals("일반회원")){ %>
<c:url  value="matjibdetail.do"  var="url">
<c:param name="SEQ"  value="${m.SEQ}"   />
<c:param name="id" value="${id}"/>
</c:url>
    
<c:if test="${m.SEQ le 150}">
<a href="${url }"><img src="${m.imgaddr}" alt="" title="이미지2" width=300 height=200 align="left"></a>
</c:if>

<c:if test="${m.SEQ gt 150}">
<a href="${url }"><img src="<%=path %>/FoodIMG/${m.imgaddr}" alt="" title="이미지2" width=300 height=200 align="left"></a>
</c:if>

<%}else if(role.equals("관리자")){ %>
<c:url  value="matjibEdit.do"  var="url">
<c:param name="SEQ"  value="${m.SEQ}"   />
</c:url>

<c:if test="${m.SEQ le 150}">
<a href="${url }"><img src="${m.imgaddr}" alt="" title="이미지2" width=300 height=200 align="left"></a>
</c:if>

<c:if test="${m.SEQ gt 150}">
<a href="${url }"><img src="<%=path %>/FoodIMG/${m.imgaddr}" alt="" title="이미지2" width=300 height=200 align="left"></a>
</c:if>

<%}%>
</td>

<td width=800>
<div class=introduce>
<a href="${url }">
<div style="font-size:20px" >
<b>${m.main_title}</b>
</div>

<div style="line-height:40%"><br>
<div style="font-size:15px">
${m.menu}
</div>
<br><br>
</div>

${m.introduce}  <br>

<div style="line-height:40%"><br></div>
<b>지역 : </b> ${m.ward}&emsp;
<b>주소 : </b>${m.addr} &emsp;
<b>tel : </b>${m.tel} <br>
<div style="line-height:20%"><br></div>
<b>영업시간 : </b>${m.business_hours}
</a>
<div align=right>
<br>조회수 : ${m.cnt }
</div>
</div>


</div>
</td>

</tr>
</c:forEach>

<tr><td colspan=2 align=right>
<hr width=1100>


<%if(role == null || role.equals("일반회원")){ %>
<%}else if(role.equals("관리자")){ %>
<div id="matjibwrite"><input type="button" value="글쓰기" onClick="matjibWrite()"></div>
<%}%>
</td>
</tr>

</table>

<br>

  <c:url  value="matjib.do"  var="url">
    <c:param name="startIdx"  value="1"   />
    <c:param name="searchCondition"  value="${searchCondition}"   />
    <c:param name="searchKeyword"  value="${searchKeyword}"   />
  </c:url>
 
 	<c:if test="${startIdx > 1 }">
  	<a href="${url}" >처음으로</a> &emsp;
	</c:if>
	
   	<c:if test="${startIdx <= 1 }">
  	처음으로 &emsp;
	</c:if>
   
   
  <c:if test="${startIdx > 1 }">
  
    <c:url  value="matjib.do"  var="url">
      <c:param name="startIdx"  value="${startIdx-5}"   />
      <c:param name="searchCondition"  value="${searchCondition}"   />
      <c:param name="searchKeyword"  value="${searchKeyword}"   />
    </c:url>
    <a href="${url}"> 이전 </a> &emsp;
  
  </c:if>
  <c:if test="${startIdx == 1 }">
  이전 &emsp;
  </c:if>
  
  ${nowPage} / ${totalPage} &emsp;
  
 <c:if test="${nowPage < totalPage }">
  
  <c:url  value="matjib.do"  var="url">
    <c:param name="startIdx"  value="${startIdx+5}"   />
    <c:param name="searchCondition"  value="${searchCondition}"   />
    <c:param name="searchKeyword"  value="${searchKeyword}"   />
  </c:url>
  <a href="${url}"> 다음 </a> &emsp;
  
  
 </c:if>
 
 <c:if test="${nowPage == totalPage }">
 다음 &emsp;
 </c:if>
 
 <c:url  value="matjib.do"  var="url">
   <c:param name="startIdx"  value="${endPage}"   />
   <c:param name="searchCondition"  value="${searchCondition}"   />
   <c:param name="searchKeyword"  value="${searchKeyword}"   />
 </c:url>
 
	<c:if test="${nowPage < totalPage }">
  <a href="${url}">마지막</a>
   </c:if>
   
   <c:if test="${nowPage == totalPage }">
   마지막
   </c:if>

<br><br>
 
 
</div>
<br>
<table>
<tr><td colspan=17 align=center>지역별 음식점 수 / 전체 음식점 수 : ${totalCount}</td></tr>
<tr height=10></tr>
<tr>
<c:forEach  items="${wd}"  var="wd" varStatus="status">
<td align=center width=100>${wd.ward }</td>
</c:forEach>
</tr>
<c:forEach  items="${wd}"  var="wd" varStatus="status">
<td align=center>
${wd.wardFoodCount }
</td>
</c:forEach>
</table>


</section>


<%@ include file="../include/bottom.jsp" %>
