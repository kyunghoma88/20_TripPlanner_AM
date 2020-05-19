<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

		<div style="display:inline-block;">
			여행 일수<input type="text" id="days"/><br>
			여행 지역
			<select name="place" id='place'>
			    <option value="">지역선택</option>
			    <option value="서울">서울</option>
			    <option value="강릉">강릉</option>
			    <option value="대전">대전</option>
			    <option value="전주">전주</option>
			    <option value="부산">부산</option>
			</select>
			<button type="button" id="keepgoing">계획짜기</button>
		</div>
	<div style="width:471px;">
		<c:forEach var="v" begin="1" end="${days }" varStatus="status">
			<div class="a b day${v}""><p><c:out value="day - ${v}"/></p></div>
		</c:forEach>
	</div>	
	<div style="display:inline-block;overflow:scroll;overflow-x:hidden;width:296;height:600px;position:absolute;left:471px;top:141px;">
		<c:forEach items="${list}" var="hs">
			<div class="test">
				<img alt="이미지음따" src="/spring${hs['HOTSPOT_IMAGE'] }" width='279px' height='160px'>
				<p>${hs['HOTSPOT_NAME'] }</p>
				<p>${hs['HOTSPOT_ADDR'] }</p>
			</div>
		</c:forEach>
	</div>
	<div id="map" style="width:600px;height:600px;position:absolute;overflow:hidden;left:766px;top:141px;">
	</div>
	<button type="button" id="jujang">저장</button>
	<button type="button" id="jujang1">1234</button>
<script>
$('#keepgoing').click(function(){
	var days = $('#days').val();
	var place = $('#place').val();
	$.ajax({
		url:"${path}/shoot.do",
		data:{
			days:days,
			place:place
		},
		type:"post",
		dataType:"html",
		success:function(data){
			$('#abcd').html(data);
		}
	});
});

var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
var hal = '${wekyungdo[0]['HOTSPOT_AREA_LAT']}';
var hah = '${wekyungdo[0]['HOTSPOT_AREA_HAR']}';
if(hal.trim() == '' || hah.trim() == ''){
	hal = '37.55068892690699';
	hah = '126.99094670691717';
}
    mapOption = { 
        center: new kakao.maps.LatLng(hal,hah), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [];
	var placename = new Array(); 
	var placelat = new Array(); 
	var placehar = new Array(); 
	<c:forEach items="${list}" var="item">
		placename.push("${item['HOTSPOT_NAME'] }");
		placelat.push("${item['HOTSPOT_LAT'] }");
		placehar.push("${item['HOTSPOT_HAR'] }");
	</c:forEach>
	for(var i = 0; i<placename.length; i++){
		positions[i]={
				content: '<div>'+placename[i]+'</div>',
				latlng: new kakao.maps.LatLng(placelat[i] , placehar[i])
		};
	};
	
	
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
$('#jujang').click(function(){
	var han = '${list[0]['HOTSPOT_AREA_NAME']}';
	var id = '${loginMember['memberId']}';
	var jArray = new Array();
	var jArray2 = new Array();
	var item = new Array();
	var item2 = new Array();
	var count  = 0;
		for(var i = 0; i< $('.b').length; i++ ){
			item[i] = new Array();
			item2[i] = new Array();
			for(var j = 0; j < $('.day'+(i+1)).children('div').length; j++){
				item[i][j]= $('.day'+(i+1)).children('div').eq(j).children('p').text();
				item2[i][j]= $('.day'+(i+1)).children('div').eq(j).children('input').val();
				console.log(i+'행'+j+'열'+item[i][j]);
				jArray[count]={
						tday:i+1,
						tplace:item[i][j],
						tarea:han,
						id:id,
						comment:item2[i][j]
				}
				count++;
			};
	var jsonStr = JSON.stringify(jArray);
	console.log("호이이잉"+jsonStr);
		};
	$.ajax({
		url:"${path}/jujang.do",
		data:jsonStr,
		type:"post",
		contentType:"application/json;charset=UTF-8",
		dataType:"json",
		success:function(data){
			
		}
	});
});
$('#jujang1').click(function(){
	console.log($('.day1').children('div').children('input').val());
})
</script>