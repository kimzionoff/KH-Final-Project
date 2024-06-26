<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Users / Profile</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/include/admin/admin/assets/img/favicon.png" rel="icon">
  <link href="/resources/include/admin/admin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/include/admin/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/include/admin/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/include/admin/admin/assets/css/style.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<section>
	<jsp:include page="/WEB-INF/views/admin/common/section.jsp" />
	</section>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="/resources/include/admin/image/admin.png" alt="Profile" class="rounded-circle">
              <h2>${adminLogin.adminName}</h2>
              <h3>Adminstrator</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminName}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">team</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminTeam}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Job</div>
                    <div class="col-lg-9 col-md-8">Administrator</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Assigned Date</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminAssignedDate}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Phone</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminPhone}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminEmail}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">password Change Date</div>
                    <div class="col-lg-9 col-md-8">${adminLogin.adminPasswordChangeDate}</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form id="f_writeForm">
                  
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="/resources/include/admin/image/admin.png" alt="Profile">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminName" class="col-md-4 col-lg-3 col-form-label">name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminName" type="text" class="form-control" id="adminName" value="${adminLogin.adminName}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminTeam" class="col-md-4 col-lg-3 col-form-label">Team</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminTeam" type="text" class="form-control" id="adminTeam" value="${adminLogin.adminTeam}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminPhone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminPhone" type="text" class="form-control" id="adminPhone" value="${adminLogin.adminPhone}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminEmail" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminEmail" type="email" class="form-control" id="adminEmail" value="${adminLogin.adminEmail}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminAssignedDate" class="col-md-4 col-lg-3 col-form-label">Assigned Date</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminAssignedDate" type="date" class="form-control" id="adminAssignedDate" value="${adminLogin.adminAssignedDate}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="adminPasswordChangeDate" class="col-md-4 col-lg-3 col-form-label">adminPasswordChangeDate</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="adminPasswordChangeDate" type="text" class="form-control" id="adminPasswordChangeDate" readonly="readonly" value="${adminLogin.adminPasswordChangeDate}">
                      </div>
                    </div>
					<input type="hidden" id="adminId" name="adminId" value="${adminLogin.adminId}" readonly/>		
                    <div class="text-center">
                      <button type="button" id="saveBtn" name="saveBtn" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form id="changePasswdForm">

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newPassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewPassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>
					<input type="hidden" id="academyId" name="academyId" value="${adminLogin.adminId}"/>
                    <div class="text-center">
                      <button type="button" id="changePasswdBtn" name="changePasswdBtn" class="btn btn-primary">Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->
                </div>
              </div><!-- End Bordered Tabs -->
            </div>
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/include/admin/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/quill/quill.min.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="/resources/include/admin/admin/assets/vendor/php-email-form/validate.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/admin/login/js/myPage.js"></script>


</body>

</html>