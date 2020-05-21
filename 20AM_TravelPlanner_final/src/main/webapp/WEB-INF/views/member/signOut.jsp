<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="mypage-header">
	<div class="mypage-title">마이페이지</div>
</div>

<div class="row mypage-container">

	<div class="col-sm-2 mypage-side-bar">
		<div class="list-group">
		  <a href="${path }/member/preMyPage" class="list-group-item list-group-item-action">내 일정보기</a>
		  <a href="${path }/member/myPageCheck.do" class="list-group-item list-group-item-action">회원정보 수정</a>
		  <a href="#" class="list-group-item list-group-item-action">유료서비스 이용</a>
		  <!-- 20200520  회원탈퇴 수정중 -->
		  <a href="${path }/member/signOut.do" class="list-group-item list-group-item-action">회원 탈퇴</a>
		
		</div>
	</div>

	<div class="col-sm-7 section">
		<div class="mypage-wrapper">
			
			<div class="mypage-span">
				<span>${loginMember.memberName }</span>님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해주세요.
			</div>
			<div class="mypage-body">
				<div class="member-update-wrapper">
					<form action="${path }/member/signOutEnd.do" method="post" class="member-update-frm" autocomplete="off" enctype="multipart/form-data" >
						<div class="form-group">
							<input type="text" class="form-control" value="${loginMember.memberId }" name="memberId" readonly="readonly">
						</div>
						<div class="form-group">
					      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
					    </div>
	
						<div class="update-btn-set">
							<input type="submit" class="btn btn-primary" value="탈퇴하기">
							<input type="button" id="cancel" class="btn btn-secondary" value="취소"> 
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-5"></div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>