<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지처리</title>
</head>
<body>
	<script>
		if('${not empty msg}'== 'true'){
			/* ==true 안해주면 무조건 true겠지!? 헷갈리면 다시 질문! */
			alert("${msg}");
		}
		if('${not empty loc}'){
			location.replace("${pageContext.request.contextPath}${loc}");
		}else if('${not empty referer}'){
			location.replace("${referer}")
		}
	</script>
</body>
</html>