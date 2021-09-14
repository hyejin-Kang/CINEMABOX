<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/boxoffice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<title>CINEMABOX :: SEARCH</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<!-- slider -->
	<div id="carouselMovieIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselMovieIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselMovieIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselMovieIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselMovieIndicators"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselMovieIndicators"
				data-bs-slide-to="4" aria-label="Slide 5"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/cinemabox/resources/images/banner/slider/Maly_1920420.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/cinemabox/resources/images/banner/slider/Puppy_1920420.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/cinemabox/resources/images/banner/slider/Sake_1920420.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/cinemabox/resources/images/banner/slider/Sangy_1920420.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/cinemabox/resources/images/banner/slider/Sence_1920420.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselMovieIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselMovieIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- slider end -->
	<div class="container">
		<h2 class="mt-4">검색결과</h2>
		<div class="row mt-5 justify-content-center mb-5">
			<div class="col-12 text-center">
				<!-- 영화포스터 출력 -->
				<ul id="ul-movieList">
					<c:choose>
						<c:when test="${empty searchMovies }">
							<span style="font-size:1.5rem;"><strong>'${param.keyword }'</strong>의 검색된 결과가 없습니다.</span>
						</c:when>
						<c:otherwise>
							<c:forEach var="movie" items="${searchMovies }" varStatus="loop">
								<li class="poster d-inline-block shadow position-relative" style="margin-bottom:6rem !important;">
									<div class="position-absolute poster-info">	
										<div class="position-absolute">
											<c:choose>
												<c:when test="${movie.status eq 'Y' }">
													<a class="nav-link text-white d-block mb-2" href="ticket?location=서울&theaterNo=10001&movieNo=${movie.no }">예매하기</a>
													<a class="nav-link text-white d-block" href="movieDetail?no=${movie.no }">상세정보</a>
												</c:when>
												<c:otherwise>
													<a class="nav-link text-white d-block" href="movieDetail?no=${movie.no }">상세정보</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<img src="/cinemabox/resources/images/movie/${movie.no }.jpg">
									<h5 class="mt-3">
										<img src="/cinemabox/resources/images/icon/txt-age-small-${movie.age }.png" alt="">
										<c:choose>
											<c:when test="${fn:length(movie.title) gt 15}">
												<span style="font-size:0.8rem;">${movie.title }</span>
											</c:when>
											<c:otherwise>
												<span>${movie.title }</span>
											</c:otherwise>
										</c:choose>
									</h5>
									<ul class="m-0 p-0" style="font-size:14px; color:#848484;">
										<c:choose>
											<c:when test="${movie.status eq 'Y' }">
												<li class="d-inline pe-2" style="border-right:1px solid #ddd;">예매율 : ${movie.reservationRate }%</li>
												<li class="d-inline">개봉일 : <fmt:formatDate value="${movie.releaseDate }" pattern="yyyy.MM.dd"/></li>
											</c:when>
											<c:otherwise>
												<li class="d-inline">개봉일 : <fmt:formatDate value="${movie.releaseDate }" pattern="yyyy.MM.dd"/></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>							
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>			
			</div>
		</div>		
	</div>
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	
	//마우스오버 시 상세보기, 예매하기 버튼 보이기
	$('.poster').mouseover(function(){
		$(this).children('div').show();
	})
	$('.poster').mouseleave(function(){
		$(this).children('div').hide();
	})
	$('#ul-orderList').on('mouseover', 'li', function(){
		$(this).children('div').show();
	});
	$('#ul-orderList').on('mouseleave', 'li', function(){
		$(this).children('div').hide();
	});

})
</script>
</body>
</html>