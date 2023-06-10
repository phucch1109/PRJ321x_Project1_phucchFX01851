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
					<h1 class="mt-4">Danh sách người dùng</h1>
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
											<form:form method="post" action="saveAccount"
												modelAttribute="account">
												
												
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Name:</label>
														<form:input path="fullName" cssClass="form-control" required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Email:</label>
														<form:input path="email" cssClass="form-control"
															type="email" required="required"/>
													</div>
												</div>


												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Số
															điện thoại:</label>
														<form:input path="phoneNumber" cssClass="form-control" required="required" />
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Địa
															chỉ:</label>
														<form:input path="address" cssClass="form-control" required="required" />
													</div>
												</div>

												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tên
															tài khoản:</label>
														<form:input cssClass="form-control" path="username" required="required"/>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Mật
															khẩu:</label>
														<form:password cssClass="form-control" path="password" required="required" />
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label>
														<select class="form-control" id="roleId" name="roleId">
															<!-- Populating role option -->
															<c:forEach var="role" items="${roleList}">
																<option value="${role.id }" label="${role.roleName }" />
															</c:forEach>

														</select>
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
							<!-- Modal Add end-->
						</div>

						<div class="card-body">
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
							<!-- Datatable -->
							<table id="datatable">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<th>Tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
									</tr>
								</tfoot>
								<tbody>

									<!-- loop accounts -->
									<c:forEach var="user" items="${accounts}">
										<tr>
											<td>${user.fullName}</td>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
											<td>${user.username}</td>
											<td>${user.role.roleName}</td>
											<c:choose>
												<c:when test="${user.accountStatus == 1}">
													<td style="color: #1c7430; font-weight: bold">Hoạt
														động</td>
												</c:when>
												<c:otherwise>
													<td style="color: red; font-weight: bold">Đã khóa</td>
												</c:otherwise>
											</c:choose>
											</td>
											<td style="width: 270px">
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													th:data-bs-target="'#idModelMail'+${user.id}">Gửi</button>

												<button type="button" style="width: 80px"
													class="btn btn-primary updateBtn" data-bs-toggle="modal"
													id="#exampleModal${user.id}"
													th:data-bs-target="#exampleModal${user.id}">Sửa</button>


												 <!-- construct an delete link --> <c:url
													var="deleteLink" value="/deleteAccount">
													<c:param name="accountId" value="${user.id}"></c:param>
												</c:url> <a href="${deleteLink}">
													<button type="button" style="width: 80px"
														class="btn btn-danger mt-1 deleteBtn"
														onclick="if(!(confirm('Are you sure you want to delete this account: ${user.fullName}?'))) return false">Xóa</button>
											</a>
											<!-- lock or unlock button -->
											
											  <!-- construct an update link --> 
											  <c:url
													var="lockLink" value="/updateStatus">
													<c:param name="accountId" value="${user.id}"></c:param>
													<c:param name="roleId" value="${user.role.id}"></c:param>
												</c:url>
											 <c:choose>				  
												<c:when test="${user.accountStatus == 1}">
													<a href="${lockLink}">
														<button type="submit" style="width: 80px"
															class="btn btn-danger">Khóa</button></a>
													</c:when>
													<c:otherwise>
													<a href="${lockLink}">
														<button type="submit" style="width: 80px"
															class="btn btn-success">Mở</button></a>
													</c:otherwise>

												</c:choose> 
											
												<!-- delete model WIP-->
												<div class="modal fade" th:id="'idModelDel' + ${user.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Bạn
																	chắc chắn muốn xóa ?</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																Người dùng : <span th:text="${user.fullName}"></span>
																<form th:action="@{/ql-user/delete}" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="idUser" th:value="${user.id}">
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger">Xóa</button>

																	</div>
																</form>
															</div>

														</div>
													</div>
												</div>
												
											</td>
										</tr>
										<!-- Modal Update begin-->
										<div class="modal fade" id="exampleModalUpdate${user.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
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

														<form:form method="POST" action="saveAccount"
															modelAttribute="account">
															<form:hidden path="id" value="${user.id}" />
															<form:hidden path="accountStatus" value="${user.accountStatus}"/>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Họ
																		và tên:</label>
																	<form:input cssClass="form-control" path="fullName"
																		value="${user.fullName}" required="required"/>

																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Email:</label>
																	<form:input readonly="true" path="email" value="${user.email}" cssClass="form-control"/>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Số
																		điện thoại:</label>
																	<form:input cssClass="form-control" id="addname"
																		name="phoneNumber" value="${user.phoneNumber }"
																		path="phoneNumber" required="required"/>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Địa
																		chỉ:</label>
																	<form:input cssClass="form-control" id="addcost"
																		name="address" value="${user.address }" path="address" required="required" />
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tài
																		khoản:</label> <form:input readonly="true" path="username" value="${user.username}" cssClass="form-control"/>
																</div>
																<div class="col-6">
																	<label for="ct_id" class="col-form-label">Vai
																		trò:</label> <select class="form-control" id="roleId1"
																		name="roleId">
																		
																		<!-- Populating role option -->
																		<c:forEach var="role" items="${roleList}">
																			<option value="${role.id }" label="${role.roleName }" />
																		</c:forEach>

																	</select>


																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal" id="close-btn-2-${user.id}">Đóng</button>
																<button type="submit" class="btn btn-primary">Lưu
																</button>
															</div>
														</form:form>
													</div>

												</div>
											</div>
										</div>
										<!-- Modal Update end-->
									</c:forEach>
								</tbody>
							</table>
							<!-- pagin -->
							<form:hidden path="query" />
							<form:hidden path="numberShown" />
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:forEach var="j" begin="1" step="1" end="${totalPage}">
										<!-- contruct a pagin link -->
										<c:url var="pageLink" value="/admin">
											<c:param name="page" value="${j}"></c:param>
											<c:param name="query" value="${query}"></c:param>
											<c:param name="numberShown" value="${numberShown}"></c:param>
										</c:url>
										<c:if test="${page != j}">
											<li class="page-item"><a class="page-link"
												href="${pageLink}">${j}</a></li>
										</c:if>
										<c:if test="${page == j}">
											<li class="page-link" style="background-color:gray;">${j}</li>
										</c:if>
									</c:forEach>
								</ul>
							</nav>

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
	<script>
		 
	</script>

</body>

</html>