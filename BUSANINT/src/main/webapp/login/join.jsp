<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/top.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    

<script>

var  idck = '<%= (String) session.getAttribute("idck") %>';

function ck(){
	if(f1.id.value==""){
		alert("아이디를 입력해주세요");
		f1.id.focus();
		return false;
	}else if(f1.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		f1.pwd.focus();
		return false;
	}else if(f1.name.value==""){
		alert("이름을 입력해주세요");
		f1.name.focus();
		return false;
	}else if(f1.postcode.value=="" || f1.roadAddress.value==""){
		alert("우편번호를 찾아주세요");
		f1.postcode.focus();
		return false;
	}else if(f1.detailAddress.value==""){
		alert("상세주소를 입력해주세요");
		f1.detailAddress.focus();
		return false;
	}else if(f1.tel.value==""){
		alert("전화번호를 입력해주세요");
		f1.tel.focus();
		return false;
	}
	
}

var  path='${pageContext.request.contextPath}';
jQuery.ajaxSetup({cache:false});

$(document).ready( function(){
	  $('#idCheck').click( function(){
		  
		  if($('#id').val()==""||$('#id').val()==" "){
			  alert("id를 입력해주세요")
		  }else{
		  var  dataStr={
				id  : $('#id').val()
		  };
		  }
		  $.ajax({
			  type: "GET",
			  url : path + "/idCheck.do",
			  data : dataStr,
			  success: function (data){
			    if (data == 0){
			    	alert("사용가능한 ID 입니다.");
			    }else{
			    	alert("중복 ID 입니다.");
			    	$('#id').val("");
			    	$('#id').focus();			    	
			    }			  
			  } 
			  
		  })
		  
	  } )
	  
	  
})
	
	
$(document).ready(function(){
	$("input[name=id]").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40) ) {
			var inputVal = $(this).val();    
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,""));
		}  
	});
});


$(document).ready(function(){
	if(idck=="nch1" || idck==null){
		alert("아이디 중복을 확인해주십시오. ")
	}
	
	
	})
</script>

<section>
<br>
<div align=center>
<br><br>
<div align=center style="font-size:40px">
홈페이지 회원가입
</div>
<br><br>
<form action="<%=path %>/logininsert.do" onSubmit="return ck()" name=f1 method=post>
<table border=1  >
<tr>
<td width=400>
<div style="line-height:40%"><br>
&emsp;<input  type=text  name=id  id=id placeholder="ID를 입력해주세요" size=40> 
<input  type="button" value="중복체크" id="idCheck" />   <br><br>
&emsp;<input  type=password  name=pwd  id=pwd placeholder="PASSWORD를 입력해주세요" size=40> <br><br>
&emsp;<input  type=text  name=name id=name placeholder="이름을 입력해주세요" size=40> <br><br>


&emsp;<input type="text" name="postcode" id="sample4_postcode" placeholder="우편번호">
&emsp;<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br>
&emsp;<input type="text" name="roadAddress" id="sample4_roadAddress" placeholder="도로명주소" size=50 >
<input type="hidden" name="jibunAddress" id="sample4_jibunAddress" placeholder="지번주소" size=25><br><br>

<span id="guide" style="color:#999;display:none"></span>

<input type="hidden" name="extraAddress" id="sample4_extraAddress" placeholder="참고항목" size=50>
&emsp;<input type="text" name="detailAddress" id="sample4_detailAddress" placeholder="상세주소"  size=50><br><br>


&emsp;<input  type=text  name=tel id=tel placeholder="전화번호를 입력해주세요 " size=30> ex) 010-1234-5678 <br><br>
<div align=center>
<input type=submit  value="가입하기"  >
<br><br>
</div>
</div>
</td>
</tr>
</table>
</form>
</div>

</section>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<%@ include file="../include/bottom.jsp" %>
