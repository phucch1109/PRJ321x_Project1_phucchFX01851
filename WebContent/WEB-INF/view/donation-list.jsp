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
					<h1 class="mt-4">Danh sách đợt quyên góp</h1>
					<div class="card mb-4">
						<div class="card-header">
							<button type="button" class="btn btn-success"
								data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
								Thêm mới</button>
							<!-- Modal Add-->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabelll">Thêm
												mới</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form method="post" action="saveDonation"
												modelAttribute="donation">
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Mã đợt
															quyên góp:</label>
														<form:input cssClass="form-control" path="code"
															required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Tên
															đợt quyên góp:</label>
														<form:input cssClass="form-control" path="name"
															required="required" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Ngày
															bắt đầu:</label>
														<form:input cssClass="form-control" path="startDate"
															required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Ngày
															kết thúc:</label>
														<form:input cssClass="form-control" path="endDate"
															required="required" />
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tổ
															chức:</label>
														<form:input cssClass="form-control"
															path="organizationName" required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Số
															điện thoại:</label>
														<form:input cssClass="form-control" path="phoneNumber"
															required="required" />
													</div>
													<div class="col-12">
														<label for="ct_id" class="col-form-label">Nội
															dung:</label>
														<form:textarea path="description" cssClass="form-control"
															value="Nhập nội dung" />
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm
													</button>
												</div>
											</form:form>
										</div>

									</div>
								</div>
							</div>
							<!-- Modal Add-->


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

						</div>

						<div class="card-body">
							<c:choose>
								<c:when test="${empty donations}">
									<p>No record</p>
								</c:when>
								<c:otherwise>
									<table id="datatablesSimple">
										<thead>
											<tr style="background-color: gray !important;">
												<th>Mã</th>
												<th>Tên</th>
												<th>Ngày bắt đầu</th>
												<th>Ngày kết thúc</th>
												<th>Tổ chức</th>
												<th>Số điện thoại</th>
												<th>Tổng tiền</th>
												<th>Trạng thái</th>
												<th style="width: 220px">Hành động</th>
											</tr>
										</thead>
										<tfoot>
											<tr>

											</tr>
										</tfoot>
										<tbody>

											<th>
												<!-- loop donation --> <c:forEach var="user"
													items="${donations}">
													<tr>
														<td>${user.code}</td>
														<td>${user.name }</td>
														<td>${user.startDate}</td>
														<td>${user.endDate}</td>
														<td>${user.organizationName}</td>
														<td>${user.phoneNumber}</td>
														<td>${user.money}</td>
														<!-- status -->
														<td><c:choose>
																<c:when test="${user.status == 0}">
														mới tạo
														</c:when>
																<c:when test="${user.status == 1}">
														đang quyên góp
														</c:when>
																<c:when test="${user.status == 2}">
														kết thúc quyên góp
														</c:when>
																<c:otherwise>
														đóng đợt quyên góp
														</c:otherwise>
															</c:choose></td>
														<!--all button list -->
														<td style="height: 98px"><c:if
																test="${user.status != 3 }">
																<button type="button" style="width: 105px"
																	class="btn btn-primary updateBtn"
																	data-bs-toggle="modal" id="#exampleModal${user.id}">Cập
																	nhật</button>
																	
																	
															</c:if> <a style="width: 105px" class="btn btn-warning"
															href="donationDetail?id=${user.id}"> Chi tiết </a> 
															
															<!-- construct an delete link/button -->
															<c:url var="deleteLink" value="/deleteDonation">
																<c:param name="id" value="${user.id}"></c:param>
															</c:url> <a href="${deleteLink}">
																<button type="button" style="width: 105px"
																	class="btn btn-danger mt-1"
																	onclick="if(!(confirm('Are you sure you want to delete this donation: ${user.name}?'))) return false"
																	th:data-bs-target="'#idModelDel'+${user.id}">Xóa</button></a>
														 <!-- show status button -->
															<form method="post" style="display: contents"
																action="changeDonationStatus">
																<input type="hidden" id="id" name="id"
																	value="${user.id}" />
																<c:choose>
																	<c:when test="${user.status == 0}">
																		<button type="submit" style="width: 105px"
																			class="btn btn-success">Quyên góp</button>
																	</c:when>
																	<c:when test="${user.status == 1}">
																		<button type="submit" style="width: 105px"
																			class="btn btn-success">Kết thúc</button>
																	</c:when>
																	<c:when test="${user.status == 2}">
																		<button type="submit" style="width: 105px"
																			class="btn btn-success">Đóng</button>
																	</c:when>
																	<c:otherwise></c:otherwise>
																</c:choose>
															</form></td>
													</tr>

													<div class="modal fade" tabindex="-1"
														aria-labelledby="exampleModalLabel" aria-hidden="true"
														id="exampleModalUpdate${user.id}">
														<div class="modal-dialog modal-lg ">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabell">Cập
																		nhật</h5>
																	<button type="button" class="btn-close"
																		id="btn-close${user.id}" data-bs-dismiss="modal"
																		aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<form:form method="POST" modelAttribute="donation"
																		action="saveDonation">
																		<form:hidden path="id" value="${user.id}" />
																		<form:hidden path="money" value="${user.money}" />
																		<form:hidden path="status" value="${user.status}" />

																		<div class="row">
																			<div class="col-6">
																				<label for="addname" class="col-form-label">Mã
																					đợt quyên góp:</label>
																				<form:input cssClass="form-control" path="code"
																					required="required" value="${user.code}" />
																			</div>
																			<div class="col-6">
																				<label for="addcost" class="col-form-label">Tên
																					đợt quyên góp:</label>
																				<form:input cssClass="form-control" path="name"
																					required="required" value="${user.name}" />
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-6">
																				<label for="addname" class="col-form-label">Ngày
																					bắt đầu:</label>
																				<form:input cssClass="form-control" path="startDate"
																					required="required" value="${user.startDate}" />
																			</div>
																			<div class="col-6">
																				<label for="addcost" class="col-form-label">Ngày
																					kết thúc:</label>
																				<form:input cssClass="form-control" path="endDate"
																					required="required" value="${user.endDate}" />
																			</div>
																		</div>
																		<div class="row">
																			<div class="col-6">
																				<label for="addname" class="col-form-label">Tổ
																					chức:</label>
																				<form:input cssClass="form-control"
																					path="organizationName" required="required"
																					value="${user.organizationName}" />
																			</div>
																			<div class="col-6">
																				<label for="addcost" class="col-form-label">Số
																					điện thoại:</label>
																				<form:input cssClass="form-control"
																					path="phoneNumber" required="required"
																					value="${user.phoneNumber}" />
																			</div>
																			<div class="col-12">
																				<label for="ct_id" class="col-form-label">Nội
																					dung:</label>
																				<textarea name="description"
																					class="form-control" required="required"
																					>${user.description}</textarea>
																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				id="close-btn-2-${user.id}" data-bs-dismiss="modal">Đóng</button>
																			<button type="submit" class="btn btn-primary">Lưu
																			</button>
																		</div>
																	</form:form>
																</div>

															</div>
														</div>
													</div>
												</c:forEach>
											</th>

											<!-- end loop -->
										</tbody>
									</table>

									<!-- pagin -->
									<form:hidden path="query" />
									<form:hidden path="numberShown" />
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<c:forEach var="j" begin="1" step="1" end="${totalPage}">
												<!-- contruct a pagin link -->
												<c:url var="pageLink" value="/adminDonation">
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
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

			</main>



			<footer th:replace="admin/fragments :: footer"
				class="py-4 bg-light mt-auto"> </footer>
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