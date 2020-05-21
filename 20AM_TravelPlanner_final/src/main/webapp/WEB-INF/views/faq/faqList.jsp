<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<fmt:formatDate pattern="yyyy-mm-dd" value="${f['FAQ_DATE'] }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="pageTitle" />
</jsp:include>

<style>
#pTop {
	font-size: 40px;
	font-weight: bolder;
	transform: translate(10%, 0);
}

#searchSp p {
	transform: translate(10%, 0);
}

#searchSp h4 {
	transform: translate(10%, 0);
}

#searchcontent {
	margin-left: 10%;
}

#divHeader {
	border-bottom: 1px solid black;
	margin-bottom: 10px;
}

#faqTop {
	margin-right: 300px;
	margin-left: 25px;
	font-weight: bolder;
}

#contents {
	list-style: none;
	width: 100%;
}

#category {
	float: left;
	width: 160px;
	text-align: center;
	font-weight:bolder;
}

#title {
	text-align: left;
	width: 500px;
	float: left;
	font-weight:bolder;
}
#date{
	font-weight:bolder;
}

ul {
	padding-inline-start: 0px;
}

#spanCt {
	display: none;
	height: auto;
	padding: 0px;
	position: absolute;
	z-index: 200;
}

#faqContent {
	list-style: none;
}

#title:hover #faqContent ul li span {
	
}

#btnTitle {
	background-color: white;
	border-color: white;
	color: black;
	border:0;
	outline:0;
}

#btnTitle:visited {
	border: none;
}
.content{
	text-align:left;
	/* transform:translate(50%,0); */
	margin-left:160px;
	width:400px;
	color:chocolate;
}
.image_button{
	transform:translate(-480%,-30%);
	float:right;
	border:0;
	outline:0;
	background:white;
	margin-right:10px;
}
.categoryC{
	color:#002266;
}
</style>
<section>
	<br>
	<p id="pTop">자주 묻는 질문</p>
	<span><a href="${path }/faq/infoFaq" class="image_button categoryC">이용안내</a></span>
	<span><a href="${path }/faq/cashFaq" class="image_button categoryC">결제</a></span>
	<span><a href="${path }/faq/memberFaq" class="image_button categoryC">회원관리</a></span>
	<br> <span id="searchSp">
		<h4>도움말 검색</h4>
		<p>키워드로 빠르게 도움말을 찾아보실 수 있습니다.</p>
	</span> <span id="searchcontent"> <input type="text" size="20px"
		id="searchSp" placeholder="키워드 입력" name="keyword" />
		<button type="submit" onclick="fn_search_btn(1);">검색</button>
	</span>

	<div class="container" id="tbl_container">
		<table class="table table-hover" id="tbl_faq">
			<thead>
				<div id="divHeader">
					<span id="faqTop">카테고리</span> <span id="faqTop">제목</span> <span
						id="faqTop">작성일</span>
				</div>
			</thead>
			<c:forEach items="${list }" var="f">
				<ul>
					<li id="contents">
						<span id="category">
							<c:out value="${f['FAQ_CATEGORY'] }" />
						</span>
						<button type="button" id="btnTitle">
							<span id="title">
							<c:out value="${f['FAQ_TITLE'] }" /> 
							</span>
						</button>
						<span id="date"><c:out value="${f['FAQ_DATE'] }" />
								<c:if test="${loginMember.memberId eq 'admin' }">
									<a href="${path }/faq/editFaq?faqNo=${f['FAQ_NO']}">편집</a>
								</c:if>
						</span>
						<ul id="faqContent">
							<li>
								<div id="demo" class="content">
									<c:out value="${f['FAQ_CONTENT'] }" />
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</table>
		<c:if test="${loginMember.memberId eq 'admin' }">
		<div>
			<form action="${path }/faq/faqWrite" method="get">
				<button type="submit" id="writeBtn">글쓰기</button>
			</form>
		</div>
		</c:if>
	</div>
	<div id="page-container">${pageBar }</div>
</section>
<script>
	
	function fn_search_btn(cPage){
		var keyword = $("input[name=keyword]").val();
		$.ajax({
			url:"${path}/faq/searchFaq",
			type:"get",
			data:{cPage:cPage,
				"keyword":keyword},
			success:function(data){
				$("#tbl_faq, #page-container").hide();
				$("#tbl_container").html(data);
			}
		})
		
	}
	$("#btnTitle").next().next().children().children().hide(); // content 5
	var ct4 = $("#divHeader").next().next().children().children().children().children().hide(); // content 4
	var ct3 = $("#divHeader").next().next().next().children().children().children().children().hide(); // content 3
	var ct2 = $("#divHeader").next().next().next().next().children().children().children().children().hide(); // content 2
	var ct1 = $("#divHeader").next().next().next().next().next().children().children().children().children().hide(); // content 1
	
	console.log($("#divHeader").next().next().children().children("#btnTitle").text()); // title4 버튼
	
	var btn4 = $("#divHeader").next().next().children().children("#btnTitle");
	var btn3 = $("#divHeader").next().next().next().children().children("#btnTitle");
	var btn2 = $("#divHeader").next().next().next().next().children().children("#btnTitle");
	var btn1 = $("#divHeader").next().next().next().next().next().children().children("#btnTitle");
	
	
	$("#btnTitle").click(function(){
		$(this).next().next().children().children().slideToggle();

	});
	
	btn4.click(function(){
		ct4.slideToggle();
	})
	
	btn3.click(function(){
		ct3.slideToggle();
	})
	
	btn2.click(function(){
		ct2.slideToggle();
	})
	
	btn1.click(function(){
		ct1.slideToggle();
	})
</script>









<jsp:include page="/WEB-INF/views/common/footer.jsp" />