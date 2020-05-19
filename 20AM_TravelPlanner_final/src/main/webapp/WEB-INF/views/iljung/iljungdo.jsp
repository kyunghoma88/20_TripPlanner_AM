<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<div id="abcd" style="width:1366px;">
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
		<div id="map" style="width:600px;height:600px;position:relative;overflow:hidden;float:right;display:inline-block;">
		</div>
	</div>
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

	$(document).on("mouseover",".a",function(){
		$(this).children('p').css("background-color","#00000021");
	});
	
	$(document).on("mouseleave",".a",function(){
		$(this).children('p').css("background-color","white");
	});
	
	$(document).on('click','.test',function(){
		var ptag = $("<p>");
		var imgtag = $("<img src=''>")
		var imgsrc = $(this).find('img').attr('src');
		var divtag = $('<div>');
		var btntag = $("<button class='btnf'>");
		btntag.append('x');
		imgtag.attr('width','100px');
		imgtag.attr('height','100px');
		imgtag.attr('src',imgsrc);
		ptag.append($(this).find('img').next().text());
		divtag.append(imgtag);
		divtag.append(ptag);
		divtag.append(btntag);
		$(".b.c.d").append(divtag);
		var count = (($(".b.c.d").children().length)-1)/2;
		//console.log($(".b.c.d").children('div').children('p').text());
		//console.log($(".b.c.d").children('div').children('img').attr('src'));
		//console.log(count);
	});
	$(document).on('click','.btnf',function(){
		$(this).parent().remove();
	});
	
	$(document).on("click",".a.b",function(){
		$('.b.c.d').children('div').toggle();
		$(".b.c.d").addClass("a");
		$(".a.b.c.d").removeClass("b");
		$(".a.c.d").removeClass("c");
		$(".a.d").removeClass("d");
		$(".a").children('p').css("background-color","white");
		$(".a").children('p').css("color","black");
		$(".a").addClass("b");
		$(this).addClass("c");
		$(this).addClass("d");
		$(this).removeClass("a");
		$(this).children('p').css("background-color","black");
		$(this).children('p').css("color","white");
		$(this).children('div').toggle('slow');
		
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