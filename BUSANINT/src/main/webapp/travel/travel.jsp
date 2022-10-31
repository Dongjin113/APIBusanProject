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

#travelwrite{
padding-right:60px;
}
</style>

<script>
var path = '${pageContext.request.contextPath}';
	function travelWrite(){
		
		location.href=path+"/travelwrite.do";
	}
	
</script>
    

<section>
<div align=center>


<div class="tag" align=center>
<c:forEach  items="${wd}"  var="wd" varStatus="status">

<c:url  value="travel.do"  var="url">
    <c:param name="startIdx"  value="1"   />
    <c:param name="searchCondition"  value="ward"   />
    <c:param name="searchKeyword"  value="${wd.ward }"   />
  </c:url>
  
<a href="${url }">#${wd.ward } &emsp;</a>


<c:if test="${status.count eq 8}"> <br></c:if>

</c:forEach>
</div>
<br>

&emsp;&emsp;


<table>
<tr><td colspan=2> <div align=left style="font-size:20px"><b>&emsp;&emsp;여행지소개</b></div>
<div align=right>
<form action="<%=path%>/travel.do">

<select name=searchCondition>

<option value="place">관광지</option>
<option value="title">글제목</option>
<option value="ward">지역</option>


</select>


<input type=text name="searchKeyword" >
<input type=submit value="찾기">
</form>
</div>



<div style="line-height:20%"><br></div></tr>
<c:forEach  items="${li}"  var="m"  varStatus="status" >
<tr><td colspan=2>
<hr width=1200></td></tr>

<tr >

<td width=300>


<div align=center style="font-size:20px">
<b>${m.place }</b><br>

<%if(role == null || role.equals("일반회원")){ %>
<c:url  value="traveldetail.do"  var="url">
<c:param name="SEQ"  value="${m.SEQ}"   />
<c:param name="id" value="${id}"/>
</c:url>

<c:if test="${m.SEQ le 120}">
<a href="${url }"><img src="${m.imgaddr}" alt="" title="이미지2" width=400 height=450 align="left"></a>
</c:if>

<c:if test="${m.SEQ gt 120}">
<a href="${url }"><img src="<%=path %>/TravelIMG/${m.imgaddr}" alt="" title="이미지2" width=400 height=450 align="left"></a>
</c:if>

<%}else if(role.equals("관리자")){ %>
<c:url  value="travelEdit.do"  var="url">
<c:param name="SEQ"  value="${m.SEQ}"   />
</c:url>

<c:if test="${m.SEQ le 120}">
<a href="${url }"><img src="${m.imgaddr}" alt="" title="이미지2" width=400 height=450 align="left"></a>
</c:if>

<c:if test="${m.SEQ gt 120}">
<a href="${url }"><img src="<%=path %>/TravelIMG/${m.imgaddr}" alt="" title="이미지2" width=400 height=450 align="left"></a>
</c:if>

<%}%>

</div>
</td>
<td width=800>
<div class=introduce>
<a href="${url }">
<div align=center style="font-size:20px"><b>${m.title }</b></div><br>

<c:set var="subtitle" value="${m.subtitle}" />
<c:if test="${!empty subtitle}">
<b>한줄소개 : </b>${m.subtitle}<br><br>
</c:if>
<c:if test="${empty subtitle}">
</c:if>

<c:set var="disabled" value="${m.disabled }" />
<c:if test="${!empty disabled}">
<b>장애인 관련 시설 : </b>${m.disabled}<br><br>
</c:if>
<c:if test="${empty disabled}">
</c:if>

<c:set var="price" value="${m.price}" />
<c:if test="${!empty price}">
<b>가격 : </b>${m.price}<br><br>
</c:if>
<c:if test="${empty price}">
</c:if>

<c:set var="public_transport" value="${m.public_transport }" />
<c:if test="${!empty public_transport}">
<b>대중교통으로 오시는 길 : </b>${m.public_transport }<br><br>
</c:if>
<c:if test="${empty public_transport}">
</c:if>

<c:set var="dayoff" value="${m.dayoff }" />
<c:if test="${!empty dayoff}">
<b>휴무일 : </b>${m.dayoff }<br><br>
</c:if>
<c:if test="${empty dayoff}">
</c:if>

<c:set var="tel" value="${m.tel }" />
<c:if test="${!empty tel}">
<b>전화번호 : </b>${m.tel }<br><br>
</c:if>
<c:if test="${empty tel}">
</c:if>


<c:set var="addr" value="${m.addr}" />
<c:if test="${!empty addr}">
<b>주소 : </b>${m.addr}<br><br>
</c:if>
<c:if test="${empty addr}">
</c:if>

<c:set var="business_hours" value="${m.business_hours}" />
<c:if test="${!empty business_hours}">
<b>방문가능 시간 : </b>${m.business_hours}<br><br>
</c:if>
<c:if test="${empty business_hours}">
</c:if>

<c:set var="ward" value="${m.ward}" />
<c:if test="${!empty ward}">
<b>여행지 지역 : </b>${m.ward}<br><br>
</c:if>
<c:if test="${empty ward}">
</c:if>

<c:set var="homepage" value="${m.homepage}" />
<c:if test="${!empty homepage}">
<b>홈페이지 : </b><a href="${m.homepage}">${m.homepage}</a>
</c:if>
<c:if test="${empty homepage}">
</c:if>

<!--  ${m.introduce}-->
</a>
</div>
</td>
</tr>
</c:forEach>
<tr><td colspan=2 align=right>
<hr width=1200>
<%if(role == null || role.equals("일반회원")){ %>
<%}else if(role.equals("관리자")){ %>
<div id="travelwrite"><input type="button" value="글쓰기" onClick="travelWrite()"></div>
<%}%>
</td></tr>

</table>

<br>

  <c:url  value="travel.do"  var="url">
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
  
    <c:url  value="travel.do"  var="url">
      <c:param name="startIdx"  value="${startIdx-3}"   />
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
  
  <c:url  value="travel.do"  var="url">
    <c:param name="startIdx"  value="${startIdx+3}"   />
    <c:param name="searchCondition"  value="${searchCondition}"   />
    <c:param name="searchKeyword"  value="${searchKeyword}"   />
  </c:url>
  <a href="${url}"> 다음 </a> &emsp;
  
  
 </c:if>
 
 <c:if test="${nowPage == totalPage }">
 다음 &emsp;
 </c:if>
 
 <c:url  value="travel.do"  var="url">
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

<br><br><br>




</div>
<table>
<tr><td colspan=17 align=center>지역별 관광지 수 / 전체 관광지 수 : ${totalCount}</td></tr>
<tr height=10></tr>
<tr>
<c:forEach  items="${wd}"  var="wd" varStatus="status">
<td align=center width=100>${wd.ward }</td>
</c:forEach>
</tr>
<c:forEach  items="${wd}"  var="wd" varStatus="status">
<td align=center>
${wd.wardTravelCount }
</td>
</c:forEach>
</table>




</section>


<%@ include file="../include/bottom.jsp" %>

