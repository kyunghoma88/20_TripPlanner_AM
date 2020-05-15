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
	
</style>
<section>
	<form action="${path }/faq/faqWriteEnd" method="post">
		<table class="faq-tbl">
			<tr>
				<td><input type="text" class="titleType" placeholder="제목을 입력하세요" name="faqTitle" autocomplete="off" required/></td>
			</tr>
			<tr>
				<select class="categoryType" name="faqCategory">
					<option value="">카테고리 선택</option>
					<option value="회원관리">회원</option>
					<option value="이용안내">이용안내</option>
					<option value="결제">결제</option>
				</select>
			</tr>
			<tr>
				<td><textarea rows="8" class="contentType" placeholder="내용을 입력하세요" name="faqContent" style="resize:none" required></textarea></td>
			</tr>
		</table>
		
		<div style="display:flex; margin-top:30px;">
				<div id="blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div id="btn-regist">
					<button class="btn btn-outline-dark" id="submitBtn" style="font-size:25px" type="submit">등록하기</button>
				</div>
		</div>
	</form>
	
	<script>
      
    </script>
</section>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />