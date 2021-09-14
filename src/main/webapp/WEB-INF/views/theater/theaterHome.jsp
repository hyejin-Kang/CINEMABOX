<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/theaterHome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<title>전체극장|CINEMA BOX</title>
</head>
<body>
	<div class="container-fluid" style="position: relative;">
		<%@include file="../common/header.jsp"%>
	<div style="position: absolute; z-index: -99; background-size: cover; background-image: url('resources/images/theaterDetail/bg-theater-main.png'); width: 100%; height: 500px;">
	</div>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 text-start">
					<h3>전체극장</h3>
				</div>
			</div>
			<div id="theater-box" class="bg-white">
				<div class="row">
					<div id="theater-place" class="col-12">
						<ul class="list-group list-group-horizontal" style="border-bottom: 1px solid #ddd">
							<li class="list-group-item flex-fill text-center" style="background-color: #ffc107; color: white;">서울</li>
							<li class="list-group-item flex-fill text-center">경기</li>
							<li class="list-group-item flex-fill text-center">인천</li>
							<li class="list-group-item flex-fill text-center">대전/충청/세종</li>
							<li class="list-group-item flex-fill text-center">부산/대구/경상</li>
							<li class="list-group-item flex-fill text-center">광주/전라</li>
							<li class="list-group-item flex-fill text-center">강원</li>
						</ul>
					</div>
				</div>
				<div class="row" id="theater-location">
					<c:forEach var="item" items="${locations }">
						<div class='col-3 theaterLi' style="border-right: 1px solid #ddd">
							<ul class='list-group list-group-horizontal'>
								<li class="list-group-item" style="border-left:none;"><a href="detailTheater?no=${item.theaterNo }&number=${item.theaterNumber}" class="text-body nav-link p-0">${item.theaterName }</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h3>극장 이벤트</h3>
				</div>
				<div class="col-6 text-end more">
					<a href="event/main" style="text-decoration: none; color: black;">더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
				<div class="row">
					<div class="col-6 d-flex justify-content-center">
							<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="width: 400px; height: 185px;">
								<div class="carousel-inner">
									<div class="carousel-item" data-bs-interval="2000">
										<a href="event/lotto" ><img style="width: 400px; height: 185px; background: bisque;" src="resources/images/event/magic3.png" alt="<팜 스프링스> 현장 경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=1"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/5d4fca77c7f549998ed563d9d2345b6e.jpg" alt="<남색대문> 현장경품 이벤트"></a>
									</div>
									<div class="carousel-item active" data-bs-interval="3000">
										<a href="event/detail?no=2"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/e8c94a452a5a4bd0b9e61dee1f16ea19.jpg" alt="<보스베이비> 스페셜 퍼즐 증정 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=3"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/33284260ba2b4e2995499535d18365fd.jpg" alt="영화 더스파이 현장경품이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=4"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/199f530329ab4bf0af39c059c2f29817.jpg" alt="<모가디슈> 관람 인증 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=5"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/6830cb7253804ce7a6f6312a393385ce.jpg" alt="<퍼피구조대 더 무비> 현장경품 이벤트"></a>
									</div>
								</div>
							</div>	
					</div>
					<div class="col-6 d-flex justify-content-center">
							<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="width: 400px; height: 185px;">
								<div class="carousel-inner">
									<div class="carousel-item active" data-bs-interval="2000">
										<a href="event/lotto" ><img style="width: 400px; height: 185px; background: bisque;" src="resources/images/event/magic3.png" alt="<팜 스프링스> 현장 경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=1"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/5d4fca77c7f549998ed563d9d2345b6e.jpg" alt="<남색대문> 현장경품 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=2"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/e8c94a452a5a4bd0b9e61dee1f16ea19.jpg" alt="<보스베이비> 스페셜 퍼즐 증정 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=3"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/33284260ba2b4e2995499535d18365fd.jpg" alt="영화 더스파이 현장경품이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=4"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/199f530329ab4bf0af39c059c2f29817.jpg" alt="<모가디슈> 관람 인증 이벤트"></a>
									</div>
									<div class="carousel-item" data-bs-interval="3000">
										<a href="event/detail?no=5"><img style="width: 400px; height: 185px;" src="https://caching.lottecinema.co.kr//Media/Event/6830cb7253804ce7a6f6312a393385ce.jpg" alt="<퍼피구조대 더 무비> 현장경품 이벤트"></a>
									</div>
								</div>
							</div>	
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h3>공지사항</h3>
				</div>
				<div class="col-6 text-end more">
					<a href="notice/list" style="text-decoration: none; color: black;">더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
				<div class="col-12">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th class="text-center">제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList }" var="notice">
								<tr>
									<td>${notice.no }</td>
									<td><a href="notice/detail?no=${notice.no }" class="noticeLink" style="text-decoration: none; color: black">${notice.title }</a></td>
									<td><fmt:formatDate value="${notice.creatDate }" pattern="yyyy.MM.dd"/></td>
									<td>${notice.hits }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="quick-area container position-relative" style="display: block;">
				<a href="" class="btn-go-top" title="top"><i class="fas fa-arrow-circle-up" style="font-size: 50px; color: black;"></i></a>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			// 공지사항 제목 색상 토글
			$('.noticeLink').mouseover(function() {
				$(this).addClass('text-warning');
			})
			$('.noticeLink').mouseleave(function() {
				$(this).removeClass('text-warning');
			})
			// 더보기 색상 토글
			$('.more').mouseover(function() {
				$(this).children().addClass('text-warning');
			})
			$('.more').mouseleave(function() {
				$(this).children().removeClass('text-warning');
			})
			
			$("#theater-location div:eq(3)").css('border-right', 'none');
			$("#theater-location div:eq(7)").css('border-right', 'none');
			$("#theater-location div:eq(11)").css('border-right', 'none');
			$("#theater-location div:eq(15)").css('border-right', 'none');
			
			$("#theater-place li").click(
					function() {
						$(this).css({'background-color':'#ffc107', 'border-top': 'none', 'color':'white'}).siblings().css({'background-color':'white', 'border-top': 'none', 'color':'black'});

						var $loca = $("#theater-location");
						var location = $(this).text();
						$.ajax({
							type:"GET",
							url:"theater/place",
							data: {location: location},
							dataType: 'json',
							success: function(allLocations) {
								$loca.text("");
								$.each(allLocations, function(index, item) {
									var $div = $("<div class='col-3'></div>");
									var $ul = $("<ul class='list-group list-group-horizontal'></ul>")
									var $li = $("<li class='list-group-item' ></li>")
									var $a = $("<a class='text-body nav-link ajax-a'></a>")
									$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" + item.theaterNumber).text(item.theaterName).css("border-right", "1px solid #ddd").appendTo($li).appendTo($ul).appendTo($div);
									$loca.append($div);
								})
								$(".ajax-a:eq(3)").css('border-right', 'none');
								$(".ajax-a:eq(7)").css('border-right', 'none');
								$(".ajax-a:eq(11)").css('border-right', 'none');
								$(".ajax-a:eq(15)").css('border-right', 'none');
								$(".ajax-a:eq(19)").css('border-right', 'none');
								$(".ajax-a:eq(23)").css('border-right', 'none');
							},
							error: function() {
								alert("지역 조회중 오류가 발생하였습니다.");
							}
						})
					})

			$(window).scroll(function() {
				if ($(this).scrollTop() > 200) {
					$('.btn-go-top').fadeIn();
				} else {
					$('.btn-go-top').fadeOut();
				}
			});
			$('.btn-go-top').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		})
	</script>
</body>
</html>