<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/iljung.css?ver.2.4"/>
<style>
/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
    margin-top: 213px;
    border: 1px solid #888;
    width: 1366px;
    height: 600px;
    cursor:pointer;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div id="daddydiv">
	<div id="abcd">
		<div>
			<p id="titletext">여행 제목</p>
			<input type='text' id="plantitle">
			<p>여행 일수</p>
			<select name="days" id='days' >
			    <option value="">일수 선택</option>
			    <option value="1">1</option>
			    <option value="2">2</option>
			    <option value="3">3</option>
			    <option value="4">4</option>
			    <option value="5">5</option>
			    <option value="6">6</option>
			    <option value="7">7</option>
			    <option value="8">8</option>
			    <option value="9">9</option>
			    <option value="10">10</option>
			</select>
			<p>여행 지역</p>
			<select name="place" id='place'>
			    <option value="">지역 선택</option>
			    <option value="서울">서울</option>
			    <option value="강릉">강릉</option>
			    <option value="대전">대전</option>
			    <option value="전주">전주</option>
			    <option value="부산">부산</option>
			</select>
			<button type="button" id="keepgoing">계획짜기</button>
		</div>
		<div id='jacksungbub'>
			<img src='${path}/resources/images/작성법.JPG'>
		</div>
		<div id="map">
		</div>
		<div id="weatherbox">
			<div id="seowd">
				<h5></h5>
				<p name="wd"></p>
				<p name="tp"></p>
				<p name="sd"></p>
				<p name="ws"></p>
				<img name="wi">
			</div>
			<div id="grwd">
				<h5></h5>
				<p name="wd"></p>
				<p name="tp"></p>
				<p name="sd"></p>
				<p name="ws"></p>
				<img name="wi">
			</div>
			<div id="djwd">
				<h5></h5>
				<p name="wd"></p>
				<p name="tp"></p>
				<p name="sd"></p>
				<p name="ws"></p>
				<img name="wi">
			</div>
			<div id="jjwd">
				<h5></h5>
				<p name="wd"></p>
				<p name="tp"></p>
				<p name="sd"></p>
				<p name="ws"></p>
				<img name="wi">
			</div>
			<div id="bswd">
				<h5></h5>
				<p name="wd"></p>
				<p name="tp"></p>
				<p name="sd"></p>
				<p name="ws"></p>
				<img name="wi">
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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

	$(document).on("mouseover",".a",function(){
		$(this).children('p').css("background-color","#00000021");
	});
	
	$(document).on("mouseleave",".a",function(){
		$(this).children('p').css("background-color","white");
	});
	
	$(document).on('click','.test',function(){
		var tatag = $("<textarea rows='4' cols='55' class='textsoksung'>")
		var ptag = $("<p class='ptagposition cursorclass e f'>");
		var imgtag = $("<img src='' class='imgposition'>")
		var imgsrc = $(this).find('img').attr('src');
		var divtag = $("<div class='divposition'>");
		var btntag = $("<button class='btnf'>");
		btntag.append('x');
		imgtag.attr('width','100px');
		imgtag.attr('height','100px');
		imgtag.attr('src',imgsrc);
		ptag.append($(this).find('img').next().text());
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".b.c.d").append(divtag);
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
		$(this).children('p').css("background-color","turquoise");
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
	$(document).ready(function(){
		for(var i = 0; i < 5; i++){  
			var city = '';
			switch(i){
				case 0 : city = "Seoul";break;
				case 1 : city = "Gangneung";break;
				case 2 : city = "Daejeon";break;
				case 3 : city = "Jeonju";break;
				case 4 : city = "Busan";break;
			}
			var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=c2d3dca0e56feb7a12127980ce354ebe";
			$.ajax({
		            url: apiURI,
		            dataType: "json",
		            type: "GET",
		            async: "false",
		            success: function(resp) {
		                console.log(resp);
		                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
		                console.log("현재습도 : "+ resp.main.humidity);
		                console.log("날씨 : "+ resp.weather[0].main );
		                console.log("상세날씨설명 : "+ resp.weather[0].description );
		                console.log("날씨 이미지 : "+ resp.weather[0].icon );
		                console.log("바람   : "+ resp.wind.speed );
		                console.log("나라   : "+ resp.sys.country );
		                console.log("도시이름  : "+ resp.name );
		                console.log("구름  : "+ (resp.clouds.all) +"%" );                 
		                console.log("코드  : "+ resp.cod );
		                var cod = resp.weather[0].description;
		                var korkod = '';
		                	var w_en_arr= ["thunderstorm with light rain","thunderstorm with rain",
		                		"thunderstorm with heavy rain","light thunderstorm","thunderstorm",
		                		"heavy thunderstorm","ragged thunderstorm","thunderstorm with light drizzle",
		                		"thunderstorm with drizzle","thunderstorm with heavy drizzle",
		                		"light intensity drizzle","drizzle","heavy intensity drizzle",
		                		"light intensity drizzle rain","drizzle rain","heavy intensity drizzle rain",
		                		"shower rain and drizzle","heavy shower rain and drizzle",
		                		"shower drizzle","light rain","moderate rain","heavy intensity rain",
		                		"very heavy rain","extreme rain","freezing rain","light intensity shower rain",
		                		"shower rain","heavy intensity shower rain","ragged shower rain",
		                		"light snow","snow","heavy snow","sleet","shower sleet","light rain and snow",
		                		"rain and snow","light shower snow","shower snow","heavy shower snow",
		                		"mist","smoke","haze","sand, dust whirls","fog","sand","dust",
		                		"volcanic ash","squalls","tornado","clear sky","few clouds",
		                		"scattered clouds","broken clouds","overcast clouds","tornado",
		                		"tropical storm","hurricane","cold","hot","windy","hail","calm",
		                		"light breeze","gentle breeze","moderate breeze","fresh breeze",
		                		"strong breeze","high win","gale","severe gale","storm","violent storm","hurricane"
		                	];
		            		var w_id_arr = [200,201,202,210,211,212,221,230,231,232,
		            		300,301,302,310,311,312,313,314,321,500,
		            		501,502,503,504,511,520,521,522,531,600,
		            		601,602,611,612,615,616,620,621,622,701,
		            		711,721,731,741,751,761,762,771,781,800,
		            		801,802,803,804,900,901,902,903,904,905,
		            		906,951,952,953,954,955,956,957,958,959,
		            		960,961,962];
		            		var w_kor_arr = ["가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
		            		"천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
		            		"강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
		            		"강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","악한 비","중간 비","강한 비",
		            		"매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
		            		"가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
		            		"소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
		            		"토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
		            		"구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
		            		"약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
		            		"심각한 돌풍","폭풍","강한 폭풍","허리케인"];
		            		for(var i=0; i<w_en_arr.length; i++) {
			            		if(w_en_arr[i]==cod) {
			            			korkod = w_kor_arr[i];
			            		}
		            		}
		        var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	        	if(resp.name == "Seoul"){
	        		$("#seowd h5").html(resp.name);
	        		$("#seowd p[name=wd]").html(korkod);
	        		$("#seowd p[name=tp]").html("온도 : "+(Math.round((resp.main.temp- 273.15)))+"℃");
	        		$("#seowd p[name=sd]").html("습도 : "+resp.main.humidity+"%");
	        		$("#seowd p[name=ws]").html("풍속 : "+resp.wind.speed+"km/h");
	        		$("#seowd img[name=wi]").attr("src",imgURL);
	        	}
	        	if(resp.name == "Gangneung"){
	        		$("#grwd h5").html(resp.name);
	        		$("#grwd p[name=wd]").html(korkod);
	        		$("#grwd p[name=tp]").html("온도 : "+(Math.round((resp.main.temp- 273.15)))+"℃");
	        		$("#grwd p[name=sd]").html("습도 : "+resp.main.humidity+"%");
	        		$("#grwd p[name=ws]").html("풍속 : "+resp.wind.speed+"km/h");
	        		$("#grwd img[name=wi]").attr("src",imgURL);
	        	}
	        	if(resp.name == "Daejeon"){
	        		$("#djwd h5").html(resp.name);
	        		$("#djwd h5").html(resp.name);
	        		$("#djwd p[name=wd]").html(korkod);
	        		$("#djwd p[name=tp]").html("온도 : "+(Math.round((resp.main.temp- 273.15)))+"℃");
	        		$("#djwd p[name=sd]").html("습도 : "+resp.main.humidity+"%");
	        		$("#djwd p[name=ws]").html("풍속 : "+resp.wind.speed+"km/h");
	        		$("#djwd img[name=wi]").attr("src",imgURL);
	        	}
	        	if(resp.name == "Jeonju"){
	        		$("#jjwd h5").html(resp.name);
	        		$("#jjwd h5").html(resp.name);
	        		$("#jjwd p[name=wd]").html(korkod);
	        		$("#jjwd p[name=tp]").html("온도 : "+(Math.round((resp.main.temp- 273.15)))+"℃");
	        		$("#jjwd p[name=sd]").html("습도 : "+resp.main.humidity+"%");
	        		$("#jjwd p[name=ws]").html("풍속 : "+resp.wind.speed+"km/h");
	        		$("#jjwd img[name=wi]").attr("src",imgURL);
	        	}
	        	if(resp.name == "Busan"){
	        		$("#bswd h5").html(resp.name);
	        		$("#bswd h5").html(resp.name);
	        		$("#bswd p[name=wd]").html(korkod);
	        		$("#bswd p[name=tp]").html("온도 : "+(Math.round((resp.main.temp- 273.15)))+"℃");
	        		$("#bswd p[name=sd]").html("습도 : "+resp.main.humidity+"%");
	        		$("#bswd p[name=ws]").html("풍속 : "+resp.wind.speed+"km/h");
	        		$("#bswd img[name=wi]").attr("src",imgURL);
	        	}
		            }
		     })
		}
	})
	        $(document).on("click",".e.f",function(){
	$(".f.g.h").addClass("e");
	$(".e.f.g.h").removeClass("f");
	$(".e.g.h").removeClass("g");
	$(".e.h").removeClass("h");
	$(".e").css("background-color","white");
	$(".e").css("color","black");
	$(".e").addClass("f");
	$(this).addClass("g");
	$(this).addClass("h");
	$(this).removeClass("e");
	$(this).css("background-color","red");
	$(this).css("color","white");
});
$(document).on("click",".f.g.h",function(){
	$(this).css("background-color","white");
	$(this).css("color","black");
	$(".f.g.h").removeClass("g");
	$(".f.h").removeClass("h");
	$(".f").addClass("e");
});
$(document).on('click','.test',function(){
	var tatag = $("<textarea rows='4' cols='55' class='textsoksung'>")
	var ptag = $("<p class='ptagposition e f'>");
	var imgtag = $("<img src='' class='imgposition'>")
	var imgsrc = $(this).find('img').attr('src');
	var divtag = $("<div class='divposition'>");
	var btntag = $("<button class='btnf'>");
	btntag.append('x');
	imgtag.attr('width','100px');
	imgtag.attr('height','100px');
	imgtag.attr('src',imgsrc);
	ptag.append($(this).find('img').next().text());
	divtag.append(btntag);
	divtag.append(imgtag);
	divtag.append(tatag);
	divtag.append(ptag);
	$(".f.g.h").parent('div').after(divtag);
	if($("*").hasClass("f g h")==true){
		$(".f.g.h").parent('div').parent('div').children('div').last().remove();
	}
});

</script>