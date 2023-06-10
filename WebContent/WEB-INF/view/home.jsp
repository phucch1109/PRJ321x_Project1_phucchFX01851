<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Trang quyên góp</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="ftco-32x32.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/css/custom-bs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/fonts/line-icons/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/static/user/assets/css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/assets/css/style.css">
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/static/user/assets/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/static/user/assets/js/stickyfill.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/jquery.fancybox.min.js"></script>


<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/bootstrap-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/custom.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body id="top">

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<div th:if="${msg}" class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">

	</div>

	<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->


		<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6">
						<a href="/">Website Quyên Góp</a>
					</div>

				</div>
			</div>
		</header>

		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image"
			style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold">Danh sách các đợt
							quyên góp</h1>

					</div>
				</div>
			</div>
		</section>
		<section class="site-section">
			<div class="container">

				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Các đợt quyên góp</h2>
					</div>
				</div>

				<ul class="job-listings mb-5">
					<th><c:forEach items="${donations}" var="donation">


							<li style="margin-bottom: 20px"
								class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
								<div
									class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
									<div class="job-listing-position custom-width  mb-3 mb-sm-0"
										style="padding: 10px; width: 250px">
										<!-- construct an detail link --> <c:url
													var="detailLink" value="userDonationDetail">
													<c:param name="id" value="${donation.id}"></c:param>
												</c:url>
										<a href="${detailLink }" style="position:relative;">
										<h2>${donation.name }</h2></a>

										<strong><c:choose>
												<c:when test="${donation.status == 0 }">Mới tạo</c:when>
												<c:when test="${donation.status == 1 }">Đang quyên góp</c:when>
												<c:when test="${donation.status == 2 }">Kết thúc quyên góp</c:when>
												<c:otherwise>Đóng quyên góp</c:otherwise>
											</c:choose> </strong>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
										style="padding: 10px;">
										Ngày bắt đầu<br> <strong>${donation.startDate}</strong><br>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
										style="padding: 10px;">
										Ngày kết thúc<br> <strong>${donation.endDate}</strong><br>
									</div>
									<div
										class="job-listing-location mb-3 mb-sm-0 custom-width w-25"
										style="padding: 10px;">
										<span class="icon-room"></span> <span>${donation.organizationName}</span><br>
										<strong>${donation.phoneNumber}</strong><br>
									</div>

									<div class="job-listing-meta custom-width w-20">
										<c:if test="${donation.status ==1}">
										
											<p style="margin-top: 20px" class="btn btn-primary py-2 updateBtn"
												data-toggle="modal" aria-labelledby="exampleModalLabel" id="#exampleModal${donation.id}">Quyên góp</p>
											<p
												style="margin-top: 20px; background-color: white !important;"
												class="btn py-2">
												<span style="color: white">Quyên góp</span>
											</p>
										
										</c:if>
										<c:if test="${donation.status !=1}">
											<div style="padding: 20px 107px"></div>
										</c:if>
									</div>


								</div>

							</li>
							</c:forEach> 
						<!-- Modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id= "exampleModalUpdate"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">
											Quyên góp: <span></span>
										</h5>
										<button type="button" class="close btn-close" data-dismiss="modal"
											aria-label="Close" >
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form:form method="post" action="addUserDonation" modelAttribute="userDonation" >
										<div class="modal-body">
											<div class="row">
												<input type="hidden" name="id" value="" id="inputDonationId"/>
												<div class="col-12">
												
												
													<label for="addname" class="col-form-label">Họ tên:</label>
													
													<form:input type="text" cssClass="form-control" id="addname"
														path="name" placeholder="" required="required"/>
														 <label
														for="addname" class="col-form-label">Số tiền quyên
														góp:</label>
														 <form:input type="number" class="form-control"
														placeholder="" id="addname" path="money" required="required"/>
													    <label for="addname"
														class="col-form-label">Lời nhắn:</label>
														
													<textarea rows="10" cols="3" class="form-control"
														name="text"></textarea>
												</div>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary btn-close"
													data-dismiss="modal">Đóng</button>
												<button type="submit" data-toggle="modal"
													data-target="#exampleModal" class="btn btn-primary">Quyên
													góp</button>
											</div>
										</div>
									</form:form>


								</div>
							</div>
						</div>
						
						</th>

				</ul>

			</div>

			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:forEach var="j" begin="1" step="1" end="${totalPage}">
						<!-- contruct a pagin link -->
						<c:url var="pageLink" value="/home">
							<c:param name="page" value="${j}"></c:param>
						</c:url>
						<c:if test="${page != j}">
							<li class="page-item"><a class="page-link"
								href="${pageLink}">${j}</a></li>
						</c:if>
						<c:if test="${page == j}">
							<li class="page-link" style="background-color: gray;">${j}</li>
						</c:if>
					</c:forEach>
				</ul>
			</nav>
		</section>

	</div>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/JQuery3.3.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/user/assets/js/scripts.js"></script>
</body>
</html>