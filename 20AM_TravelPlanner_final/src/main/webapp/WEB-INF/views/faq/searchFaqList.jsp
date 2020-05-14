<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
	#pTop{
		font-size:40px;
		font-weight:bolder;
		transform:translate(10%,0);
	}
	#searchSp p{
		transform:translate(10%,0);
	}
	#searchSp h4{
		transform:translate(10%,0);
	}
	#searchcontent{
		margin-left:10%;
	}
	#divHeader{
		border-bottom:1px solid black;
		margin-bottom:10px;
	}

	#faqTop{
		margin-right:300px;
		margin-left:25px;
		font-weight:bolder;
	}
	#contents{
		list-style:none;
		width:100%;
	}
	#category{
		float:left;
		width:160px;
		text-align:center;
	}
	#title{
		text-align:left;
		width:500px;
		float:left;
	}
	ul{
		padding-inline-start:0px;
	}
	#spanCt{
		display:none;
		height:auto;
		padding:0px;
		position:absolute;
		z-index:200;
	}
	#faqContent{
		list-style:none;
	}
	#title:hover #faqContent ul li span{
		
	}
	#btnTitle{
		background-color:white;
		border-color:white;
		color:black;
		border:0;
		outline:0;
	}
	#btnTitle:visited{
		border:none;
	}
</style>
<section>

	<div class="container">
		<table class="table table-hover">
		<thead>
			<div id="divHeader">
				<span id="faqTop">카테고리</span>
				<span id="faqTop">제목</span>
				<span id="faqTop">작성일</span>
			</div>
		</thead>
			<c:forEach items="${list }" var="f">
			<ul>
					<li id="contents">
						<span id="category">
							<c:out value="${f['FAQ_CATEGORY'] }"/>
						</span>
						<button type="button" id="btnTitle">
							<span id="title"><c:out value="${f['FAQ_TITLE'] }" /></span>
						</button>
						<span id="date"><c:out value="${f['FAQ_DATE'] }" /></span>
						<ul id="faqContent">
							<li>
								<div id="demo" class="collapse">
								<!-- <span id="spanCt"> -->
									<c:out value="${f['FAQ_CONTENT'] }" />
								<!-- </span> -->
								</div>
							</li>
						</ul>
					</li>
			</ul>
			</c:forEach>
		</table>
	</div>
		<div id = "page-container">
			${pageBar }
		</div>
</section>
<script>
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