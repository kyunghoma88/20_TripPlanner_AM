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
		여행 지역
		<select name="place" id='place'>
		    <option value="">지역선택</option>
		    <option value="서울">서울</option>
		    <option value="강릉">강릉</option>
		    <option value="대전">대전</option>
		    <option value="전주">전주</option>
		    <option value="부산">부산</option>
		</select>
		<button type="button" id="keepgoing2">계획짜기</button>
	</div>
	<script>
		
	$("#keepgoing2").click(function(){
		var days = $("#days").val();
		var place = $("#place").val();
		if(!days == '' && !place ==''){
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
		}else if(days.trim() == '' && place.trim() == ''){
			alert('입력값을 전부 입력해주세요.');
		}else if(place.trim() == ''){
			alert('여행지역을 선택해주세요.')
		}else{
			alert('여행일수를 입력해주세요.');
		}
	});
	
	</script>
</body>
</html>