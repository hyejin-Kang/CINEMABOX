<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> 
<title>관리자 페이지</title>
</head>
<%@include file="adminHeader.jsp" %>
<body id="page-top">
<!-- Masthead-->
<header class="masthead bg-warning text-white text-center">
	<div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
        <img class="masthead-avatar mb-5" src="/cinemabox/resources/images/admin/cinema.png" width="300" height="250" alt="..." />
        <!-- Masthead Heading-->
        <h1 class="masthead-heading text-uppercase mb-0">CINEMA BOX ADMIN 페이지</h1>
        <!-- Icon Divider-->
        <div class="divider-custom divider-light">
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        </div>
        <br>
    </div>
</header>
<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Portfolio</h2>
        <!-- Portfolio Grid Items-->
        <div class="row justify-content-center" >
            <!-- Portfolio Item 1-->
            <div class="col-md-2 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                    <img class="img-fluid" src="/cinemabox/resources/images/admin/insert.jpg" />
                </div>
            </div>
            <!-- Portfolio Item 2-->
            <div class="col-md-4 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                    <img class="img-fluid" src="/cinemabox/resources/images/admin/screening.jpg" />
                </div>
            </div>
            <!-- Portfolio Item 3-->
            <div class="col-md-4 col-lg-4 mb-5">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                   <img class="img-fluid" src="/cinemabox/resources/images/admin/Ticketing.jpg" />
                </div>
            </div>
            <!-- Portfolio Item 4-->
            <div class="col-md-4 col-lg-4 mb-5 mb-lg-0">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                    <img class="img-fluid" src="/cinemabox/resources/images/admin/event.jpg" />
                </div>
            </div>
            <!-- Portfolio Item 5-->
            <div class="col-md-4 col-lg-4 mb-5 mb-md-0">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                    <img class="img-fluid" src="/cinemabox/resources/images/admin/popcorn.jpg" />
                </div>
            </div>
            <!-- Portfolio Item 6-->
            <div class="col-md-6 col-lg-4">
                <div class="portfolio-item mx-auto" style="text-align : center;" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                    <img class="img-fluid" src="/cinemabox/resources/images/admin/Notice.jpg" />
                </div>
            </div>
        </div>
    </div>
</section>
<!-- About Section-->
<section class="page-section bg-warning text-white mb-0" id="about">
    <div class="container">
        <!-- About Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-white">About</h2>
        <!-- About Section Content-->
        <div class="row">
            <p class="m-0 text-center text-white">Copyright &copy; CINEMA BOX</p>
        </div>
        <!-- About Section Button-->
        <div class="text-center mt-4">
            <a class="btn btn-xl btn-outline-light" href="home">
                <i class="fas fa-film mx-2"></i> 메인 페이지 이동
            </a>
        </div>
    </div>
</section>
<!-- Portfolio Modals-->
<!-- Portfolio Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">영화 등록</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/insertMovie.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">영화정보를 작성해서 새로운 영화정보를 등록가능한 페이지 입니다.</p>
                            <a href="movieInsert">영화 등록 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">영화 목록</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/movieList.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">영화정보 목록과 삭제 수정 및 영화 상영을 배정할수 있는 페이지입니다.</p>
                            <a href="movieList">영화 목록 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 3-->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">티켓 예매</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/ticket.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">티켓 예매 페이지 입니다.</p>
                            <a href="">티켓 예매 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 4-->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">이벤트</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/eventPage.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">이벤트 페이지 입니다.</p>
                            <a href="event/main">이벤트 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 5-->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">스토어</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/shop.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">관람권 구매, 팝콘/음료 구매가 가능한 페이지입니다.</p>
                            <a href="gift">스토어 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 6-->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">공지사항</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="/cinemabox/resources/images/admin/noticePage.jpg" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">공지사항 새 글 등록이 가능한 페이지입니다.</p>
                            <a href="notice/add">공지사항 새 글 등록 페이지 이동</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>