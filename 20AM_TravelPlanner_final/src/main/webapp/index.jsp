<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 video">
            <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="position: absolute; width: 1366px; z-index: -3; overflow: hidden;">
                <source src="${path }/resources/images/main_video.mp4">
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
                        <img src="${path }/resources/images/searchBtn.png" id="searchBtn">
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
      <img src="${path }/resources/images/jeju.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="${path }/resources/images/everland.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="${path }/resources/images/gyeongpo.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="${path }/resources/images/busan.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="${path }/resources/images/jeonju.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
    <div class="col-sm-4 hotspotContent" onclick="">
      <img src="${path }/resources/images/seoul.jpg" width="300px" height="300px" alt="이미지 없음">
      <p class="bold">title</p>
      <p class="normal">place</p>
      <p class="normal">writer</p>
    </div>
  </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>