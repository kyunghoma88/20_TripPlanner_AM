<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<!-- <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Noto+Sans+KR:wght@700&family=Poor+Story&display=swap" rel="stylesheet"> -->
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


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이시국에?</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css"/>
</head>
<body>
  <header>
    <nav>
        <div class="row">
            <div class="col-sm-1 testDiv"></div>
            <div class="col-sm-2 testDiv">
              <img id="mainLogo" src="${pageContext.request.contextPath }/resources/images/logo.png" width="200px" height="70px" onclick="location.href='main.html'"/>
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
                  <a class="nav-link menubarLink" href="#">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="#">INFORMATION</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link menubarLink" href="${pageContext.request.contextPath }/faq/faqList">FAQ</a>
                </li>
              </ul>
            </div>
            <div class="col-sm-1 testDiv">
                <img  class="loginBtn" onclick="" src="">
            </div>
        </div>
    </nav>
</header>