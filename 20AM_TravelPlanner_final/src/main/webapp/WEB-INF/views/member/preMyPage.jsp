<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<%@page import="com.kh.spring.member.model.vo.Member" %>	
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%Member loginMember = (Member)session.getAttribute("loginMember"); %>


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
	
	


	.btn-container{
		margin-bottom: 15px;
    	margin-left: 25px;
	}
	
	.btn-container a{
		font-weight : bolder;
		font-size : 20px;
	}
	
	
	.mypage-wrapper
        {
            width: 1366px;
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
        
        



   	#hotspotContainer{
	    width:90%;
	    position : relative;
	    left: 5%;
	    display: flex;
	    flex-wrap: wrap;
	    font:bold;
	    padding: 0px;
	    text-align: left;
	    margin-bottom: 40px;
	}
	.hotspotContent{
	  cursor: pointer;
	  padding-left: 48px;
	  margin-bottom: 15px;
	  /* border: lightgray 1px solid; */
	}
	
	

</style>

<div class="mypage-header">
	<div class="mypage-title">마이페이지</div>
</div>
	
<div class="row mypage-container">
	
<div class="col-sm-2 mypage-side-bar">

	<%-- <div class="btn-container">
		<a href="${path }/member/preMyPage">내 일정보기</a>
	</div>
	<div class="btn-container">
		<a href="${path }/member/myPageCheck.do">회원정보 수정</a>
	</div>
	<div class="btn-container">
		<a href="#">결제하기</a> 
	</div>
	<div class="btn-container">
		<a href="#">탈퇴하기</a> 
	</div> --%>
	
	
	<div class="list-group">
	  <a href="${path }/member/preMyPage" class="list-group-item list-group-item-action">내 정보보기</a>
	  <a href="${path }/member/myPlan.do?id=${loginMember.memberId}" class="list-group-item list-group-item-action">내 일정보기</a>
	  <a href="${path }/member/myPageCheck.do" class="list-group-item list-group-item-action">회원정보 수정</a>
	  <a href="${path }/member/membership.do" class="list-group-item list-group-item-action">유료서비스 이용</a>
	  <a href="${path }/member/signOut" class="list-group-item list-group-item-action">회원 탈퇴</a>
	
	</div>

</div>
<div class="col-sm-7">

	<form method="POST" name="updateForm" class="form-group">
		<table class="table table-bordered">
		    <tbody>
		        <tr>
		            <td style="width: 100px;">
		                <label for="myPageId">아이디</label>
		            </td>
		            <td style="width: 400px;">
		                <input type="text" name="id" id="myPageId" value="${loginMember.memberId }" style="display:none;">
		              <span>${loginMember.memberId}</span>
		          </td>
		      </tr>
		      <tr>
		          <td>
		              <label for="myPagePwd">이름</label>
		          </td>
		          <td>
		              <%-- <input type="text" name="username" id="myPageUsername" value="${loginMember.memberName}" style="display:none;"> --%>
		              <span>${loginMember.memberName}</span>
		          </td>
		      </tr>
		      
		      <tr>
		          <td>
		              <label for="myPageEmail">이메일</label>
		          </td>
		          <td>
		              <%-- <input type="text" name="email" id="myPageEmail" value="${loginMember.email}" style="display:none;"> --%>
		              <span>${loginMember.email}</span>
		            </td>
		        </tr>
		        <tr>
		          <td>
		              <label for="myPagePhone">전화번호</label>
		          </td>
		          <td>
		              <%-- <input type="text" name="phone" id="myPagePhone" value="${loginMember.phone}" style="display:none;"> --%>
		              <span>${loginMember.phone}</span>
		            </td>
		        </tr>
		        <tr>
		          <td>
		              <label for="myPageAddress">주소</label>
		          </td>
		          <td>
		              <%-- <input type="text" name="address" id="myPageAddress" value="${loginMember.address}" style="display:none;"> --%>
		              <span>${loginMember.address}</span>
		              <%-- <input type="text" name="address" id="myPageAddressDetail" value="${loginMember.addressDetail}" style="display:none;"> --%>
		              <span>${loginMember.addressDetail}</span>
		            </td>
		        </tr>
		    </tbody>
		</table>
	</form>
	

	<%-- <div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">마이페이지</div>
		</div>
		
		<div class="row btn-container">
			
			<a href="${path }/member/preMyPage" class="btn btn-outline-dark">내 일정보기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${path }/member/myPageCheck.do" class="btn btn-outline-dark">회원정보 수정</a>
			
		</div>
	
		<div class="mypage-body">
				
			<div id="hotspotContainer">
			    <c:forEach items="${list }" var="b">
			        <div class="col-sm-4 hotspotContent" onclick="location.replace('${path}/board/boardView.do?no=${b.trSeq}&id=${loginMember.memberId}')">
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
				
				
		</div>
	
	
	</div> --%>
</div>
<div class="col-sm-5"></div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>