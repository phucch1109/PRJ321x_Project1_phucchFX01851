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
<title>Quản trị</title>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/css/styles.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>

<script
	src="${pageContext.request.contextPath}/assets/admin/js/datatables-simple-demo.js"></script>

<script
	src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>

</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav th:fragment="html_nav"
			class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="admin">QUẢN TRỊ</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
				id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form
				class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

			</form>
			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><a th:if="${session.admin}"
					class="nav-link dropdown-toggle" href="home" role="button"><i
						class="fas fa-user fa-fw"></i><span> Logout</span></a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item" href="home">Logout</a></li>
					</ul></li>
			</ul>
		</nav>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div th:fragment="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="admin">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý người dùng
							</a> <a class="nav-link" href="adminDonation">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý đợt quyên góp
							</a>
						</div>
					</div>

				</nav>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Chi tiết đợt quyên góp</h1>
					<div class="card mb-4">

						<div class="card-body">
							<!--Detail-->
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Mã đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="code" value="${donation.code}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Tên đợt
										quyên góp:</label> <input type="text" class="form-control"
										id="addcost" name="name" value="${donation.name}"
										readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Ngày bắt
										đầu:</label> <input class="form-control" id="addname" name="start"
										value="${donation.startDate}" readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Ngày kết
										thúc:</label> <input class="form-control" id="addcost" name="end"
										value="${donation.endDate}" readonly="readonly">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổng tiền
										quyên góp:</label> <input type="text" class="form-control"
										id="addname" name="start" value="${donation.money}"
										readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Trạng thái:</label>
									<c:choose>
										<c:when test="${donation.status == 0} ">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Mới tạo" readonly="readonly">
										</c:when>
										<c:when test="${donation.status == 1} ">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Đang quyên góp" readonly="readonly">
										</c:when>
										<c:when test="${donation.status == 2} ">
											<input type="text" class="form-control" id="addcost"
												name="end" value="Kết thúc quyên góp" readonly="readonly">
										</c:when>
										<c:otherwise>
											<input type="text" class="form-control" id="addcost"
												name="end" value="Đóng quyên góp" readonly="readonly">
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label for="addname" class="col-form-label">Tổ chức:</label> <input
										type="text" class="form-control" id="addname" name="tochuc"
										value="${donation.organizationName}" readonly="readonly">
								</div>
								<div class="col-6">
									<label for="addcost" class="col-form-label">Số điện
										thoại:</label> <input type="number" class="form-control" id="addcost"
										name="sdt" value="${donation.phoneNumber }"
										readonly="readonly">
								</div>
								<div class="col-12">
									<label for="ct_id" class="col-form-label">Nội dung:</label>
									<textarea name="noidung" class="form-control" cols="50"
										readonly="readonly"> ${donation.description}</textarea>
								</div>
							</div>

							<!--Detail-->
							<h3>Danh sách những người quyên góp</h3>

							<!-- datatable option(number of account shown and search option) -->
							<div class="datatable-top">
								<div class="datatable-dropdown">
									<label> <select class="datatable-selector"
										id="accountInPage" name="accountInPage1">
											<option value="5">5</option>
											<option value="10">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
									</select> entries per page
									</label>
								</div>
								<div class="datatable-search">
									<input class="datatable-input" placeholder="Search..."
										type="search" title="Search within table"
										aria-controls="datatablesSimple" name="search"
										id="searchInput" value="${query}">
								</div>
							</div>

							<table>

								<tr style="background-color: gray !important;">
									<th>Họ Tên</th>
									<th>Tiền quyên góp</th>
									<th>Ngày quyên góp</th>
									<th>Nội dung</th>
									<th>Trạng thái</th>
									<th>Hành động</th>
								</tr>

								<c:if test="${empty users}"><tr><td>No record</td></tr></c:if>

								<c:forEach var="user" items="${users}">
									<tr>
										<td>${user.name}</td>
										<td>${user.money}</td>
										<td>${user.created }</td>
										<td>${user.text }</td>
										<c:choose>
											<c:when test="${user.status ==0}">
												<td>Chờ xác nhận</td>
											</c:when>
											<c:when test="${user.status ==1}">
												<td style="color: green;">Đã được xác nhận</td>
											</c:when>
											<c:otherwise>
												<td style="color: red;">Đã bị hủy</td>
											</c:otherwise>

										</c:choose>

										<c:choose>
											<c:when test="${user.status==0 }">
												<td style="display: flex; justify-content: space-between">
													<form method="get" action="updateUserDonationStatus">
														<input type="hidden" name="id" value="${user.id}">
														<input type="hidden" name="donationId"
															value="${donation.id}">
														<button type="submit" style="width: 105px"
															class="btn btn-success" name="status" value="1">
															Xác nhận</button>
														<button type="submit" style="width: 150px"
															class="btn btn-danger" name="status" value="2">
															Hủy xác nhận</button>
													</form>
												</td>
											</c:when>
											<c:otherwise>
												<td></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
							<!-- pagin -->
							<form:hidden path="query" />
							<form:hidden path="numberShown" />
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:forEach var="j" begin="1" step="1" end="${totalPage}">
										<!-- contruct a pagin link -->
										<c:url var="pageLink" value="/donationDetail">
										<c:param name="id" value="${donation.id }"></c:param>
											<c:param name="page" value="${j}"></c:param>
											<c:param name="query" value="${query}"></c:param>
											<c:param name="numberShown" value="${numberShown}"></c:param>
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
							
							
						</div>
					</div>
				</div>

			</main>



		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/admin/js/JQuery3.3.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/js/scripts.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</body>

</html>