<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>   
  <footer>
      <div class="row footer" style="margin-top: 40px;">
          <div class="col-sm-1 footer"></div>
          <div class="col-sm-2 footer">
              <ul style="list-style: none;">
                  <li>
                    <a href="${path }/hotSpot/hotSpotList.do?area=서울">여행지</a>
                  </li>
                  <li>
                    <p class="makePlanBtn">일정 만들기</p>
                  </li>
                  <li>
                    <p class="boardBtn">게시판</p>
                  </li>
              </ul>
          </div>
          <div class="col-sm-2 footer">
              <ul style="list-style: none;">
              </li>
              <li>
                <a href="${path}/information.do">INFORMATION</a>
              </li>
              <li>
                <a href="${path }/faq/faqList">FAQ</a>
              </li>
              </ul>
          </div>
          <div class="col-sm-7 footer"></div>
      </div>
      <div class="col footer" style="text-align: center; color: white;">Copyright ⓒ 2020 eSigukea.com, All Rights Reserved.</div>
      <script>
	      $(".boardBtn").click(function(){
	      	if("${loginMember.status}" == "Y"){
	      		location.replace("${path}/board/boardList.do");
	      	}else if("${loginMember.status}" == "N"){
	      		alert("프리미엄 회원만 이용 가능합니다. 마이페이지에서 결제 후 이용해주세요");
	      	}else if("${empty loginMember}"){
	      		alert("로그인이 필요한 서비스입니다.");
	      	}
	      })
	      
	      $(".makePlanBtn").click(function(){
	      	if(${empty loginMember}){
	      		alert("로그인이 필요한 서비스입니다.");
	      	}else{
	      		location.replace("${path}/iljung.do");
	      	}
	      })
      </script>
  </footer>
</body>
</html>