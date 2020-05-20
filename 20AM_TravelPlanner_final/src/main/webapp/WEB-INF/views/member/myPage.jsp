<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<style>
    	section
    	{
    		position: relative;
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
        }

        .mypage-title
        {
            font-size: 35px;
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

        .member-update-wrapper input
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

        .member-update-wrapper input[type="submit"]
        {
            /* background-color: black; */
            /* border: none; */
            /* color: white; */
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
        }
        
        .update-btn-set input{
        
        	margin-right : 10px;
        	height : 40px;
        	width : 65px;
        	font-size : 20px;
        
        }
        
</style>


<section>
	<div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">회원 정보 수정</div>
		</div>
		<div class="mypage-body">
			<div class="member-update-wrapper">

				<form action="${path }/member/memberUpdateEnd.do" method="post" class="member-update-frm" onsubmit="valSubmit_update()" autocomplete="off" enctype="multipart/form-data" >
					<div>
						<div>아이디</div>
						<div>
							<input type="text" name="memberId" id="new-memberId" value="${loginMember.memberId }" readonly="readonly">
						</div>
					</div>
					<div>
						<div>새 비밀번호</div>
						<div>
							<input type="password" name="password" id="new-password">
						</div>
					</div>
					<div>
						<div>새 비밀번호 확인</div>
						<div>
							<input type="password" name="password_" id="new-password-check">
							<!-- <span id="val-checkpass-no-up" class="valid-msg" style='color:crimson;'>비밀번호가 일치하지 않습니다.</span> -->
						</div>
					</div>
					<div>
						<div>이름</div>
						<div>
							<input type="text" name="memberName" id="new-memberName" value="${loginMember.memberName }">
						</div>
					</div>

					<div>
						<div>이메일</div>
						<div>
							<input type="email" name="email" id="new-email" value="${loginMember.email }">
						</div>
					</div>
					<div>
						<div>전화번호</div>
						<div>
							<input type="text" name="phone" id="new-phone" value="${loginMember.phone }" maxlength="11">
						</div>
					</div>
					
					<div>
						<div>주소</div>
						<div>
							
							<input type="text" name="postCode" id="sample4_postcode2" placeholder="우편번호" value="${loginMember.postCode }">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<br/>
							<input type="text" name="address" id="sample4_roadAddress2" placeholder="도로명주소" style="width:450px; margin-bottom:10px;" value="${loginMember.address }">
							
							<span id="guide" style="color:#999;display:none"></span>
							<br/>
							<input type="text" name="addressDetail" id="sample4_detailAddress2" placeholder="상세주소" style="width:450px;" value="${loginMember.addressDetail }">
							
						</div>
					</div>
					
					<div class="update-btn-set">
						<input type="submit" value="수정" class="btn btn-outline-secondary">
						<input id="cancel" type="button" value="취소" class="btn btn-outline-secondary">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="leave" type="button" value="탈퇴" class="btn btn-outline-danger"> 
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
	                document.getElementById('sample4_postcode2').value = data.zonecode;
	                document.getElementById("sample4_roadAddress2").value = roadAddr;
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
	</script>


</section>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>