<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- iamport(결제) -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.mypage-container{
	height : 1000px;
}

.mypage-side-bar {
	/* border : 1px solid black; */
	width: 150px;
	margin-left: 80px;
	/* //margin-top : 20px; */
}

.btn-container {
	margin-bottom: 15px;
	margin-left: 25px;
}

.btn-container a {
	font-weight: bolder;
	font-size: 20px;
}

.mypage-wrapper {
	width: 1366px;
	height: auto;
	margin: auto;
	display: flex;
	flex-flow: column nowrap;
	align-self: center;
}

.mypage-header {
	height: 120px;
	display: flex;
	align-items: center;
}

.mypage-title {
	font-size: 35px;
	margin: auto;
	font-weight: bold;
	color: black;
}

#hotspotContainer {
	width: 90%;
	position: relative;
	left: 5%;
	display: flex;
	flex-wrap: wrap;
	font: bold;
	padding: 0px;
	text-align: left;
	margin-bottom: 40px;
}

.hotspotContent {
	cursor: pointer;
	padding-left: 48px;
	margin-bottom: 15px;
	/* border: lightgray 1px solid; */
}

#membershipP{
	font-size : 25px;
	font-weight: bolder;
	color : red;
	transform : translate(20%,-120%);
}

#membershipBtn{
	color : white;
	transform : translate(240%, -250%);
	background-color : #203341;
}

.col-sm-7{
	transform : translate(5%,0);
}
</style>

<div class="mypage-header">
	<div class="mypage-title">유료 회원 서비스</div>
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
	<div class="col-sm-7">
		<img src="${path }/resources/images/membershipView.png"/>
		<br><br><p id="membershipP">프리미엄 회원 전환 후 인기 많은 일정부터<br>내가 원하는 도시의 일정 까지 다양한 일정을 체험해 보세요<br>&nbsp;
		&nbsp;&nbsp;&nbsp;<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="5000" />(평생 이용 가능)</p>
		<button type="button" class="btn btn-warning btn-lg" id="membershipBtn" onclick="fn_membership_btn()">결제하기</button>
	</div>
</div>

<script>
function fn_membership_btn(){
	if("${loginMember.status}" == "Y"){
		alert("이미 프리미엄 회원이십니다.");
	}else if("${loginMember.status}" == "N"){
		var userId = "${loginMember.memberId}";
		var asdf = 'imp94500117';
		var IMP = window.IMP;
		IMP.init(asdf); //가맹점 식별코드
		IMP.request_pay({
			pg:'inicis',
			pay_method: 'card', //결제 방법
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '주문명 : 이시국에 프리미엄 회원 전환',
			amount: '5000',
			buyer_email: 'iamport@siot.do',
			buyer_name: '${loginMember.memberName}',
			buyer_tel: '${loginMember.phone}',
			buyer_addr: '${loginMember.address}',
			buyer_postcode: '${loginMember.postCode}',
			m_redirect_url: '${path}/index.jsp'
		}, function (rsp) {
			if(rsp.success){
				var msg = '결제가 완료되었습니다. 다시 로그인 해주세요.';
				$.ajax({
					type:"post",
					url:"${path}/member/payComplete",
					data:{"userId": userId},
					dataType:"json",
					success:function(data){
						
					}
				})
			} else{
				var msg = '결제에 실패 하였습니다.';
			}
			alert(msg);
			location.replace("${path}/index.jsp");
			location.replace("${path}/member/logout.do");
		})
	}else if("${empty loginMember}"){
		alert("로그인이 필요한 서비스입니다.");
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />