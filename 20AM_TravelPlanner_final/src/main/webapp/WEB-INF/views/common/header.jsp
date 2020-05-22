<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src='https://www.google.com/recaptcha/api.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title }</title>
<!-- 부트스트랩이용하기 -->

<style>
  @import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
  
   #loginBtn{
  margin-top: 15px;
  background-color: #203341;
  color: white;
  border-radius: 5px;
  font-size: 17px;
  height: 38px;
}

#enrollBtn{
  margin-top: 15px;
  background-color: #203341;
  color: white;
  border-radius: 5px;
  font-size: 17px;
  height: 38px;
}

.validation-msg{
	font-size:12px;
	display:none;
	float:right;
}



.logoutBtn{
  background-color: #203341;
  color: white;
  border-radius: 5px;
  font-size: 17px;
  height: 38px;
}
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
            <div class="row">
                <div class="col-sm-1 testDiv"></div>
                <div class="col-sm-2 logoDiv">
                  <img id="mainLogo" src="${path }/resources/images/logo.png" width="200px" height="auto" onclick="location.replace('${path}')"/>
                </div>
                <div class="col-sm-7 testDiv">
                  <ul class="nav">
                    <li class="nav-item">
                      <a class="nav-link menubarLink" href="${path }/hotSpot/hotSpotList.do?area=서울">여행지</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link menubarLink" id="makePlanBtn">일정만들기</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link menubarLink" id="boardBtn">게시판</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link menubarLink" href="#">INFORMATION</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link menubarLink" href="${path }/faq/faqList">FAQ</a>
                    </li>
                    <c:if test="${not empty loginMember }">
						<li class="nav-item">
							<a class="nav-link menubarLink" href="${path }/member/preMyPage">MyPage</a>
						</li>
                    </c:if>
                  </ul>
                </div>
	            <div class="col-sm-2 testDiv">
            	<c:if test='${empty loginMember }'>
					<!-- <button id="loginBtn">로그인</button>-->
					<button id="loginBtn"
						type="button" data-toggle="modal" data-target="#loginModal">
						로그인
					</button>
					<!--<button id="enrollBtn">회원가입</button> -->
					<button id="enrollBtn"
						type="button" data-toggle="modal" data-target="#enrollModal">
						회원가입
					</button>
					</c:if>
					<c:if test='${not empty loginMember }'>
 						<span>
						<c:if test="${loginMember.status == 'Y' }">
							<img src="${path }/resources/images/premium.png" width="40px" height="40px"/>
							<a href="${path }/member/preMyPage">
								<c:out value='${loginMember.memberName }'/>
							</a>님, 안녕하세요!
						</c:if>
						<c:if test="${loginMember.status == 'N' }">
							<a href="${path }/member/preMyPage">
								<c:out value='${loginMember.memberName }'/>
							</a>님, 안녕하세요!
						</c:if>
						</span>
						&nbsp;
						<button class="logoutBtn" type="button"
						onclick="location.replace('${path}/member/logout.do');">로그아웃</button>
					</c:if>
	            </div>
            </div>
        </nav>
