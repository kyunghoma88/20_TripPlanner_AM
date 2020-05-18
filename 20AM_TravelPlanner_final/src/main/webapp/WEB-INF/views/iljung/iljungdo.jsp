<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<section>

<div style="display:inline-block;">
	<c:forEach var="v" begin="1" end="${days }" varStatus="status">
		<div class="a b day${v}"><p><c:out value="day - ${v}"/></p></div>
	</c:forEach>
</div>	
<div style="display:inline-block">
	<c:forEach items="${list}" var="hs">
		<div class="test">
			<img alt="이미지음따" src="/spring${hs['HOTSPOT_IMAGE'] }" width='100px' height='100px'>
			<p>${hs['HOTSPOT_NAME'] }</p>
			<p>${hs['HOTSPOT_ADDR'] }</p>
		</div>
	</c:forEach>
</div>
<div id="map" style="width:600px;height:600px;position:relative;overflow:hidden;float:right;">
</div>
<button type="button" id="jujang">저장</button>
</section>
<script>

	$(document).on('click','.test',function(){
		var ptag = $("<p>");
		var imgtag = $("<img src=''>")
		var imgsrc = $(this).find('img').attr('src');
		var divtag = $('<div>');
		imgtag.attr('width','100px');
		imgtag.attr('height','100px');
		imgtag.attr('src',imgsrc);
		ptag.append($(this).find('img').next().text());
		divtag.append(imgtag);
		divtag.append(ptag);
		$(".b.c.d").append(divtag);
		var count = (($(".b.c.d").children().length)-1)/2;
		//console.log($(".b.c.d").children('div').children('p').text());
		//console.log($(".b.c.d").children('div').children('img').attr('src'));
		//console.log(count);
		var forc = $(".b.c.d").children('div').length;
		//console.log($(".b.c.d").children('div').index());
		//console.log($(".b.c.d").children('div').index());
		/* for(let i=1; i>${days}; i++){
			for(let j=1; j> ;j++){
				
			}
		} */
		
	});
	$('#jujang').click(function(){
		var han = '${list[0]['HOTSPOT_AREA_NAME']}';
		var jArray = new Array();
		var item = new Array();
		var count  = 0;
			for(var i = 0; i< $('.b').length; i++ ){
				item[i] = new Array();
				for(var j = 0; j < $('.day'+(i+1)).children('div').length; j++){
					item[i][j]= $('.day'+(i+1)).children('div').eq(j).children('p').text();
					console.log(i+'행'+j+'열'+item[i][j]);
					jArray[count]={
							tday:i+1,
							tplace:item[i][j],
							tarea:han
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
	
	
	$(document).on("mouseover",".a",function(){
		$(this).css("background-color","#00000021");
	});
	
	$(document).on("mouseleave",".a",function(){
		$(this).css("background-color","white");
	});
	
	$(document).on("click",".a.b",function(){
		$('.b.c.d').children('div').toggle();
		$(".b.c.d").addClass("a");
		$(".a.b.c.d").removeClass("b");
		$(".a.c.d").removeClass("c");
		$(".a.d").removeClass("d");
		$(".a").css("background-color","white");
		$(".a").css("color","black");
		$(".a").addClass("b");
		$(this).addClass("c");
		$(this).addClass("d");
		$(this).removeClass("a");
		$(this).css("background-color","black");
		$(this).css("color","white");
		$(this).children('div').toggle('slow');
		
	});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.578903164462346, 126.98620550145591), // 지도의 중심좌표
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

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}

	/* 아래와 같이도 할 수 있습니다 */
	/*
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

	    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    (function(marker, infowindow) {
	        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
	        kakao.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.open(map, marker);
	        });

	        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
	        kakao.maps.event.addListener(marker, 'mouseout', function() {
	            infowindow.close();
	        });
	    })(marker, infowindow);
	}
	*/
</script>