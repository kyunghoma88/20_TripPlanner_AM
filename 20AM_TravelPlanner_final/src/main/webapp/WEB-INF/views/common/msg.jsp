<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle" />
</jsp:include>


<body>
	<script>
		alert("${msg}");
		if("${not empty loc}"){
			location.replace("${path}${loc}")
		}else if("${not empty referer}")
		{
			location.replace("${referer}");
		}
	</script>


</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />