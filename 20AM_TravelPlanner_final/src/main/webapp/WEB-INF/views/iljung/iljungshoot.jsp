<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
		<div>
			<p id="titletext">여행 제목</p>
			<input type='text' id="plantitle" value="${title}">
			<p>여행 일수</p>
			<select name="days" id='days'>
			    <option value="">일수 선택</option>
			    <option value="1" name='day1'>1</option>
			    <option value="2" name='day2'>2</option>
			    <option value="3" name='day3'>3</option>
			    <option value="4" name='day4'>4</option>
			    <option value="5" name='day5'>5</option>
			    <option value="6" name='day6'>6</option>
			    <option value="7" name='day7'>7</option>
			    <option value="8" name='day8'>8</option>
			    <option value="9" name='day9'>9</option>
			    <option value="10" name='day10'>10</option>
			</select>
			<p>여행 지역</p>
			<select name="place" id='place'>
			    <option value="">지역 선택</option>
			    <option value="서울" name='Seoul'>서울</option>
			    <option value="강릉" name=' Gangneung'>강릉</option>
			    <option value="대전" name='Daejeon'>대전</option>
			    <option value="전주" name='Jeonju'>전주</option>
			    <option value="부산" name='Busan'>부산</option>
			</select>
			<button type="button" id="keepgoing">계획짜기</button>
		</div>
	<div id="daysbox">
		<c:forEach var="v" begin="1" end="${days }" varStatus="status">
			<div class="a b day${v}">
				<p><c:out value="day - ${v}"/></p>
			</div>
		</c:forEach>
	</div>	
	<div id="hotspotlist">
		<c:forEach items="${list}" var="hs">
			<div class="test">
				<img alt="이미지음따" src="/spring${hs['HOTSPOT_IMAGE'] }" width='277px' height='160px'>
				<p>${hs['HOTSPOT_NAME'] }</p>
				<p>${hs['HOTSPOT_ADDR'] }</p>
			</div>
		</c:forEach>
	</div>
	<div id="mapa">
	</div>
	<button type="button" id="jujang">저장</button>
	
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
		
		</div>
	</div>


<script>

$('#keepgoing').click(function(){
	var days = $('#days').val();
	var place = $('#place').val();
	var title = $('#plantitle').val();
	if(title == ''){
		alert("타이틀을 작성해주세요.");
		$('#plantitle').focus();
	}else if(days == ''){
		alert("일수를 선택해주세요.")
		$('#days').focus();
	}else if(place == ''){
		alert("지역을 선택해주세요.");
		$('#place').focus();
	}else{
		$.ajax({
			url:"${path}/shoot.do",
			data:{
				days:days,
				place:place,
				title:title
			},
			type:"post",
			dataType:"html",
			success:function(data){
				$('#abcd').html(data);
			}
		});
	}
});

$(document).ready(function () {
	for(var i=4; i>0;i--){
		var divtag = $("<div class='modals' name='modals"+i+"'>");
		var imgtag = $('<img src="" width="1366px" height="600px"name="zin"'+i+'>');
		imgtag.attr('src','${path}/resources/images/작성가이드'+i+'.JPG');
		divtag.append(imgtag);
		$(".search-modal-content").append(divtag);
	}
	$("#modal").show();
});
	 $(document).on('click','.modals',function(){
		$(this).remove();
		if($(".modals").length==0){
			$(".search-modal-content").remove();
			$(".searchModal").hide();
		}
	}); 
$(document).ready(function(){
	for(var i=1; i<11; i++){
		if(${days} == i){
			$("option[name=day"+i+"]").attr('selected','selected');
		};
	};
	switch("${place}"){
	case "서울": $("option[name=Seoul]").attr('selected','selected');break;
	case "강릉": $("option[name=Gangneung]").attr('selected','selected');break;
	case "대전": $("option[name=Daejeon]").attr('selected','selected');break;
	case "전주": $("option[name=Jeonju]").attr('selected','selected');break;
	case "부산": $("option[name=Busan]").attr('selected','selected');break;
	}
});
$('#keepgoing').click(function(){
	var days = $('#days').val();
	var place = $('#place').val();
	var title = $('#plantitle').val();
	$.ajax({
		url:"${path}/shoot.do",
		data:{
			days:days,
			place:place,
			title:title
		},
		type:"post",
		dataType:"html",
		success:function(data){
			$('#abcd').html(data);
		}
	});
});

var mapContainer = document.getElementById('mapa'); // 지도를 표시할 div  
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
};

$('#jujang').click(function(){
	var han = '${list[0]['HOTSPOT_AREA_NAME']}';
	var id = '${loginMember['memberId']}';
	var title = $('#plantitle').val();
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
				item2[i][j]= $('.day'+(i+1)).children('div').eq(j).children('textarea').val();
				console.log(i+'행'+j+'열'+item[i][j]);
				jArray[count]={
						tday:i+1,
						tplace:item[i][j],
						tarea:han,
						id:id,
						comment:item2[i][j],
						title:title
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
		success:function(){
		location.replace("${path}/views/index"); 
		}
	});
});
</script>