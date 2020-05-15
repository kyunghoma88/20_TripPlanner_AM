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
    
    .contentTbl{
    	display: none;
    }

</style>

    <div class="row">
       <div class="col-sm-1"></div>
       <div class="col-sm-10 headPhoto">
            <div class="boardTitle" style="margin-top: 250px;">
                <div>${board['TV_TITLE'] }</div>
                <div>${board['MEMBER_ID'] }</div>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
    <div class="row boardContent">
      <div class="col-sm-1"></div>
      <div class="col-sm-7">
      <c:forEach var="v" begin="1" end="${board['DAY'] }">
        <button class="dayBtn">DAY-${v }</button><br>
        <table class="contentTbl">
          <tr>
            <td class="imageTd">
            	<img src="${path }${board['PLACE_IMG'] }" alt="이미지 없음" height="70px" width="auto">
            </td>
            <td>${board['HOTSPOT_NAME'] }</td>
          </tr>
        </table>
      </c:forEach>
      </div>
      <div class="col-sm-3">
        <div>
          지도
        </div>
      </div>
      <div class="col-sm-1"></div>
    </div>
    <script>
		$(document).ready(function(){
	    	  $(".dayBtn").click(function(){
	    	    $(this).next().next($(".contentTbl")).toggle();
    	  });
    	});
				</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>