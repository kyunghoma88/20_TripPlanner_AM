<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/iljung.css?ver.2.0"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<div id="abcd">

</div>

<script>
	var memberId = "${loginMember.memberId }";
	console.log(memberId);
	$(document).ready(function(){
		$.ajax({
			url:"${path}/iljung/iljungcrystal.do",
			data:{
				memberId:memberId,
				
			},
			type:"post",
			contentType:"application/json;charset=UTF-8",
			dataType:"json",
			success:function(data){
				
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>