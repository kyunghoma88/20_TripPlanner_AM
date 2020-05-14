<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<section id="content">	
	<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 video">
            <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="position: absolute; width: 1366px; z-index: -3; overflow: hidden;">
                <source src="${pageContext.request.contextPath }/resources/images/main.mp4">
            </video>
            <center>
              <div class="form-group" id="searchBox">
                <table style="width: 750px;">
                  <tr>
                    <form>
                      <td style="height: 38px;">
                        <input type="text" class="form-control" id="search">
                      </td>
                    </form>
                      <td style="height: 38px;">
                        <img src="" id="searchBtn">
                      </td>
                    </tr>
                  </table>
                </div>
            </center>
        </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12 hotspotTitle">인기 여행일정</div>
  </div>
  <div class="hotspotContainer">
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/jeju.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/everland.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/kungpo.webp" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/busan.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/jeonju.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="image/seoul.jpeg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>