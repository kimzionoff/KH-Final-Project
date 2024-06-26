<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>MyEduMySelect</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/images/common/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<link rel="stylesheet" type="text/css"
	href="/resources/include/css/default.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script src="/resources/include/js/common.js"></script>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MyEduMySelect</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/images/common/icon.png" rel="icon">
<link href="/resources/images/common/icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/include/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/include/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/assets/css/main.css" rel="stylesheet">
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo me-auto"><a href="/">MyEdu<br />MySelect</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto active" href="/">홈</a></li>
	          <li><a class="nav-link scrollto" href="#about">About</a></li>
	          <li><a class="nav-link scrollto" href="#team">Team</a></li>
	          <li><a class="nav-link scrollto" href="#pricing">Pricing</a></li>
	          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	              	<li><a href="/notice/boardList">공지사항</a></li>
					<li><a href="/matching/"  class="afterLogin">맞춤형 검색</a></li>
					<li><a href="/matching/boardList" class="afterLogin">매칭 게시판</a></li>
					<li><a href="/advertise/advertiseBoardList" class="afterLogin">학원 홍보 게시판</a></li>
					<li><a href="/free/freeList" class="afterLogin">자유 게시판</a></li>
		            <c:if test="${personalLogin.memberTypeId == 1}">
		               <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">개인회원 마이페이지</a></li>
		            </c:if>
		            <c:if test="${academyLogin.memberTypeId == 2}">
		               <li><a href="${pageContext.request.contextPath}/academy/mypage" id="mypageBtn">학원회원 마이페이지</a></li>
		            </c:if>
	            </ul>
	          </li>
	          <c:choose>
	          <c:when test="${not empty personalLogin}">
	              <li><a class="nav-link scrollto">[개인]&nbsp;&nbsp;${personalLogin.personalName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/personal/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li> 
	          </c:when>
	          <c:when test="${not empty academyLogin}">
	              <li><a class="nav-link scrollto">[학원]&nbsp;&nbsp;${academyLogin.academyName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/academy/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:otherwise>
	              <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
	          </c:otherwise>
	        </c:choose>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
  	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h2 id="h2-desc">내 교육은 내가 선택한다!</h2>
					<h1>반갑습니다 MYEDUMYSELECT 입니다</h1>
					
					<form id="mainSearchForm">
						<div class="d-flex justify-content-center justify-content-lg-start">
							<select id="academyGuAddress" name="academyGuAddress" class="form-control form-control-lg">
		        				<option value="">-- 구 선택 --</option>
		        				<option value="강남구">강남구</option>
		        				<option value="강동구">강동구</option>
		       					<option value="강북구">강북구</option>
		      					<option value="강서구">강서구</option>
		      					<option value="관악구">관악구</option>
		      					<option value="광진구">광진구</option>
		        				<option value="구로구">구로구</option>
		        				<option value="금천구">금천구</option>
		        				<option value="노원구">노원구</option>
		        				<option value="도봉구">도봉구</option>
		        				<option value="동대문구">동대문구</option>
		        				<option value="동작구">동작구</option>
		        				<option value="마포구">마포구</option>
		        				<option value="서대문구">서대문구</option>
		        				<option value="서초구">서초구</option>
		        				<option value="성동구">성동구</option>
		        				<option value="성북구">성북구</option>
		        				<option value="송파구">송파구</option>
		        				<option value="양천구">양천구</option>
		        				<option value="영등포구">영등포구</option>
		        				<option value="용산구">용산구</option>
		        				<option value="은평구">은평구</option>
		        				<option value="종로구">종로구</option>
		        				<option value="중구">중구</option>
		        				<option value="중랑구">중랑구</option>
		        			</select>
							<select id="academyDongAddress" name="academyDongAddress" class="form-control form-control-lg">
								<option value="">-- 동 선택 --</option>
		        			</select>
		        			<input id="academyCurriculumName" name="academyCurriculumName" type="text" class="form-control form-control-lg" placeholder="과목을 입력하세요." maxlength=20/>
	        			</div>
        			</form>
				<button type="button" id="mainSearchBtn" name="mainSearchBtn" class="btn-get-started scrollto">지역 내 전체 학원 조회하기</button>
				</div>
				
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="/resources/include/assets/img/hero-img.png"
						class="img-fluid animated" alt="">
				</div>
					
			</div>
			
			
		</div>
		
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients section-bg">
			<div class="container">

				<div class="row" data-aos="zoom-in">

					<div class="row">
						<div class="col-xl-4 col-md-6 d-flex align-items-stretch"
							data-aos="zoom-in" data-aos-delay="100">
							<div class="icon-box">
								<div class="icon">
									<i class="bx bxl-dribbble"></i>
								</div>
								<h4>
									<a href="/free/freeList" class="afterLogin">자유게시판</a>
								</h4>
								<p>자유롭게 좋은 의견을 말해주세요.</p>
							</div>
						</div>

						<div
							class="col-xl-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
							data-aos="zoom-in" data-aos-delay="200">
							<div class="icon-box">
								<div class="icon">
									<i class="bx bx-file"></i>
								</div>
								<h4>
									<a href="/advertise/advertiseBoardList" class="afterLogin">홍보게시판</a>
								</h4>
								<p>멋진 교육 장소를 마음껏 뽐내주세요</p>
							</div>
						</div>
						<div
							class="col-xl-4 col-md-6 d-flex align-items-stretch mt-4 mt-xl-0"
							data-aos="zoom-in" data-aos-delay="300">
							<div class="icon-box">
								<div class="icon">
									<i class="bx bx-tachometer"></i>
								</div>
								<h4>
									<a href="/matching/" class="afterLogin">맞춤형검색/매칭게시판</a>
								</h4>
								<p>나에게 꼭 맞는 교육을 여기서 확인하세요.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Cliens Section -->

		<!-- ======= About Us Section ======= -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>About Us</h2>
				</div>

				<div class="row content">
					<div class="col-lg-6">
						<p>모든 학부모와 학생이 보다 쉽고 효과적으로 오프라인 학원을 선택할 수 있도록 하는 교육 정보 중개 서비스를
							제공하여, 교육의 질적 향상을 돕고 개인의 부담을 덜어드립니다.</p>
						<ul>
							<li><i class="ri-check-double-line"></i> 투명하고 객관적인 정보 제공</li>
							<li><i class="ri-check-double-line"></i> 맞춤형 추천 시스템</li>
							<li><i class="ri-check-double-line"></i> 원스톱 서비스</li>
							<li><i class="ri-check-double-line"></i> 평가 및 리뷰 플랫폼</li>
						</ul>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0">
						<p>우리 회사는 매년 증가하는 사교육비로 인한 부담을 고려하여, 학부모와 학생들이 올바른 교육 결정을 내리도록
							돕기 위해 설립되었습니다. 현재의 교육 시장에서는 정보 부족과 주관적인 기준으로 인한 불편함이 여전합니다. 따라서,
							우리는 객관적이고 명확한 정보를 제공하고, 학원과 학부모(학생) 간의 원활한 중개를 통해 교육 환경을 개선하고자
							합니다.</p>
						<a href="https://kostat.go.kr/board.es?mid=a10301070100&bid=245&act=view&list_no=424071" class="btn-learn-more">Learn More</a>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Us Section -->

		<!-- ======= Skills Section ======= -->
		<section id="skills" class="skills">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 d-flex align-items-center"
						data-aos="fade-right" data-aos-delay="100">
						<img src="/resources/include/assets/img/skills.png"
							class="img-fluid" alt="">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 content" data-aos="fade-left"
						data-aos-delay="100">
						<h3>tech skills</h3>
						<p class="fst-italic">비교해조 개발팀은 이번 프로젝트에서
							Java/HTML/CSS/JavaScript 기술을 메인으로 개발하였습니다.</p>

						<div class="skills-content">

							<div class="progress">
								<span class="skill">Java <i class="val">100%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

							<div class="progress">
								<span class="skill">HTML <i class="val">90%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar" aria-valuenow="90"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

							<div class="progress">
								<span class="skill">CSS <i class="val">75%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar" aria-valuenow="75"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

							<div class="progress">
								<span class="skill">JavaScript <i class="val">55%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar" aria-valuenow="55"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

						</div>

					</div>
				</div>

			</div>
		</section>
		<!-- End Skills Section -->

		<!-- ======= Team Section ======= -->
		<section id="team" class="team section-bg">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Team</h2>
					<p>우리 개발팀은 혁신적인 아이디어와 최신 기술을 활용하여 문제를 해결하고</p>
					<p>사용자들에게 효과적이고 혁신적인 솔루션을 제공하는 열정적인 전문가들의 모임입니다.</p>
				</div>

				<div class="row">

					<div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="100">
						<div class="member d-flex align-items-start">
							<div class="pic">
								<img src="/resources/include/assets/img/team/team-4.jpg"
									class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>김시온</h4>
								<span>CEO(Chief Executive Officer)</span>
								<p>안녕하세요 2조 조장 김시온입니다. 성실함과 책임감으로 앞장 서는 리더가 되겠습니다.</p>
								<div class="social">
									<a href=""><i class="ri-twitter-fill"></i></a> <a href=""><i
										class="ri-facebook-fill"></i></a> <a href=""><i
										class="ri-instagram-fill"></i></a> <a href=""> <i
										class="ri-linkedin-box-fill"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
						<div class="member d-flex align-items-start">
							<div class="pic">
								<img src="/resources/include/assets/img/team/team-3.jpg"
									class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>윤덕중</h4>
								<span>CTO(Chief Technology Officer)</span>
								<p>끊임없이 노력하고 성장하는 개발자가 되겠습니다.<br/></p>
								<div class="social">
									<a href=""><i class="ri-twitter-fill"></i></a> <a href=""><i
										class="ri-facebook-fill"></i></a> <a href=""><i
										class="ri-instagram-fill"></i></a> <a href=""> <i
										class="ri-linkedin-box-fill"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
						<div class="member d-flex align-items-start">
							<div class="pic">
								<img src="/resources/include/assets/img/team/team-1.jpg"
									class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>최영민</h4>
								<span>COO(Chief Operating Officer)</span>
								<p>신기술의 최전선에서 누구보다 빠르게 배우며 나아가겠습니다.</p>
								<div class="social">
									<a href=""><i class="ri-twitter-fill"></i></a> <a href=""><i
										class="ri-facebook-fill"></i></a> <a href=""><i
										class="ri-instagram-fill"></i></a> <a href=""> <i
										class="ri-linkedin-box-fill"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="300">
						<div class="member d-flex align-items-start">
							<div class="pic">
								<img src="/resources/include/assets/img/team/team-2.jpg"
									class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>김나연</h4>
								<span>CFO(Chief Financial Officer)</span>
								<p>항상 최고를 생각하며, 더 높은 곳을 향하는 자세로 임하겠습니다.</p>
								<div class="social">
									<a href=""><i class="ri-twitter-fill"></i></a> <a href=""><i
										class="ri-facebook-fill"></i></a> <a href=""><i
										class="ri-instagram-fill"></i></a> <a href=""> <i
										class="ri-linkedin-box-fill"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 mt-4" data-aos="zoom-in" data-aos-delay="400">
						<div class="member d-flex align-items-start">
							<div class="pic">
								<img src="/resources/include/assets/img/team/team-5.jpg"
									class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>강민호</h4>
								<span>CIO(Chief Information Office)</span>
								<p>가장 완벽한 이해를 위해 반복적으로 보고 배우고 익혀 최상의 서비스를
								만드는 개발자가 되겠습니다.</p>
								<div class="social">
									<a href=""><i class="ri-twitter-fill"></i></a> <a href=""><i
										class="ri-facebook-fill"></i></a> <a href=""><i
										class="ri-instagram-fill"></i></a> <a href=""> <i
										class="ri-linkedin-box-fill"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Team Section -->

		<!-- ======= Pricing Section ======= -->
		<section id="pricing" class="pricing">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Pricing</h2>
					<p>학원 고객님에게 제공하는 서비스 요금을 안내해드립니다.</p>
				</div>

				<div class="center d-flex justify-content-center">
					<div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
						<div class="box text-center mx-auto">
							<h3>Best Service</h3>
							<h4>
								<sup>￦</sup>199,000<span>per month</span>
							</h4>
							<ul>
								<li><i class="bx bx-check"></i> 학원고객님의 교육이념과 환경을 홍보하실 수 있습니다.</li>
								<li><i class="bx bx-check"></i> 학생분들이 편하게 학원을 선택할 수 있도록 제시합니다.</li>
								<li><i class="bx bx-check"></i> 주변 뿐만 아니라 더 넓은 지역의 학생들에게 학원이 소개됩니다.</li>
								<li class="na"><i class="bx bx-x"></i> <span>CEO가 직접 홍보 컨설팅을 해드립니다.</span></li>
								<li class="na"><i class="bx bx-x"></i> <span>모든 서비스분야에서 기술지원을 받을 수 있습니다.</span></li>
							</ul>
							<a href="/payment/payMain" class="buy-btn">Get Started</a>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Pricing Section -->

		<!-- ======= Contact Section ======= -->

	</main>
	<!-- End #main -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<!-- Vendor JS Files -->
	<script src="/resources/include/assets/vendor/aos/aos.js"></script>
	<script
		src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>
	
	<script>
	$(function(){
		$(".afterLogin").on("click", function() {
			if(${empty personalLogin} && ${empty academyLogin}) {
				alert("로그인 후 접속 가능합니다.");				
			}
		})
		
	})
	</script>
	

</body>

</html>