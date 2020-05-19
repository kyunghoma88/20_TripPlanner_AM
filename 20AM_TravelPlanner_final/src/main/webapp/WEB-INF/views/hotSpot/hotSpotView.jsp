<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${path }/resources/css/hotSpotMain.css?ver=1.43" type="text/css" />



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
	<a href="${path }/hotSpot/hotSpotList.do?area=서울"><button type="button" class="btn btn-secondary btnS">서울</button></a>
	<a href="${path }/hotSpot/hotSpotList.do?area=강릉"><button type="button" class="btn btn-secondary btnG">강릉</button></a>
	<a href="${path }/hotSpot/hotSpotList.do?area=대전"><button type="button" class="btn btn-secondary btnD">대전</button></a>
	<a href="${path }/hotSpot/hotSpotList.do?area=부산"><button type="button" class="btn btn-secondary btnB">부산</button></a>
	<a href="${path }/hotSpot/hotSpotList.do?area=전주"><button type="button" class="btn btn-secondary btnJ">전주</button></a>
</div>

<div id="hotSpot_ViewContainer" class="row">
	<div class="col-sm-2"></div>
	<div class="hotSpot_container1 col-sm-4">
		<img src="${path }${hotSpot.hotSpot_Image }" width="300px" height="250px"/>
	</div>
	<div class="hotSpot_container2 col-sm-4">
		<table>
			<tr class="tableTr">
				<th class="tableTh">지역</th>
				<td>${hotSpot.hotSpot_Area_Name }</td>
			</tr>
			<tr class="tableTr">
				<th class="tableTh">지명</th>
				<td>${hotSpot.hotSpot_Name }</td>
			</tr>
			<tr class="tableTr">
				<th class="tableTh">주소</th>
				<td>${hotSpot.hotSpot_Addr }</td>
			</tr>
			<tr class="tableTr">
				<th class="tableTh">설명</th>
				<td>${hotSpot.hotSpot_Content }</td>
			</tr>
			<tr class="tableTr">
				<th class="tableTh">조회수</th>
				<td>${hotSpot.hotSpot_View }</td>
			</tr>
		</table>
	</div>
	<div class="col-sm-2"></div>
</div>
<div class="hotSpot_container3">

</div>

	
	










<jsp:include page="/WEB-INF/views/common/footer.jsp" />