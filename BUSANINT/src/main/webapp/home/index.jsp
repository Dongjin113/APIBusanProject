<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>

<style>
* { margin: 0; padding: 0; }
ul { width: 700px; }
li { list-style: none; }
img{float:left;}

</style>

<section>
<br>
  <div align=center>
<ul class="bxslider" >
  <li>
  <c:forEach  items="${li}"  var="m" varStatus="status">
  <c:url  value="matjibdetail.do"  var="url">
  <c:param name="SEQ"  value="${m.SEQ}"   />
  </c:url>
  <c:if test="${m.SEQ le 150}">
  <a href="${url }">
  <img src="${m.imgaddr}" alt="" title="맛집조회수Top3" width=33% height=300 title="">
  </a>
  </c:if>
  <c:if test="${m.SEQ gt 150}">
  <a href="${url }">
  <img src="<%=path %>/FoodIMG/${m.imgaddr}" alt="" title="맛집조회수Top3" width=33% height=300 >
  </a>
  </c:if>
  </c:forEach>
  </li>
  
  <li>
  <c:forEach  items="${m}"  var="li" varStatus="status">
  <c:url  value="traveldetail.do"  var="url">
  <c:param name="SEQ"  value="${li.SEQ}"   />
  </c:url>
    
  <c:if test="${li.SEQ le 120}">
  <a href="${url }"><img src="${li.imgaddr}" alt="" title="여행지조회수 Top3" width=33% height=300 align="left"></a>
  </c:if>

  <c:if test="${li.SEQ gt 120}">
  <a href="${url }"><img src="<%=path %>/TravelIMG/${li.imgaddr}" alt="" title="여행지조회수 Top3" width=33% height=300 align="left"></a>
  </c:if>
  </c:forEach>
  </li>
  
  
  </ul>
  </div>
  
  
<div align=center>

<table>
<tr>
<td colspan=2><h4>&emsp;맛집 조회수 top3 </h4> 
<div align=right>
<a href="matjib.do">더보기</a>
</div>
</td></tr>
<c:forEach  items="${li}"  var="m" varStatus="status">
<c:url  value="matjibdetail.do"  var="url">
<c:param name="SEQ"  value="${m.SEQ}"   />
</c:url>
<tr>
<tr><td colspan=2><hr></td></tr>
<tr>
<td width=300 height=320>

<c:if test="${m.SEQ le 150}">
<a href="${url }">
<img src="${m.imgaddr}" alt="" title="이미지2" width=500 height=300 >
</a>
</c:if>
<c:if test="${m.SEQ gt 150}">
<a href="${url }">
<img src="<%=path %>/FoodIMG/${m.imgaddr}" alt="" title="이미지2" width=500 height=300 >
</a>
</c:if>

</td>
<td width=600 height=100 style="padding:20px">
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
<tr><td colspan=2> <hr></td></tr>
</table>

<br><br><br><br><br><br>



<table>
<tr>
<td colspan=2><h4>&emsp;관광지 조회수 top3 </h4> 
<div align=right>
<a href="travel.do">더보기</a>
</div>
</td></tr>
<c:forEach  items="${m}"  var="li" varStatus="status">
<tr><td colspan=2><hr></td></tr>
<tr>
<td width=700 height=400>
<br>
<a href="${url }">
<div align=center style="font-size:15px">
<b>${li.title }</b>
</div>
<br>

<c:set var="subtitle" value="${li.subtitle}" />
<c:if test="${!empty subtitle}">
<b>한줄소개 : </b>${li.subtitle}<br><br>
</c:if>
<c:if test="${empty subtitle}">
</c:if>

<c:set var="disabled" value="${li.disabled }" />
<c:if test="${!empty disabled}">
<b>장애인 관련 시설 : </b>${li.disabled}<br><br>
</c:if>
<c:if test="${empty disabled}">
</c:if>

<c:set var="price" value="${li.price}" />
<c:if test="${!empty price}">
<b>가격 : </b>${li.price}<br><br>
</c:if>
<c:if test="${empty price}">
</c:if>

<c:set var="public_transport" value="${li.public_transport }" />
<c:if test="${!empty public_transport}">
<b>대중교통으로 오시는 길 : </b>${li.public_transport }<br><br>
</c:if>
<c:if test="${empty public_transport}">
</c:if>

<c:set var="dayoff" value="${li.dayoff }" />
<c:if test="${!empty dayoff}">
<b>휴무일 : </b>${li.dayoff }<br><br>
</c:if>
<c:if test="${empty dayoff}">
</c:if>

<c:set var="tel" value="${li.tel }" />
<c:if test="${!empty tel}">
<b>전화번호 : </b>${li.tel }<br><br>
</c:if>
<c:if test="${empty tel}">
</c:if>


<c:set var="addr" value="${li.addr}" />
<c:if test="${!empty addr}">
<b>주소 : </b>${li.addr}<br><br>
</c:if>
<c:if test="${empty addr}">
</c:if>

<c:set var="business_hours" value="${li.business_hours}" />
<c:if test="${!empty business_hours}">
<b>방문가능 시간 : </b>${li.business_hours}<br><br>
</c:if>
<c:if test="${empty business_hours}">
</c:if>

<c:set var="ward" value="${li.ward}" />
<c:if test="${!empty ward}">
<b>여행지 지역 : </b>${li.ward}<br><br>
</c:if>
<c:if test="${empty ward}">
</c:if>

<c:set var="homepage" value="${li.homepage}" />
<c:if test="${!empty homepage}">
<b>홈페이지 : </b><a href="${li.homepage}">${li.homepage}</a>
</c:if>
<c:if test="${empty homepage}">
</c:if>
</a>

<div align=right style="padding-right:20px">
<br>조회수 : ${li.cnt }
</div>
<br><br>

</td>

<td>
<c:url  value="traveldetail.do"  var="url">
<c:param name="SEQ"  value="${li.SEQ}"   />
</c:url>
    
<c:if test="${li.SEQ le 120}">
<a href="${url }"><img src="${li.imgaddr}" alt="" title="이미지2" width=500 height=400 align="left"></a>

</c:if>

<c:if test="${li.SEQ gt 120}">
<a href="${url }"><img src="<%=path %>/TravelIMG/${li.imgaddr}" alt="" title="이미지2" width=500 height=400 align="left"></a>

</c:if>

</td>
</tr>
</c:forEach>

<tr><td colspan=2><hr></td></tr>
</table>




  </div>
  
  
</section>


<%@ include file="../include/bottom.jsp" %>
