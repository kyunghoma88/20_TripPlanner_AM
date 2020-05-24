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
		

		.memberText{
			color : rgb(70, 70, 255);
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
    		margin-left : 100px;
    	}
    	
		.mypage-wrapper
        {
            width: 850px;
            height: auto;
            margin : auto;
            display: flex;
            flex-flow: column nowrap;
            align-self: center;
        }

        .mypage-header
        {
            height: 100px;
            display: flex;
            align-items: center;
            height : 120px;
        }

        .mypage-title
        {
            font-size: 25px;
            margin: auto;
            font-weight: bold;
            color: black;
        }
              
       
        
        .member-update-wrapper
        {
            font-family: 'Noto Sans KR';
            width: 100%;
            
        }

        .member-update-header
        {
            font-size: 25px;
            margin: 30px 0;
            /* border-bottom: 2px solid rgb(42, 71, 114); */
            padding-bottom: 25px;
        }

        .member-update-wrapper input[type:text]
        {
            font-family: 'Noto Sans KR';
            border: 1px solid #ccc;
            padding: 5px;
            box-sizing: border-box;
            border-radius: 2px;
        }

        #member-id
        {
            background-color: lightgray;
        }

        .member-update-frm
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
        }

        .member-update-frm > div
        {
            display: flex;
            align-items: center;
            position: relative;
        }

        .member-update-frm > div > div
        {
            padding: 15px;
        }

        .member-update-frm > div > div:nth-of-type(1){flex: 1 1 0; align-self: flex-start;}
        .member-update-frm > div > div:nth-of-type(2){flex: 4 1 0;}
        

        .valid-msg
        {
            font-size: 13px;
			display:none;
			float:right;
        }

        
        .update-btn-set
        {
            width: 502px;
            display: flex;
            justify-content: center;
            margin: 30px 0;
            margin-left : 50px;
        }
        
        .update-btn-set input{
        
        	margin-right : 10px;
        }
        
        .leave-btn{
        	margin-left : 30px;
        	width : 525px;
        }
        
</style>


<div class="mypage-header">
	<div class="mypage-title"><span class="memberText"><c:out value='${loginMember.memberName }'/></span>님이 작성하신 여행 계획</div>
</div>
<div class="row mypage-container">
	<div class="col-sm-2 mypage-side-bar">
		<div class="list-group">
		  <a href="${path }/member/preMyPage" class="list-group-item list-group-item-action">내 정보보기</a>
		  <a href="${path }/member/myPlan.do?id=${loginMember.memberId}" class="list-group-item list-group-item-action">내 일정보기</a>
		  <a href="${path }/member/myPageCheck.do" class="list-group-item list-group-item-action">회원정보 수정</a>
		  <a href="${path }/member/membership.do" class="list-group-item list-group-item-action">유료서비스 이용</a>
		  <a href="${path }/member/signOut" class="list-group-item list-group-item-action">회원 탈퇴</a>
		</div>
	</div>
	
	<div class="col-sm-7 section">
		<div class="mypage-wrapper">
			<div class="mypage-body">
				<div class="member-update-wrapper">
					
					<table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th>게시글 번호</th>
					        <th>제 목</th>
					        <th>지역</th>
					      </tr>
					    </thead>
					    <tbody>
					    	<c:forEach items="${list }" var="my">
					    		<tr>
						    		<td>${my.trSeq }</td>
						    		<td><a href="${path }/board/boardView.do?no=${my.trSeq}&id=${loginMember.memberId}">${my.tvTitle }</a></td>
						    		<td>${my.hotspotAreaName }</td>
					    		</tr>
					    	</c:forEach>
					    
					      <!-- <tr>
					        <td>John</td>
					        <td>Doe</td>
					        <td>john@example.com</td>
					      </tr>
					      <tr>
					        <td>Mary</td>
					        <td>Moe</td>
					        <td>mary@example.com</td>
					      </tr>
					      <tr>
					        <td>July</td>
					        <td>Dooley</td>
					        <td>july@example.com</td>
					      </tr> -->
					    </tbody>
					  </table>
					  <div>
					  	${pageBar }
					  </div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-sm-5"></div>
	



</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>