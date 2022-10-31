<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/top.jsp" %>
    
<script>
function delK(k1){
	$.ajax({
		url:'<%=path%>/deleteMember.do',
		type:'post',
		data:{
			id:k1
		},
		success:function(){
			alert(k1+"님이 계정이 삭제되었습니다");
			location.replace("<%=path%>/member.do");
		}
	})
}
</script>

<section>
<br>
<div align=center>
<br><br>
<div align=center style="font-size:40px">
회원 관리
</div>
<br><br>
<form action="" onSubmit="return delK(${m.id})" name=f1>
<table border=1>
<tr height=30>
<th>순번</th><th>아이디</th><th>이름</th><th>우편번호</th>
<th>주소</th><th>전화번호</th><th>회원정보</th><th>가입일자</th><th>계정 삭제</th>
</tr>
<c:forEach  items="${li}"  var="m"  varStatus="status" >
<tr>
<td width=40 align=center> ${status.count} </td>
<td width=100 align=center> ${m.id} </td>
<td width=100 align=center> ${m.name} </td>
<td width=100 align=center> ${m.postcode} </td>
<td width=300 align=center> ${m.roadAddress} <br> ${m.detailAddress} </td>
<td width=150 align=center> ${m.tel} </td>
<td width=100 align=center> ${m.role} </td>
<td width=150 align=center> 
<fmt:formatDate pattern="yyyy-MM-dd" value="${m.datestr}"/>
 </td>
 <td width=100 align=center> 
<input type=button onClick="delK('${m.id}')" value="삭제" />
 </td>
</tr>
</c:forEach>
</table>
</form>
</div>
</section>


<%@ include file="../include/bottom.jsp" %>
