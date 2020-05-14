<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle"/>
</jsp:include>
<body>
	<div id="abcd">
		여행 일수<input type="text" id="days"/><br>
		여행 지역<input type="text" id="place"/>
		<button type="button" id="keepgoing">계획짜기</button>
	</div>
	<script>
		
	$("#keepgoing").click(function(){
		var days = $("#days").val();
		var place = $("#place").val();
		$.ajax({
			url:"${path}/iljung.do",
			data:{
				  "days":days,
				  "place":place	
			},
			type:"post",
			dataType:"html",
			success:function(data){
				$("#abcd").html(data);		
			}
		});
	});
	
	</script>
</body>
</html>