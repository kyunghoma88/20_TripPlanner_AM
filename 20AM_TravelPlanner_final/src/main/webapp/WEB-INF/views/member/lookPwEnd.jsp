<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle" />
</jsp:include>

<section>
	<form action="${path}/member/lookPwUpdate" method="post" onsubmit="return checkIt()">
		<input type="password" name="pw" id="changePw" placeholder="변경하실 비밀번호를 입력하세요" class="form-pw"><br>
		<input type="password" name="pw2" id="changePw2" placeholder="비밀번호확인" class="form-pw"><br>
		<div class="" id="checkPw">비밀번호가 일치합니다.</div>
		<div class="" id="checkPw2">비밀번호가 일치하지 않습니다.</div>
		<input type="hidden" name="id" value="${memberId }"/>
		<input type="submit" value="변경하기" id="pwSubmit">
	</form>
</section>
<script>
	$(function(){
		$("#checkPw").hide();
		$("#checkPw2").hide();
		$("#changePw2").keyup(function(){
			var pwd1 = $("#changePw").val();
			var pwd2 = $("#changePw2").val();
			if(pwd1 != "" || pwd2 != ""){ 
				if(pwd1 == pwd2){ 
					$("#checkPw").show(); 
					$("#checkPw2").hide(); 
					$("#submit").removeAttr("disabled");
				}else {
					$("#checkPw").hide();
					$("#checkPw2").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	
	function checkIt(){
		var changePw = document.getElementById("changePw");
		var changePw2 = document.getElementById("changePw2");
		if(changePw.value != changePw2.value){
			alert("비밀번호가 일치하지 않습니다.")
			return false;
		} else{
			alert("비밀번호 변경 완료");
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />