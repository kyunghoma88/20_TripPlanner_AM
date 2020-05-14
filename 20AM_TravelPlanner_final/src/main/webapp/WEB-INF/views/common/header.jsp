<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=57f292cf81a06c030ca86c61e79b1b56&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css?ver=1.1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css?ver=1.1"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이시국에?</title>
    <link rel="stylesheet" href="css/common.css" type="text/css">
</head>
<body>
<header>
    <nav>
        <div class="row">
            <div class="col-sm-1 testDiv"></div>
            <div class="col-sm-2 testDiv">
              <img id="mainLogo" src="image/logo.PNG" width="200px" height="70px" onclick="location.href='main.html'"/>
            </div>
            <div class="col-sm-8 testDiv">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">여행지</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="${pageContext.request.contextPath }/goiljung.do">일정만들기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">게시판</a>
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
                <img  class="loginBtn" onclick="" src="image/LoginBtn.PNG">
            </div>
        </div>
    </nav>
</header>

