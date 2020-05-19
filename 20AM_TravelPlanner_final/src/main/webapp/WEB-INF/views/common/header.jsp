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
                  <img id="mainLogo" src="${path }/resources/images/logo.png" width="200px" height="auto" onclick="location.replace('${path}')"/>
                </div>
                <div class="col-sm-7 testDiv">
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
                      <a class="nav-link menubarLink" href="${path }/faq/faqList">FAQ</a>
                    </li>
                  </ul>
                </div>
	            <div class="col-sm-2 testDiv">
		                <c:if test='${empty loginMember }'>
						<!-- <button id="loginBtn">로그인</button>-->
						<button class="btn btn-outline-success my-2 my-sm-0"
							type="button" data-toggle="modal" data-target="#loginModal">
							로그인
						</button>
						<!--<button id="enrollBtn">회원가입</button> -->
						<button class="btn btn-outline-success my-2 my-sm-0"
							type="button" data-toggle="modal" data-target="#enrollModal">
							회원가입
						</button>
					</c:if>
					<c:if test='${not empty loginMember }'>
						<span>
							<a href="${path }/member/myPageCheck.do">
								<c:out value='${loginMember.memberName }'/>
							</a>님, 안녕하세요!
						</span>
						&nbsp;
						<button class="btn btn-outline-success my-2 my-sm-0" type="button"
						onclick="location.replace('${path}/member/logout.do');">로그아웃</button>
					</c:if>
	            </div>
            </div>
            <div class="row">
                <div class="col" style="width: 1366px; background-color: #203341; height: 21px;"></div>
            </div>
        </nav>
    </header>
    
    <!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
			    <form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post" autocomplete="off">
					<div class="modal-body">
					<input type="text" class="form-control" name="memberId" placeholder="아이디" required>
					<br />
					<input type="password" class="form-control" name="password" placeholder="비밀번호" required>
					</div>
					<div class="modal-footer">
					  <button type="submit" class="btn btn-outline-success" >로그인</button>
					  <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
					</div>
				</form>
			 </div>
		</div>
	</div>
	
	<!-- 회원가입 모달 -->
	<div class="modal fade" id="enrollModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
			    <form action="${pageContext.request.contextPath}/member/memberEnroll.do" method="post" onsubmit="return validate();" autocomplete="off">
					<div class="modal-body">
						<input type="text" class="form-control" placeholder="아이디" name="memberId" id="memberId_" required>
						<br/>
						<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password_" required>
						<br/>
						<input type="password" class="form-control" placeholder="비밀번호확인" id="password2" required>
						<br/>
						<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" required>
						<br/>
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" required>
						<br/>
						<input type="tel" class="form-control" placeholder="(01012341234)" name="phone" id="phone" maxlength="11" required>
						<!-- <input type="text" class="form-control" placeholder="주소" name="address" id="address"> -->
						<!-- 주소 API 받아오기 -->
						<br/>
						<input type="text" name="postCode" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<br/>
						<input type="text" name="address" id="sample4_roadAddress" placeholder="도로명주소" style="width:250px; margin-bottom:10px;">
						<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
						<span id="guide" style="color:#999;display:none"></span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="addressDetail" id="sample4_detailAddress" placeholder="상세주소" style="width:250px;">
						<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
						
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
						<input type="reset" class="btn btn-outline-success" value="취소">
					</div>
				</form>
			 </div>
		</div>
	</div>
    
