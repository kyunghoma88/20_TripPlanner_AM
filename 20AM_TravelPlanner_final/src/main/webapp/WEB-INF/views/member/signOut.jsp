<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>

	.mypage-container{
			height : 1000px;
		}
	

	.mypage-side-bar{
			/* border : 1px solid black; */
			width : 150px;
			margin-left : 80px;
			/* //margin-top : 20px; */
		}

    	.section
    	{
    		position: relative;
    		height: 500px;
    	}
    	
		.mypage-wrapper
        {
            width: 650px;
            height: auto;
            margin : auto;
            display: flex;
            flex-flow: column nowrap;
            align-self: center;
        }

        .mypage-header
        {
            height: 120px;
            display: flex;
            align-items: center;
        }

        .mypage-title
        {
            font-size: 35px;
            margin: auto;
            font-weight: bold;
            color: black;
        }
              
       
        .mypage-span
        {
            width: 100%;
            
            margin-bottom : 70px;
            position: relative;
            text-align: center;
            align-self: center;
        }
        
        .mypage-span > span
        {
        	font-size: 22px;
        	color : #4582EC;
        }

        .mypage-span
        {
            flex: 1 1 0;
            align-items: center;
            justify-content: center;
        }
        
        .member-update-wrapper
        {
            font-family: 'Noto Sans KR';
            width: 100%;
            position: relative;
            
        }

        .member-update-header
        {
            font-size: 25px;
            margin: 30px 0;
            /* border-bottom: 2px solid rgb(42, 71, 114); */
            padding-bottom: 25px;
        }

     	.member-update-frm
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
        }
        
        .form-group
        {
        	width : 50%;
        	align-self: center;
        	margin : 0 0 7px 0;
        }
        
        .update-btn-set
        {
        	margin-top : 25px;
        	position : relative;
        	align-self: center;
        }
	



</style>



<div class="mypage-header">
	<div class="mypage-title">회원탈퇴</div>
</div>

<div class="row mypage-container">

	<div class="col-sm-2 mypage-side-bar">
		<div class="list-group">
		  <a href="${path }/member/preMyPage" class="list-group-item list-group-item-action">내 정보보기</a>
		  <a href="${path }/member/myPlan?id=${loginMember.memberId}" class="list-group-item list-group-item-action">내 일정보기</a>
		  <a href="${path }/member/myPageCheck.do" class="list-group-item list-group-item-action">회원정보 수정</a>
		  <a href="${path }/member/membership.do" class="list-group-item list-group-item-action">유료서비스 이용</a>
		  <a href="${path }/member/signOut" class="list-group-item list-group-item-action">회원 탈퇴</a>
		
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
							<input type="submit" class="btn btn-outline-danger" value="탈퇴">
							<a class="btn btn-outline-dark" href="${path }/member/preMyPage">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-5"></div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>