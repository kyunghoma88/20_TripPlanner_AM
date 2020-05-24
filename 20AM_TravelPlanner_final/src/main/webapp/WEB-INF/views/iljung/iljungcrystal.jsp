<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/iljung.css?ver.2.3"/>
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
			<select name="place" id='place' disabled>
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
				<p class="a b cursorclass"><c:out value="day - ${v}"/></p>
			</div>
		</c:forEach>
	</div>	
	<div id="hotspotlist">
		<c:forEach items="${pd}" var="hs">
			<div class="test cursorclass">
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
	$(".b.c.d").parent('div').append(divtag);
});


$(document).on("click",".a.b",function(){
	$('.b.c.d').parent('div').children('div').toggle();
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
	$(this).css("background-color","turquoise");
	$(this).css("color","white");
	$(this).parent('div').children('div').toggle('slow');
});

	$(document).on("mouseover",".a.b",function(){
		$(this).css("background-color","#00000021");
	});

	$(document).on("mouseleave",".a.b",function(){
		$(this).css("background-color","white");
	});

$('#keepgoing').click(function(){
	var days = $('#days').val();
	var place = $('#place').val();
	var title = $('#plantitle').val();
	var id = '${loginMember['memberId']}';
	var trSeq = ${trSeq};
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
			url:"${path}/shooting.do",
			data:{
				days:days,
				place:place,
				title:title,
				memberId:id,
				trSeq:trSeq
			},
			type:"post",
			dataType:"html",
			success:function(data){
				$('#bcda').html(data);
			}
		});
	}
});


$(document).on('click','.btnf',function(){
	$(this).parent().remove();
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
	var ptag = $("<p class='ptagposition cursorclass'>");
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
		$(".day1").append(divtag);
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
		$(".day2").append(divtag);
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
		$(".day3").append(divtag);
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
		$(".day4").append(divtag);
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
		$(".day5").append(divtag);
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
		$(".day6").append(divtag);
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
		$(".day7").append(divtag);
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
		$(".day8").append(divtag);
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
		$(".day9").append(divtag);
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
		$(".day10").append(divtag);
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
$(document).on("click",".f.g.h",function(){
	$(this).css("background-color","white");
	$(this).css("color","black");
	$(".f.g.h").removeClass("g");
	$(".f.h").removeClass("h");
	$(".f").addClass("e");
})
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
	$(".f.g.h").parent('div').after(divtag);
	if($("*").hasClass("f g h")==true){
		$(".f.g.h").parent('div').parent('div').children('div').last().remove();
	}
});

$(document).on("click","#jujang1",function(){
	var han = '${list[0]['HOTSPOT_AREA_NAME']}';
	var id = '${loginMember['memberId']}';
	var title = $('#plantitle').val();
	var jArray = new Array();
	var jArray2 = new Array();
	var item = new Array();
	var item2 = new Array();
	var count  = 0;
	var trSeq = ${trSeq};
	console.log($(".day1").children('div').length);
	console.log($('.day1').children('div').eq(0).children('p').text());
	console.log($('.day1').children('div').eq(0).children('textarea').val());
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
						title:title,
						trSeq:trSeq
				}
				count++;
			};
	var jsonStr = JSON.stringify(jArray);
	console.log("호이이잉"+jsonStr);
		};
		
		var tf = 0;
		for(var i = 1; i<=${list[0]['TOTAL_DATE'] } ;i++){
			tf=0;
			if($(".day"+i).children('div').length<1){
				tf=0;
			}else{
				tf=1;
			}
		};
		
		if(tf == 1){
			$.ajax({
				url:"${path}/update.do",
				data:jsonStr,
				type:"post",
				contentType:"application/json;charset=UTF-8",
				success:function(){
					location.replace("${path}"); 
				},error:function(){
					alert("수정되었습니다.");
					location.replace("${path}"); 
				}
			});
		}else{
			alert("일정을 최소 한개이상 추가해주세요.");
		}
		
});
$("#jujang2").click(function(){
	alert("이전 페이지로 돌아갑니다.");
	location.replace("${path}/board/boardList.do"); 
})

$(document).on('keyup','.textsoksung', function() {

	if($(this).val().length > 100) {

alert("글자수는 100자로 이내로 제한됩니다.");

		$(this).val($(this).val().substring(0, 100));

	}

});

$(document).ready(function () {
	for(var i=1; i<3;i++){
		var divtag = $("<div class='modals' name='modals"+i+"'>");
		var imgtag = $('<img src="" width="1366px" height="600px"name="zin"'+i+'>');
		imgtag.attr('src','${path}/resources/images/수정가이드'+i+'.JPG');
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>