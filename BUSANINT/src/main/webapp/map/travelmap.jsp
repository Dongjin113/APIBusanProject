<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="../include/top.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>닫기가 가능한 커스텀 오버레이</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<section>
<br>
<div id="map" style="width:100%;height:700px;"></div>
<p>
	<button onclick="hideAll()">전부 지우기</button>
    <button onclick="showAll()">전부 보이기</button>
    <button onclick="hideMarkers()">마커 감추기</button>
    <button onclick="showMarkers()">마커 보이기</button>
    <button onclick="hideContent()">관광지 설명 감추기</button>
    <button onclick="showContent()">관광지 설명 보기</button>
</p> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf02fe9c128963727a9179a7e0661bba"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(35.179642, 129.075309), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];
var overlay = [];
var text = [];

var place=[];
var seq=[];
var lat =[];
var lng =[];
var addr =[];
var ward = [];
var imgaddr = [];
var title1 = [];
var positions = [];

<c:forEach var="k" items="${li}" varStatus="status">
place.push("${k.place}")
imgaddr.push("${k.imgaddr}")
seq.push("${k.SEQ}")
lat.push("${k.lat}")
lng.push("${k.lng}")
addr.push("${k.addr}")
ward.push("${k.ward}")
title1.push("${k.title}")
</c:forEach>

for (y=0 ; y < place.length ; y++ ){
	text.push( '<div class="wrap">' + 
	    '    <div class="info">' + 
	    '        <div class="title">' + 
	   			 place[y] +  
	    '            <div class="close" onclick="closeOverlay('+y+')" title="닫기"></div>' + 
	    '        </div>' + 
	    '        <div class="body">' + 
	    '            <div class="img">' +
	    '                <img src='+imgaddr[y]+ ' width="73" height="70">' +
	    '           </div>' + 
	    '            <div class="desc">' + 
	    '                <div class="ellipsis">'+title1[y]+'</div>' + 
	    '                <div class="jibun ellipsis">'+ward[y]+' &emsp;'+ addr[y]+ '</div> '+ 
	    '                <div><a href=https://map.kakao.com/link/to/'+ place[y] +','+lat[y]+','+ lng[y] + ' style="color:blue" target="_blank">길찾기</a>&emsp;&emsp;&emsp;<a href="traveldetail.do?SEQ='+seq[y]+'">상세보기</a></div>' + 
	    '            </div>' + 
	    '        </div>' + 
	    '    </div>' +    
	    '</div>')
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다
	}
    
for (i=0 ; i <= place.length ; i++ ){
	positions[i] = {
			content : ' <div style="padding:5px;"> '+ place[i] + '</div>',
			latlng : new kakao.maps.LatLng(lat[i], lng[i])
	};
}
// 커스텀 오버레이에 표시할 컨텐츠 입니다
// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다

for (i=0 ; i < place.length ; i++ ){
// 지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
    map: map, 
    position: positions[i].latlng
});
//생성된 마커를 배열에 추가합니다
markers.push(marker);

//마커에 표시할 인포윈도우를 생성합니다 
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));


}


for (i=0 ; i < place.length ; i++ ){
var content= text[i];

// 마커 위에 커스텀오버레이를 표시합니다
// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다

var overlay1 = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: markers[i].getPosition()       
});
overlay.push(overlay1);
}
// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다

for(let j=0; j<place.length; j++){
	let b=j;
kakao.maps.event.addListener(markers[j], 'click', function() {
    overlay[b].setMap(map);
});
}


// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay(y) {
    overlay[y].setMap(null);     
    }


function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}
function setOverlay(map) {
	for (x=0 ; x < overlay.length ; x++ ){
	    overlay[x].setMap(map);
		}         
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}


//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map);
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);
}

function hideContent(){
    setOverlay(null);
}

function showContent(){
    setOverlay(map);
}

function hideAll() {
	setMarkers(null);
	setOverlay(null);
}

function showAll(){
	setMarkers(map);
	setOverlay(map);
}
</script>
</section>
<%@include file="../include/bottom.jsp" %>