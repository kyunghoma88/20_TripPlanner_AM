<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle" />
</jsp:include>

<style>
.categoryType{
		width:250px;
		margin-left:300px;
		margin-bottom:30px;
	}
	.titleType{
		width: 700px;
		margin-left:300px;
	}
	.contentType{
		width: 700px;
		height: 400px;
		margin-left:300px;
	}
	#submitBtn{
		transform:translate(500%,0);
		margin-bottom: 30px;
	}
	#deleteBtn{
		transform:translate(600%,-218%);
		margin-left: 20px;
	}
</style>
<section>
	<c:if test="${loginMember.memberId eq 'admin'}">
	<form action="${path }/faq/updateFaq" method="post">
		<c:forEach items="${ faq}" var="f">
		<input type="hidden" name="faqNo" value="${f['FAQ_NO'] }">
		<table class="faq-tbl">
			<tr>
				<td><input type="text" class="titleType" name="faqTitle" value="${f['FAQ_TITLE']}" autocomplete="off" required/></td>
			</tr>
			<tr>
					<c:if test='${f["FAQ_CATEGORY" ] eq "회원관리"}'>
					<select class="categoryType" name="faqCategory">
						<option value="회원관리">${f['FAQ_CATEGORY']}</option>
						<option value="이용안내">이용안내</option>
						<option value="결제">결제</option>
					</select>
					</c:if>
					<c:if test='${f["FAQ_CATEGORY"] eq "이용안내"}'>
					<select class="categoryType" name="faqCategory">
						<option value="이용안내">${f['FAQ_CATEGORY']}</option>
						<option value="회원관리">회원관리</option>
						<option value="결제">결제</option>
					</select>
					</c:if>
					<c:if test='${f["FAQ_CATEGORY"] eq "결제" }'>
					<select class="categoryType" name="faqCategory">
						<option value="결제">${f['FAQ_CATEGORY']}</option>
						<option value="회원관리">회원관리</option>
						<option value="이용안내">이용안내</option>
					</select>
					</c:if>
			</tr>
			<tr>
				<td><textarea rows="8" class="contentType" name="faqContent" style="resize:none" required>${f['FAQ_CONTENT']}</textarea></td>
			</tr>
			
		</table>
		</c:forEach>
		<div style="display:flex; margin-top:30px;">
				<div id="blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div id="btn-regist">
					<button class="btn btn-outline-dark" id="submitBtn" style="font-size:25px" type="submit">수정하기</button>
					
				</div>
		</div>
	</form>
	<div style="display:flex; margin-top:30px;">
				<div id="blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div id="btn-regist">
					<c:forEach items="${faq }" var="f">
					<a href="${path }/faq/deleteFaq?faqNo=${f['FAQ_NO']}">
						<button class="btn btn-outline-dark" id="deleteBtn" style="font-size:25px" type="button">삭제하기</button>
					</a>
					</c:forEach>
				</div>
		</div>
	</c:if>
</section>
	<script>
		if("${loginMember.memberId}" != "admin"){
			alert("관리자만 접근 가능한 페이지 입니다");
			location.replace("${path}/faq/faqList");
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />