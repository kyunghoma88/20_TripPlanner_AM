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
<!-- 부트스트랩이용하기 -->

<style>
  @import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57f292cf81a06c030ca86c61e79b1b56&libraries=services,clusterer,drawing"></script>
</head>
<body>
    <header>
        <nav>
            <div class="row navBar">
                <div class="col-sm-1 testDiv"></div>
                <div class="col-sm-2 logoDiv">
                  <img id="mainLogo" src="${path }/resources/images/logo.PNG" width="200px" height="auto" onclick="location.replace('${path}')"/>
                </div>
                <div class="col-sm-8 testDiv">
                  <ul class="nav">
                    <li class="nav-item">
                      <a class="nav-link menubarLink" href="#">여행지</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link menubarLink" href="#">일정만들기</a>
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
	            <div class="col-sm-1 testDiv">
	                <button id="loginBtn">로그인</button><button id="enrollBtn">회원가입</button>
	            </div>
            </div>
            <div class="row">
                <div class="col" style="width: 1366px; background-color: #203341; height: 21px;"></div>
            </div>
        </nav>
    </header>