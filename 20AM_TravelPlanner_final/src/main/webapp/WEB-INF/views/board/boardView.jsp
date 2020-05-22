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
    
    .allbtn{
      margin-top: 15px;
	  background-color: #203341;
	  color: white;
	  border-radius: 5px;
	  font-size: 17px;
	  height: 38px;
  }
   
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment{width:1160px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width:100px;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr.level2 {color:gray; font-size: 16px;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:20px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:15px}
    table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
    table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff;font-size:20px}
    table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a;font-size:15px}
    
    #comment-container{
    	margin-top: 80px;
	    margin-bottom: 50px;
	    text-align: right;
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
      <div class="col-sm-4" id="testContent">
     	<c:forEach var="v" begin="1" end="${date}">
	        <c:set var="whatDay" value="${v }"/>
         	<button type="button" class="dayBtn" id="dayBtn${v }" onclick="fn_boardDetail(this, '${board.trSeq}', '${whatDay }');">Day${v }</button><br>
   		</c:forEach>
      </div>
      <div class="col-sm-1">
      	<button id="likeBtn" style="display:inline-block" onclick="like_fn('${board.trSeq}')"><img src="${path }/resources/images/LIKE0.png" id="like_img" width="50px" height="20x"><span></span></button>
      </div>
      <div class="col-sm-5">
        <div id="map" style="border: 1px solid black; height: 380px; width: 565px">
        </div>
      </div>
      <div class="col-sm-1"></div>
    </div>
    <div class="row">
    	<div class="col-sm-1"></div>
    	<div class="col-sm-10">
			<div id="comment-container">
	   			<div class="comment-editor">
  					<c:if test="${loginMember.memberId eq board.memberId}">
  						<button class="allbtn">게시물 수정</button>
  					</c:if>
	   				<form action="${path }/board/boardCommentInsert.do" method="post">
	   					<c:if test="${not empty loginMember}">
	   						<input style="width: 250px;" type="text" name="commentContent" placeholder="댓글"/>
	   						<button type="submit" class="allbtn" id="btn-insert">등록</button>
	   					</c:if>
	   					<c:if test="${empty loginMember}">
	   						<b style="width: 250px;">댓글을 남기려면 로그인을 해주세요.</b>
	   					</c:if>
	   					<c:if test="${loginMember.memberId eq board.memberId}">
	   						<button class="allbtn" id="crystal">게시물 수정</button>
	   					</c:if>
	   					<input type="hidden" name="no" value="${board.trSeq }"/>
	   					<input type="hidden" name="id" value="${board.memberId }"/>
	   					<input type="hidden" name="commentWriter" value="${loginMember.memberId}"/>
	   					<input type="hidden" name="commentLevel" value="1"/>
	   					<input type="hidden" name="commentRef" value="0"/>
	   				</form>
	   			</div>
   			</div>
   			<!-- 댓글출력하기 -->
			<table id="tbl-comment">
			<c:if test="${empty comment or comment eq null}">
				<b>등록된 댓글이 없습니다.</b>
			</c:if>
   			<c:if test="${not empty comment or comment ne null}">
   				<c:forEach items="${comment }" var="bc">
   					<c:if test="${bc['boardCommentLevel'] eq '1' }">
						<tr class="level1">
		   					<td>
		   						<sub class="comment-writer">${bc['boardCommentWriter'] }</sub>
		   						<sub class="comment-date">${bc['boardCommentDate'] }</sub>
		   						<br/>
		   						${bc['boardCommentContent']}
		   					</td>
   							<td>
   								<c:if test="${not empty loginMember}">
		   							<button type="button" class="allbtn btn-reply" value="${bc.boardCommentNo}">답글</button>
		   						</c:if>
		   					</td>
		   				</tr>
   					</c:if>
   					<c:if test="${bc.boardCommentLevel eq '2'}">
   						<tr class="level2">
		   					<td>
		   						<sub class="comment-writer">${bc.boardCommentWriter }</sub>
		   						<sub class="comment-date">${bc.boardCommentDate }</sub>
		   						<br/>
		   						${bc.boardCommentContent}
		   					</td>
   							<td></td>
   						</tr>
   					</c:if>
   				</c:forEach>
   			</c:if>
   		</table>
    	</div>
    </div>
	<script>
	$(document).ready(function(){
 		var memberId = ${board.memberId};
 		
 	})


	function like_fn(trSeq){
		console.log(trSeq);
		/* console.log(memberId); */
		$.ajax({
			url:"boardLike.do",
			data:{"trSeq":trSeq},
			success:function(data){
				alert("dd");
			}
		})
	}


	
	
	
	
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
		
		
		$(".btn-reply").click(function(){
			if("${not empty loginMember}"){
				const tr = $("<tr>");
				const td = $("<td>").css({"display" : "none", "text-align" : "left"}).attr("colspan", 2);
				const form = $("<form>").attr({"action" : "${path}/board/boardCommentInsert.do","method" : "post"});
				const no = $("<input>").attr({"type" : "hidden", "name" : "no", "value" : "${board.trSeq}"});
				const id = $("<input>").attr({"type" : "hidden", "name" : "id", "value" : "${board.memberId }"});
				const writer = $("<input>").attr({"type" : "hidden","name" : "commentWriter","value" : "┖ ${loginMember.memberId}"});
				const level = $("<input>").attr({"type" : "hidden", "name" : "commentLevel", "value" : "2"});
				const commentRef = $("<input>").attr({"type" : "hidden", "name" : "commentRef", "value" : $(this).val()});
				const commentContent = $("<input>").attr({"type" : "text", "name" : "commentContent"});
				const btn = $("<button>").attr({"type" : "submit", "class" : "btn-insert2"}).html("등록");
				
				form.append(no).append(id).append(writer).append(level).append(commentRef).append(commentContent).append(btn);
				td.append(form);
				tr.append(td);
				($(this).parent().parent()).after(tr);
				tr.children("td").slideDown(50);
			}
		});

		console.log("${board.tvTitle }");
		console.log("${board.trSeq}");
		
		var memberId = "${loginMember.memberId }";
		var tvTitle = "${board.tvTitle }";
		var trSeq = "${board.trSeq}";
		/* $("#crystal").click(function(){
			$.ajax({
				url:"${path}/iljung/iljungcrystal.do",
				data:{
					memberId:memberId,
					tvTitle:tvTitle,
					trSeq:trSeq
				},
				type:"post",
				dataType:"json",
				success:function(data){
					
				}
			});
		}); */
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>