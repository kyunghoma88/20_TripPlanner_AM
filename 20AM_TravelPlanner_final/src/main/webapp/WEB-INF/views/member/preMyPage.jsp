<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>

	.btn-container{
		margin-bottom: 35px;
    	margin-left: 120px;
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

<section>
	<div class="mypage-wrapper">
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
	
	
	</div>
</section>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>