<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
    .headPhoto{
        border: 1px solid black;
        background-color:black;
        width: 100%;
        margin-top: 50px;
    }

    .boardTitle{
      margin-top: 250px;
      margin-left: 50px;
      color: white;
      font-size: 30px;
    }

    .boardContent{
      margin-top: 50px;
      font-size: 25px;
    }

    .imageTd{
      width: 100px;
    }

    .dayBtn{
      color: white;
      background-color: #203341;
    }
    
/*     .contentTbl{
    	display: none;
    } */

</style>

    <div class="row">
       <div class="col-sm-1"></div>
       <div class="col-sm-10 headPhoto">
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
	        <%-- <button type="button" class="dayBtn">DAY${v }</button><br> --%>
	        <c:set var="please" value="${v }"/>
         	<button type="button" class="btnbtn" onclick="fn_test('${board.trSeq}', '${please }');">test${v }</button><br>
   		</c:forEach>
      </div>
      <div class="col-sm-3">
        <div style="border: 1px solid black;">
          지도
        </div>
      </div>
      <div class="col-sm-1"></div>
    </div>
<!--     <script>
		$(document).ready(function(){
	    	  $(".dayBtn").click(function(){
	    	    $(this).next().next($(".contentTbl")).toggle();
    	  });
    	});
	</script> -->
	<script>
	 	 function fn_test(seq, please){
			$.ajax({
				url : "${path}/test/test.do",
				type : "post",
				data : {"no" : seq, "date" : please},
				success:function(data){
					const table = $("<table class='contentTbl'>");
					for(let i=0; i<data.length; i++){
						table.append("<tr><td class='imageTd' rowspan='2'><img src='${path }" + data[i]['hotspotImg'] + "' alt='이미지 없음' height='70px' width='auto'></td><td>" + data[i]['hotspotName'] + "</td></tr>")
						.append("<tr><td>" + data[i]['comment'] + "</td></tr>");
						$("#testContent").next($(".btnbtn")).append(table);
					}
				}
			}) 
		};
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>