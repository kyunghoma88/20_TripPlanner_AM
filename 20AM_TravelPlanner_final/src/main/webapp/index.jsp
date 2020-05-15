<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title }</title>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
</style>
<!-- 부트스트랩이용하기 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css"/>
</head>
<body>
  <script>
	$(document).ready(function(){
		$.ajax({
			url: "${path}/main/main.do",
			type: "post",
			success:function(data){
				console.log(data);
					const contain = $("#hotspotContainer");
					for(let i = 0;i < data.length; i++){
						let div = $("<div class='col-sm-4 hotspotContent' onclick=location.replace(\'${path}/board/boardView.do?no=" + data[i]['trSeq'] + "&id=" + data[i]['memberId'] + "\')>");	
 						div.append("<img src='${path}" + data[i]['hotspotAreaImg'] + "'class='boardImg' width='300px' height='300px' alt='이미지 없음' >")
			 			.append("<p class='bold boardTitle'>" + data[i]['tvTitle'] + "</p>")
				 		.append("<p class='normal boardArea'>" + data[i]['hotspotAreaName'] + "</p>")
						.append("<p class='normal boardMemberId'>" + data[i]['memberId'] + "</p>");
						contain.append(div);
					}
				},
			error:function(data){
				console.log(data);
			}
		})
	});
  </script>
  <header>
    <nav>
        <div class="row navBar">
            <div class="col-sm-1 testDiv"></div>
            <div class="col-sm-2 logoDiv">
              <img id="mainLogo" src="${path }/resources/images/logo.PNG" width="200px" height="auto" onclick="location.replace('${path}')"/>
            </div>
            <div class="col-sm-7 testDiv">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">여행지</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="${path}/goiljung.do">일정만들기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="${path}/board/boardList.do">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">INFORMATION</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">FAQ</a>
                </li>
              </ul>
            </div>
            <div class="col-sm-2 testDiv">
				<button id="loginBtn">로그인</button>
				<button id="enrollBtn">회원가입</button>
            </div>
        </div>
    </nav>
</header>
    <div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 video">
            <video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="position: absolute; width: 1366px; z-index: -3; overflow: hidden;">
                <source src="${path }/resources/images/video.mp4">
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
                        <img src="${path }/resources/images/searchBtn.PNG" id="searchBtn">
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
  <div id="hotspotContainer">
  	
  </div>
  <div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
      <center>
        <button id="goBoardBtn">더 많은 여행일정 보기</button>
      </center>
    </div>
    <div class="col-sm-3"></div>
  </div>
  <script>
  	
  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>