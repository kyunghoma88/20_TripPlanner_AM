<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<style>
	    #searchBoardBtn{
	        color: white;
	        background-color: #203341;
	        border-radius: 4px;
	    }
	
	    .navbar{
	        border-bottom: 1px dotted #203341;
	    }
	
	    #moreBoardViewBtn{
	        margin-bottom: 80px;
	        color: white;
	        background-color: #203341;
	        width: 300px;
	        border-radius: 5px;
	        font-size: 20px;
	        height: 50px;
	    }
	</style>
    <div class="row">
       <div class="col-sm-12 hotspotTitle">여행일정 게시판</div>
    </div>
    <div class="row">
        <div class="col-sm-8"></div>
        <div class="col-sm-4" style="margin-bottom: 20px; padding-left: 20px;">
            <div>
                <input placeholder="작성자, 게시물 제목으로 검색" style="width: 250px;" type="text" name="boardSearchBox" id="boardSearchBox">
                <button id="searchBoardBtn">검색</button>
            </div>
        </div>
    </div>
    <div id="hotspotContainer">
    <c:forEach items="${list }" var="b">
        <div class="col-sm-4 hotspotContent" onclick="location.replace('${path}/board/boardView.do?no=${b.trSeq}')">
            <img src="${path}${b.hotspotAreaImg }" width="300px" height="300px" alt="이미지 없음">
            <p class="bold">${b.tvTitle }</p>
            <p class="normal">${b.hotspotAreaName }</p>
            <p class="normal">${b.memberId }</p>
        </div>
    </c:forEach>
    </div>
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
          <center>
            <div>
            	${pageBar }
            </div>
          </center>
        </div>
        <div class="col-sm-3"></div>
      </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>