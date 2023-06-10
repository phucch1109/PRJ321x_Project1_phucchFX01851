<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
    <title>Donation website &mdash; Website Donation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
  
</head>
<body id="top">

<div id="overlayer"></div>
<div class="loader">
  <div class="spinner-border text-primary" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>

<div class="site-wrap">

  <div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close mt-3">
        <span class="icon-close2 js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div> <!-- .site-mobile-menu -->


  <!-- NAVBAR -->
  <header class="site-navbar mt-3">
    <div class="container-fluid">
      <div class="row align-items-center">
        <div class="site-logo col-6"><a href="/">Website Quyên Góp</a></div>

        <nav class="mx-auto site-navigation">
          <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
            <li th:if="${session.user}" class="d-lg-none"><a href="post-job.html"><span class="mr-2" th:text="${session.user.fullName}"></span> </a></li>
            <li class="d-lg-none" th:if="${session.user}"><a href="admin" >Đăng xuất</a></li>
            <li class="d-lg-none" th:unless="${session.user}"><a href="admin">Đăng nhập</a></li>
          </ul>
        </nav>

        <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
          <div class="ml-auto">
            <a th:if="${session.user}" th:text="${session.user.fullName}" th:href="${'/user/info/'}+${session.user.id} " class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"></span>Post a Job</a>
            <a href="admin" th:if="${session.user}" class="btn btn-primary border-width-2 d-none d-lg-inline-block">Log Out</a>
            <a href="admin" th:unless="${session.user}" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Log In</a>
          </div>
          <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
        </div>

      </div>
    </div>
  </header>
  </header>

  <!-- HOME -->
  <section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <h1 class="text-white font-weight-bold">Chi tiết đợt quyên góp</h1>
          <div class="custom-breadcrumbs">

          </div>
        </div>
      </div>
    </div>
  </section>


  <section class="site-section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-5">
            <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Nội dung của đợt quyên góp</h3>
            <span th:utext="${donation.description}">${donation.description}</span>
          </div>

          <div class="pt-5">
            <h4 class="mb-5" >Danh sách quyên góp</h4>
<!--            <h3 class="mb-5" th:text="${userDonationList.size()}+${'  donation'}"> </h3>-->
            <ul class="comment-list">
             <c:forEach var="user" items="${users}">
              <th>
                <li class="comment">
                  <div class="vcard bio">
                    <img src="data:image/png;base64,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" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>${user.name}</h3>
                    <div class="meta" style="color: #373b3e !important;" th:text="">${user.created}</div>
                    <p>${user.money }</p>
                  </div>
                </li>
              </th>
</c:forEach>
            </ul>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="bg-light p-3 border rounded mb-4">
            <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Thông tin</h3>
            <ul class="list-unstyled pl-3 mb-0">
              <li class="mb-2"><strong class="text-black">Mã đợt quyên góp:</strong>${donation.code } </li>
              <li class="mb-2"><strong class="text-black">Tên đợt quyên góp:</strong>${donation.name }</li>
              <li class="mb-2"><strong class="text-black">Ngày bắt đầu:</strong> ${donation.startDate }</li>
              <li class="mb-2"><strong class="text-black">Ngày kết thúc:</strong> ${donation.endDate }</li>
              <li class="mb-2"><strong class="text-black">Cá nhân/Tổ chức:</strong>${donation.organizationName }</li>
              <li class="mb-2"><strong class="text-black">Số điện thoại: </strong>${donation.phoneNumber }</li>
              <li class="mb-2"><strong class="text-black">Tổng tiền quyên góp nhận được:</strong>${donation.money}</li>
              <li class="mb-2"><strong class="text-black">Trạng thái:</strong>
               <c:choose>
               <c:when test="${donation.status == 0 }"><span >Mới tạo</span></c:when>
                <c:when test="${donation.status == 1 }"><span >Đang quyên góp</span></c:when>
                 <c:when test="${donation.status == 2 }"> <span>Kết thúc quyên góp</span></c:when>
                  <c:when test="${donation.status == 3 }"><span>Đóng quyên góp</span></c:when>
               </c:choose> 
                
               
                
              </li>

            </ul>
          </div>

          <div class="bg-light p-3 border rounded" >
            <button type="button"  style="color: white;background-color:#89ba16;" data-toggle="modal" data-target="#exampleModal" id="#exampleModal${donation.id}  class="btn btn-block btn-md update-btn btn-primary">Quyên góp</button>
          </div>

        </div>
      </div>
    </div>
    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" id= "exampleModalUpdate">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Quyên góp</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"  ">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <form method="post" action="addUserDonation">
            <div class="modal-body">
              <div class="row">

                <div class="col-12">
                  <label for="addname"
                         class="col-form-label">Họ tên:</label>
                  <input type="text" class="form-control"
                         id="addname" name="name" placeholder="" required>
                  <label for="addname"
                         class="col-form-label">Số tiền quyên góp:</label>
                  <input type="number" class="form-control" placeholder=""
                         id="addname" name="money" required>
                  <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="idUser" >
                  <input type="hidden" class="form-control" placeholder=""
                         id="addname" name="idDonation" required>

                  <label for="addname"
                         class="col-form-label">Lời nhắn:</label>
                  <textarea rows="10" cols="3" class="form-control" name="text">

                  </textarea>
                </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Quyên góp</button>
              </div>
            </div>
          </form>


        </div>
      </div>
    </div>
  </section>

  <footer th:replace="public/fragments :: footer" class="site-footer">

  </footer>

</div>

</body>
</html>