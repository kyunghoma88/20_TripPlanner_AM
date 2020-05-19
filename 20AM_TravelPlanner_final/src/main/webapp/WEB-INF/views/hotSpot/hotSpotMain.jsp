<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${path }/resources/css/hotSpotMain.css?ver=1.1" type="text/css" />



<jsp:include page="/WEB-INF/views/common/header.jsp" />



<div class="container">

	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${path }/resources/images/hotSpotMainImage-1.jpg"
					alt="Los Angeles" width="1366" height="400">
			</div>
			<div class="carousel-item">
				<img src="${path }/resources/images/hotSpotMainImage-2.jpg"
					alt="Chicago" width="1366" height="400">
			</div>
			<div class="carousel-item">
				<img src="${path }/resources/images/hotSpotMainImage-3.jpg"
					alt="New York" width="1366" height="400">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>

</div>


<div class="btn-group btn-group-lg">
	<a href="${path }/hotSpot/hotSpotList.do?area=서울"><button
			type="button" class="btn btn-secondary btnS">서울</button></a> <a
		href="${path }/hotSpot/hotSpotList.do?area=강릉"><button
			type="button" class="btn btn-secondary btnG">강릉</button></a> <a
		href="${path }/hotSpot/hotSpotList.do?area=대전"><button
			type="button" class="btn btn-secondary btnD">대전</button></a> <a
		href="${path }/hotSpot/hotSpotList.do?area=부산"><button
			type="button" class="btn btn-secondary btnB">부산</button></a> <a
		href="${path }/hotSpot/hotSpotList.do?area=전주"><button
			type="button" class="btn btn-secondary btnJ">전주</button></a>
</div>

<div id="hotSpotListContainer">








	<div id="hotSpotListContainer">

		<c:forEach items="${list }" var="h">
			<a href="${path }/hotSpot/hotSpotView.do?name=${h.hotSpot_Name}"
				class="hotSpotAList">
				<div>
					<img src="${path }${h.hotSpot_Image } " width="250px"
						height="200px">
				</div>
				<div>${h.hotSpot_Name }</div>
				<div>
					<img src="${path }/resources/images/eyes.png" width="25px"
						height="25px"> <span>${h.hotSpot_View }</span>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<center>
			<div>${pageBar }</div>
		</center>
	</div>
	<div class="col-sm-3"></div>
</div>



<!-- <input type="button" id="hotSpotMoreBtn" value="여행지 더보기" onclick="javascript:moreContent()"> -->


<!-- 	<script>
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
	</script> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp" />