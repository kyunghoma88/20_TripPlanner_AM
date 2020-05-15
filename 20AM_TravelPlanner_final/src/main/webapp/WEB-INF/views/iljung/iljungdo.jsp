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
	var array = [];
	
	var hm = new Object();
	var cnt = 0;
	
	$(document).on('click','.test',function(){
		var ptag = $("<p>");
		var imgtag = $("<img src=''>")
		var imgsrc = $(this).find('img').attr('src');
		imgtag.attr('width','100px');
		imgtag.attr('height','100px');
		imgtag.attr('src',imgsrc);
		ptag.append($(this).find('img').next().text());
		$(".b.c.d").append(imgtag);
		$(".b.c.d").append(ptag);
		var count = (($(".b.c.d").children().length)-1)/2;
		console.log(count);
		
		/* hm["array"] = 서울
		hm["area"] = 경복궁
		
		cnt++;
		
		
		
		array[1][1] 서울
		array[1][2] 경복궁
		array[1][3] 1
		btn1
		array[2][1] 서울
		array[2][2] 광화문
		array[2][3] 2
		btn2
		array[3][1] 서울
		array[3][2] 광화문
		array[3][3] 3
		btn3
		array[3][1] 서울
		array[3][2] 광화문
		array[3][3] 4
		btn4
		
		
		array[array.length+1][1] = 서울
		array[array.length+1][2] = 서울 */
		
	});
	
	$(document).ready(function(){
		$.ajax({
			url:"${path}/placedata.do",
			data:{
				place:'${place}'
			},
			type:"post",
			dataType:"json",
			success:function(data){
				
			}
		});
	});
	
	$("#jujang").click(function(){
		for(let i=1; i<=${days }; i++){
			let day = "day"+i;
			if(day=="day"+i){
				console.log($("."+day+":first-child").text());
				$.ajax({
					url:"${path}/jujang.do",
					data:{
						  day:$("."+day).first().text(),
						  placeImg:$("."+day+" img").attr('src'),
						  hotspotName:$("."+day+" p").text()	
					},
					type:"post",
					dataType:"json",
					success:function(data){
					}
				})
			}
			
		}
	})
	
	
	$(document).on("mouseover",".a",function(){
		$(this).css("background-color","#00000021");
	});
	
	$(document).on("mouseleave",".a",function(){
		$(this).css("background-color","white");
	});
	
	$(document).on("click",".a.b",function(){
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
	});
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.578903164462346, 126.98620550145591), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>북촌한옥마을</div>', 
	        latlng: new kakao.maps.LatLng(37.578903164462346 , 126.98620550145591)
	    },
	    {
	        content: '<div>청계천</div>', 
	        latlng: new kakao.maps.LatLng(37.569438873541, 127.00588611532837)
	    },
	    {
	        content: '<div>가로수길</div>', 
	        latlng: new kakao.maps.LatLng(37.51958896822517, 127.02313004390007)
	    },
	    {
	        content: '<div>경복궁</div>',
	        latlng: new kakao.maps.LatLng(37.57616723585264, 126.97712132834202)
	    },
	    {
	        content: '<div>한강</div>', 
	        latlng: new kakao.maps.LatLng(37.53355209240853, 126.93445784830185)
	    },
	    {
	        content: '<div>인사동</div>', 
	        latlng: new kakao.maps.LatLng(37.572654713090415, 126.98574819650244)
	    },
	    {
	        content: '<div>명동</div>', 
	        latlng: new kakao.maps.LatLng(37.56103178383466, 126.98508263808856)
	    },
	    {
	        content: '<div>남산타워</div>', 
	        latlng: new kakao.maps.LatLng(37.55121123560078, 126.98792508609901
	)
	    }
	];

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