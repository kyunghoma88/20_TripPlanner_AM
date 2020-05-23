<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/iljung.css?ver.2.2"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<div id="bcda">
	<div>
			<p id="titletext">여행 제목</p>
			<input type='text' id="plantitle" value="${tvTitle}">
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
		<c:forEach var="v" begin="1" end="${list[0]['TOTAL_DATE'] }" varStatus="status">
			<div class="day${v}">
				<p class="a b"><c:out value="day - ${v}"/></p>
			</div>
		</c:forEach>
		<button type="button" id="jujang">저장</button>
	</div>	
	<div id="hotspotlist">
		<c:forEach items="${pd}" var="hs">
			<div class="test">
				<img alt="이미지음따" src="/spring${hs['HOTSPOT_IMAGE'] }" width='277px' height='160px'>
				<p>${hs['HOTSPOT_NAME'] }</p>
				<p>${hs['HOTSPOT_ADDR'] }</p>
			</div>
		</c:forEach>
	</div>
	<div id="mapadu">
	</div>
	<button type="button" id="jujang1">수정하기</button>
	<button type="button" id="jujang2">취소</button>
	
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
		
		</div>
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

$(document).on("mouseover",".a",function(){
	$(this).children('p').css("background-color","#00000021");
});

$(document).on("mouseleave",".a",function(){
	$(this).children('p').css("background-color","white");
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


var placeimg = new Array();
var tvDate = new Array();
var hsName = new Array();
var comments = new Array();
<c:forEach items="${list}" var="item">
	placeimg.push("${path}${item['HOTSPOT_IMAGE'] }");
	tvDate.push("${item['TV_DATE']}");
	hsName.push("${item['HOTSPOT_NAME']}");
	comments.push("${item['COMMENTS']}");
</c:forEach>
for(var i=0; i<${result} ; i++){
	var btntag = $("<button class='btnf'>")
	var divtag = $("<div class='divposition'>");
	var imgtag = $("<img src='' class='imgposition' width='100px' height='100px'>");
	var tatag = $("<textarea rows='4' cols='55' class='textsoksung'>");
	var ptag = $("<p class='ptagposition'>");
	if(tvDate[i] == 1){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day1").children().append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 2){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day2").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 3){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day3").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 4){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day4").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 5){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day5").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 6){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day6").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 7){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day7").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 8){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day8").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 9){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day9").children('p').append(divtag);
		$(".divposition").hide();
	}else if(tvDate[i] == 10){
		btntag.append('x');
		tatag.append(comments[i]);
		imgtag.attr("src",placeimg[i]);
		ptag.addClass('e');
		ptag.addClass('f');
		ptag.append(hsName[i]);
		divtag.append(btntag);
		divtag.append(imgtag);
		divtag.append(tatag);
		divtag.append(ptag);
		$(".day10").children('p').append(divtag);
		$(".divposition").hide();
	}
}

for(var i=1; i<11; i++){
	if(${list[0]['TOTAL_DATE']} == i){
		$("option[name=day"+i+"]").attr('selected','selected');
	};
};
switch("${list[0]['HOTSPOT_AREA_NAME']}"){
case "서울": $("option[name=Seoul]").attr('selected','selected');break;
case "강릉": $("option[name=Gangneung]").attr('selected','selected');break;
case "대전": $("option[name=Daejeon]").attr('selected','selected');break;
case "전주": $("option[name=Jeonju]").attr('selected','selected');break;
case "부산": $("option[name=Busan]").attr('selected','selected');break;
}

var mapContainer = document.getElementById('mapadu'); // 지도를 표시할 div  
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
//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
 return function() {
     infowindow.open(map, marker);
 };
};
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
$(document).on('click','.test',function(){
	var tatag = $("<textarea rows='4' cols='55' class='textsoksung'>")
	var ptag = $("<p class='ptagposition'>");
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
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>