<!--             <div class="row">
                <div class="col" style="width: 1366px; background-color: #203341; height: 21px; padding: 0; margin: 0"></div>
            </div> -->
            <hr style="width: 1366px; background-color: #203341; height: 21px; padding: 0; margin: 0; margin-top: 25px;">
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
					  <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#lookPwModal">비밀번호 찾기</button>
					</div>
				</form>
			 </div>
		</div>
	</div>
	
	<!-- 비밀번호 찾기 모달 -->
	<!-- Modal -->
  <div class="modal fade" id="lookPwModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호 찾기</h4>
        </div>
        <div class="modal-body">
          <p>가입시 입력하신 정보를 입력해주세요.</p>
          <form action="${path }/member/lookPw.do" method="post">
	          <input type="text" class="form-control" name="memberName" placeholder="이름" autocomplete="off" required><br>
	          <input type="text" class="form-control" name="memberId" placeholder="아이디" autocomplete="off" required><br>
	          <input type="email" class="form-control" name="email" placeholder="이메일" autocomplete="off" required><br>
	          <input type="submit" class="form-control" value="확인">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
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
						<div class="signup-input-msg">
	                        <span>4-12자 사이의 숫자와 영문자 조합</span>
	                    	<span id="val-id-ok" class="validation-msg" style='color:green;'>사용가능한 아이디입니다.</span>
							<span id="val-id-no" class="validation-msg" style='color:crimson;'>사용할 수 없는 아이디입니다.</span>
	                    </div>
						<br/>
						<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password_" required>
						<div class="signup-input-msg">
	                        <span>8자 이상 16자 이하 영문, 숫자, 특수문자 조합</span>
		                    <span id="val-pass-ok" class="validation-msg" style='color:green;'>안전</span>
							<span id="val-pass-no"class="validation-msg" style='color:crimson;'>위험</span>
	                    </div>
						<br/>
						<input type="password" class="form-control" placeholder="비밀번호확인" id="password2" required>
						<div class="signup-input-msg">
							<span id="val-checkpass-no" class="validation-msg" style='color:crimson;'>비밀번호가 일치하지 않습니다.</span>
						</div>
						<br/>
						<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" required>
						<br/>
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" required>
						<br/>
						<input type="tel" class="form-control" placeholder="(01012341234)" name="phone" id="phone" maxlength="11" required>
						<!-- <input type="text" class="form-control" placeholder="주소" name="address" id="address"> -->
						<!-- 주소 API 받아오기 -->
						<br/>
						<input type="text" name="postCode" id="sample4_postcode" placeholder="우편번호"  required readonly>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<br/>
						<input type="text" name="address" id="sample4_roadAddress" placeholder="도로명주소" style="width:250px; margin-bottom:10px;" required readonly>
						<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
						<span id="guide" style="color:#999;display:none"></span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="addressDetail" id="sample4_detailAddress" placeholder="상세주소" style="width:250px;">
						<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->
						
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
						<input type="button" class="btn btn-outline-success" data-dismiss="modal" value="취소">
					</div>
				</form>
			 </div>
		</div>
	</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    $("#boardBtn").click(function(){
    	if("${loginMember.status}" == "Y"){
    		location.replace("${path}/board/boardList.do");
    	}else if("${loginMember.status}" == "N"){
    		alert("프리미엄 회원만 이용 가능합니다. 마이페이지에서 결제 후 이용해주세요");
    	}else if("${empty loginMember}"){
    		alert("로그인이 필요한 서비스입니다.");
    	}
    })
    
    
    
    //회원가입 유효성 검사
	   function validate(){
	      if(onsubmit_id !=1 || onsubmit_pass!=1 )
	      {
	         return false;
	      }
	      return true;
	   }
	   
	   $(function(){
	      var onsubmit_id = 0;
	      var onsubmit_pass = 0;
	   
	   
	      
	      const password_ = $('#password_').val();
	      const password2 = $('#password2').val();
	      const signupId = $('#memberId_');
	         
	      const validationMsg = $('.validation-msg');
	      const signupInputs = $('.validation-msg').prev();
	      const idAvail = $('#idAvail')
	   
	   
	      $("#memberId_").keyup(function(e) { 
	         if (!(e.keyCode >=37 && e.keyCode<=40)) {
	            var v = $(this).val();
	            $(this).val(v.replace(/[^a-z0-9]/gi,''));
	         }
	      });
	      
	      $('#memberId_').blur(function idCheckAjax(){
	         $.ajax({
	                 url: '<%=request.getContextPath()%>/member/checkId.do',
	                 type: 'post',
	                 //contentType: "application/json",  
	                 data: {memberId : signupId.val()},
	                 dataType:"json",
	                 success: function(result){
	                    if(result.flag == true|| $('#memberId_').val().trim().length<4 || $('#memberId_').val().trim().length>12 ) 
	                       //가입된 아이디가 존재하거나 id길이가 짧거나 긴 경우
	                    {
	                       console.log($('#memberId_').val())
	                       $('#val-id-ok').hide();
	                    $('#val-id-no').show();
	                    onsubmit_id = 0;
	                    }
	                    else
	                       //가입된 아이디가 존재하지 않을 경우
	                    {
	                  $('#val-id-ok').show();
	                  $('#val-id-no').hide();
	                  onsubmit_id = 1;
	                    }
	                 }
	              });
	      });
	      
	      $("#password_").blur(function passwordCheck(){
	         var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	         if(!passwordCheck.test($('#password_').val()))
	         {
	            $("#val-pass-ok").hide();
	            $("#val-pass-no").show();
	            onsubmit_pass = 0;
	         }
	         else
	         {
	            $("#val-pass-ok").show();
	            $("#val-pass-no").hide();
	            onsubmit_pass = 1;
	         }
	      })
	      
	      $('#password2').blur(function passCheck(){
	         if($('#password_').val() == $('#password2').val())
	         {
	            $('#val-checkpass-no').hide();
	         }
	         else
	         {
	            $('#val-checkpass-no').show();
	            /* $('#password2').val(''); */
	            /* alert("비밀번호가 일치하지 않습니다!"); */
	            /* $('#password2').focus(); */
	         }
	      })
	      
	      $("#phone").keyup(function(event){
	          var inputVal = $(this).val();
	          $(this).val(inputVal.replace(/[^0-9]/gi,''));
	      });
	      
	   })
	   
       $("#boardBtn").click(function(){
    	if("${loginMember.status}" == "Y"){
    		location.replace("${path}/board/boardList.do");
    	}else if("${loginMember.status}" == "N"){
    		alert("프리미엄 회원만 이용 가능합니다. 마이페이지에서 결제 후 이용해주세요");
    	}else if("${empty loginMember}"){
    		alert("로그인이 필요한 서비스입니다.");
    	}
    })
    
     function fn_board_btn(){
    	console.log("${loginMember.status}");
    	if("${loginMember.status}" == "Y"){
    		location.replace("${path}/board/boardList.do");
    	}else if("${loginMember.status}" == "N"){
    		alert("프리미엄 회원만 이용 가능합니다. 마이페이지에서 결제 후 이용해주세요");
    	}else if("${empty loginMember}"){
    		alert("로그인이 필요한 서비스입니다.");
    	}
    }
    
    
    
    
    $("#makePlanBtn").click(function(){
    	if(${empty loginMember}){
    		alert("로그인이 필요한 서비스입니다.");
    	}else{
    		location.replace("${path}/iljung.do");
    	}
    })
</script>
