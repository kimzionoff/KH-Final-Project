<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">

  <!-- Template Main CSS File -->
  <link href="/resources/include/assets/css/style.css" rel="stylesheet">
  <link href="/resources/include/matching/css/matchingBoard.css" rel="stylesheet">

	
	<script>
		window.onload = function(){
			let confirmMsg = "${confirmMsg}";
			if(confirmMsg) {
				let result = confirm(confirmMsg);
				if(result) {
					window.location.href= "/academy/login";
				} else {
					window.location.href= "/matching/boardList";
				}
			}
		}
	</script>

</head>

<body>

  

  <!-- ======= 설명 영역 ======= -->
  <section class="mcHero d-flex align-items-center" style="height: 300px;">

    <div class="container">
      <div class="row" >
		<div class="col-12 text-center mcBanner">
            내가 댓글 단 게시물 (매칭 게시판)<br/>
        </div>  
      </div>
    </div>
   </section><!-- 설명영역 끝 -->

 
  <main id="main">
 

 

    <!-- ======= 매칭게시판 목록 ======= -->
<section class="mcBoard">
    <div class="container">
        <div class="mcBoardListSearch">
            <form id="f_search" name="f_search">
                <%-- 페이징 처리를 위한 파라미터 --%>
                <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
                <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
                <input type="hidden" name="academyId" id="academyId" value="${academyLogin.academyId}">
                
                <button type="button" id="mcBoardAll">전체 보기</button>

                <button type="button" id="mcBoardSearchBtn">검색</button>                
                <input type="text" name="keyword" id="keyword" placeholder="검색어 입력" value="${kwd }">
            </form>
        </div><br><br>

     <div class="mcBoardList">
    <table>
        <thead>
            <tr>
                <th>글 번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <!-- <th>댓글 수</th> -->
            </tr>
        </thead>
        <tbody id="mcBoardList">
            <c:choose>
                <c:when test="${not empty academyLogin}">
                    <c:choose>
                        <c:when test="${not empty matchingBoardVO}">
                            <!-- c:forEach 태그를 여기서 시작합니다. -->
                            <c:forEach var="matchingBoard" items="${matchingBoardList}" varStatus="status">
                                <!-- 댓글이 작성된 게시글인지 확인하는 조건을 추가합니다. -->
                                <tr data-num="${matchingBoard.matchingNo}">
                                    <td>${matchingBoard.matchingNo}</td>
                                    <td>
                                        <form name="privateChk" id="privateChk">
                                            <input type="hidden" name="matchingPrivate" value="${matchingBoard.matchingPrivate}"/>
                                            <input type="hidden" name="matchingPasswd" value="${matchingBoard.matchingPasswd}"/>
                                        </form>
                                        <c:choose>
                                            <c:when test="${matchingBoard.matchingPrivate eq 'Y'}">
                                                <img src="/resources/include/assets/img/matching/자물쇠.png">&nbsp;
                                                <a class="mbdLink" href="">
                                                    ${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress} | ${matchingBoard.matchingTargetSubject } | ${matchingBoard.matchingTargetGrade }
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="mbdLink" href="">
                                                    ${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress} | ${matchingBoard.matchingTargetSubject } | ${matchingBoard.matchingTargetGrade }
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${matchingBoard.commentCnt > 0 }">
							        		<span class="comment_count">&nbsp;&nbsp;[${matchingBoard.commentCnt }]</span>
							        	</c:if>
                                    </td>
                                    <td>${academyLogin.academyId}</td>
                                    <td>${matchingBoard.matchingRegisterDate}</td>                                    
                                    <%-- <td>${matchingBoard.commentCnt}</td> --%>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <!-- 댓글이 작성된 게시글이 없는 경우에 메시지를 출력합니다. -->
                            <tr>
                                <td colspan="5">댓글이 작성된 게시글이 존재하지 않습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">학원회원만 이용 가능한 서비스입니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>




    </div>
    
    <%------------ 페이징 출력 시작 ---------- --%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <!-- 이전 바로가기 5개 존재 여부를 prev 필드의 값으로 확인 -->
            <c:if test="${pageMaker.prev }">
                <li class="page-item">
                    <a href="${pageMaker.startPage - 1 }" class="page-link">이전</a>
                </li>
            </c:if>
            
            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${pageMaker.startPage + 1}" end="${pageMaker.endPage + 1}">
                <li class="page-item  ${pageMaker.cvo.pageNum == num ? 'active':''}">
                    <a href="${num}" class="page-link">${num}</a>
                </li>
            </c:forEach>
            
            <!-- 다음 바로가기 5개 존재 여부를 next 필드의 값으로 확인 -->
            <c:if test="${pageMaker.next }">
                <li class="page-item">
                    <a href="${pageMaker.endPage + 1 }" class="page-link">다음</a>
                </li>
            </c:if>
        </ul>
    </nav>
</section><!-- 매칭게시판 목록 끝 -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>MyEduMySelect</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>
 
          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>MyEduMySelect</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	

  <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/matching/js/matchingBoard.js"></script>
  
<!--   
  <script>
  
   	$(function() {
  		let word = "<c:out value='${matchingBoard.keyword}' />";
  		let value ="";
  		
  		if(word != "") {
			$("#keyword").val("<c:out value='${boardVO.keyword}' />");
			value = "#mcBoardList tr td.mbdLink";
			console.log($(value + ":contains('" + word + "')").html());
			$(value + ":contains('" + word + "')").each(function(){
				let regex = new RegExp(word, 'gi');
				$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
			})
  		}
  	}) 
  </script> -->

</body>

</html>