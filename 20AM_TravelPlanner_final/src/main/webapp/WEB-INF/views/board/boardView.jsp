<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    .headPhoto{
        width: 100%;
        margin-top: 50px;
    }
    .boardTitle{
      /* margin-top: 250px; */
      margin-left: 50px;
      color: white;
      font-size: 30px;
      font-weight: bold;
    }

    .boardContent{
      margin-top: 50px;
      font-size: 25px;
      font-weight: bold;
    }

    .imageTd{
      width: 100px;
      cursor: pointer;
    }

    .dayBtn{
      color: white;
      background-color: #203341;
    }
    
    .commentTr{
    	font-size: 22px;
    }

</style>

    <div class="row">
       <div class="col-sm-1"></div>
       <div style="background: url('${path }${board.hotspotAreaImg}') no-repeat; background-size:cover; background-position:center center;" class="col-sm-10 headPhoto">
            <div class="boardTitle" style="margin-top: 250px; width: auto;">
                <div><c:out value="${board.tvTitle }"/></div>
                <div>${board.memberId }</div>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
    <div class="row boardContent">
      <div class="col-sm-1"></div>
      <div class="col-sm-5" id="testContent">
     	<c:forEach var="v" begin="1" end="${date}">
	        <c:set var="whatDay" value="${v }"/>
         	<button type="button" class="dayBtn" id="dayBtn${v }" onclick="fn_boardDetail(this, '${board.trSeq}', '${whatDay }');">Day${v }</button><br>
   		</c:forEach>
      </div>
      <div class="col-sm-5">
        <div id="map" style="border: 1px solid black; height: 380px; width: 565px">
        </div>
      </div>
      <div class="col-sm-1"></div>
    </div>
	<script>
 	 function fn_boardDetail(el, seq, whatDay){
		$.ajax({
			url : "${path}/board/boardDetail.do",
			type : "post",
			data : {"no" : seq, "date" : whatDay},
			success:function(data){
				const table = $("<table class='contentTbl'>");
				for(let i=0; i<data.length; i++){
					table.append("<tr><td class='imageTd' rowspan='2'><img src='${path }" + data[i]['hotspotImg'] + "' alt='이미지 없음' width='170px' height='70px' onclick='location.replace(\"${path }/hotSpot/hotSpotView.do?name=" + data[i]['hotspotName'] + "\")' width='auto'></td><td>" + data[i]['hotspotName'] + "</td></tr>")
					.append("<tr><td class='commentTr'>" + data[i]['comment'] + "</td></tr>");
				}
				$(el).next($(".contentTbl")).toggle();
				$(el).after(table);
			}
		}) 
	};
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	
    mapOption = { 
        center: new kakao.maps.LatLng(${board.hotspotAreaLat}, ${board.hotspotAreaHar}), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	   var positions = [];
	   var placename = new Array(); 
	   var placelat = new Array();
	   var placehar = new Array();
	   <c:forEach items="${day}" var="d">
	      placename.push("${d.hotspotName}");
	      placelat.push("${d.hotspotLat}");
	      placehar.push("${d.hotspotHar}");
	   </c:forEach> 
	   
	/*  */
	 
	   for(var i = 0; i<placename.length; i++){
	      positions[i]={
	            content: "<div style='font-size:20px;width:150px;text-align:center;'>" + placename[i] + '</div>',
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
		    
		    
		/*  */
		
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
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>