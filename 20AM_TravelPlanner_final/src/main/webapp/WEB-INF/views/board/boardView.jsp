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
            <div class="boardTitle" style="margin-top: 250px;">
                <div><c:out value="${board.tvTitle }"/></div>
                <div>${board.memberId }</div>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
    <div class="row boardContent">
      <div class="col-sm-1"></div>
      <div class="col-sm-7" id="testContent">
     	<c:forEach var="v" begin="1" end="${date}">
	        <c:set var="whatDay" value="${v }"/>
         	<button type="button" class="dayBtn" id="dayBtn${v }" onclick="fn_boardDetail(this, '${board.trSeq}', '${whatDay }');">Day${v }</button><br>
   		</c:forEach>
      </div>
      <div class="col-sm-3">
        <div style="border: 1px solid black;">
          지도
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
					table.append("<tr><td class='imageTd' rowspan='2'><img src='${path }" + data[i]['hotspotImg'] + "' alt='이미지 없음' height='70px' width='auto'></td><td>" + data[i]['hotspotName'] + "</td></tr>")
					.append("<tr><td class='commentTr'>" + data[i]['comment'] + "</td></tr>");
				}
				$(el).next($(".contentTbl")).toggle();
				$(el).after(table);
			}
		}) 
	};
	
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>