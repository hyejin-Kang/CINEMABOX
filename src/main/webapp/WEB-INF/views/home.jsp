<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/b4347bf02c.js" crossorigin="anonymous"></script>
<title>CINEMA BOX</title>
<style type="text/css">
	body{overflow-x: hidden;}
	.container-fluid{position: relative;}
	header .navbar-brand, #top-nav>li>a, #mainnav-02>li>a{color:white !important;}
	.mainnav>a{color:white !important;}
	header{width:100%; background-color: rgba(0,0,0,0.5) !important; position: absolute; top:80px; left: 50%; z-index: 10; transform: translate(-50%, 0%);}
	
	a { 
		text-decoration:none; 
		color : black;
	}
	 
	#nowMovie{
		height: 300px;
    	width: 200px;
		margin-right : 10px;
	}
	
	.swiper-container {
        width: 100%;
        height: 300px;
      }

    .swiper-slide {
        text-align: center;
        background: black;
		
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

    .swiper-slide img {
        
        width: 65%;
        height: 85%;
        object-fit: cover;
      }
    
    .swiper-pagination{
    	display : none;
    }
    
	#currentMovies{
		background-color: black!important;
		padding-top: 70px!important;
		padding-bottom:100px!important;
	}
	
	
	#title{
		font-size : 15px;
		margin-top : 11px;
	}
	
	#subs{
		margin-top : 5px;
		font-size : 11px;
	}
	
	.list-group-item{
		border: none;
	}
	
	.mainEvent{
		border: bottom;
	}
	
	.currentRate{
		font-size : 11px;
		font-weight : bold;
	}
	
	.card{
		border : none;
	}
	
	.mainEvent a{
		color: black;
		text-decoration: none;
	}
	.rolling-container {
   		height:30px;
		overflow:hidden;
		width:100%;
	}
	.rolling-container ul {
		list-style:none;
		animation: 12s linear 0s normal none infinite change1;
		-webkit-animation: 12s linear 0s normal none infinite change1;
		-moz-animation:12s linear 0s normal none infinite change1;
		-o-animation:12s linear 0s normal none infinite change1;
	}
	
	.rolling-container ul li {
  		font-size:15px;
  		line-height:30px;
	}
	
	@-webkit-keyframes change1 {
		0%   {margin-top:0px;}
		15%  {margin-top:0px;}
		25%  {margin-top:-30px;}
		40%  {margin-top:-30px;}
		50%  {margin-top:-60px;}
		65%  {margin-top:-60px;}
		75%  {margin-top:-90px;}
		85%  {margin-top:-90px;}
		100% {margin-top:-120px;}
	}
	@keyframes change1 {
		0%   {margin-top:0px;}
		15%  {margin-top:0px;}
		25%  {margin-top:-30px;}
		40%  {margin-top:-30px;}
		50%  {margin-top:-60px;}
		65%  {margin-top:-60px;}
		75%  {margin-top:-90px;}
		85%  {margin-top:-90px;}
		100% {margin-top:-120px;}
	}
</style>
</head>
<body>
<div class="container-fluid" id="silder-container">
<%@include file="common/header.jsp" %>
   	<div class="row" id="wholeCarousel">
     	<div class="col-12 p-0">
  	   		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
  				<div class="carousel-indicators">
    				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
  				</div>
  				<div class="carousel-inner">
    				<div class="carousel-item active">
      					<img src="/cinemabox/resources/images/main/mainVisuals/gunpowder.jpg" class="d-block w-100"  data-trailer-url="https://www.youtube.com/embed/YLMT5uXjFLY" title="YouTube video player" id="gunpowderImg"  alt="gunpowder" />
    				</div>
    				<div class="carousel-item" >
      					<img src="/cinemabox/resources/images/main/mainVisuals/malignant.jpg" class="d-block w-100" data-trailer-url="https://www.youtube.com/embed/Gczt0fhawDs" title="YouTube video player" id="malignantImg" alt="malignant"/>
    				</div>
    				<div class="carousel-item">
      					<img src="/cinemabox/resources/images/main/mainVisuals/reminiscence.jpg" class="d-block w-100"  data-trailer-url="https://www.youtube.com/embed/_BggT--yxf0" title="YouTube video player" id="reminiscenceImg" alt="reminiscence">
    				</div>
    				<div class="carousel-item">
      					<img src="/cinemabox/resources/images/main/mainVisuals/shangchi.jpg" class="d-block w-100"  data-trailer-url="https://www.youtube.com/embed/8YjFbMbfXaQ" title="YouTube video player" id="shangchiImg" alt="shangchi">
    				</div>
  				</div>
  				<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Previous</span>
  				</button>
  				<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Next</span>
  				</button>
	   		</div>
    	</div>
	</div>
</div>
<!-- 
	현재 상영작 (박스오피스, 예매율 순위로 정렬)
 -->
	<div class="row p-5" id="currentMovies" style="background:black;">
		<div class="col">
			<div class="swiper-container mySwiper">
        		<div class="swiper-wrapper">
        			<c:forEach var="movie" items="${nowMovies }">
        			<div class="swiper-slide">
        				<div class="poster d-inline-block rounded-3">
							<a href="/cinemabox/movieDetail?no=${movie.no }"><img
								src="/cinemabox/resources/images/movie/${movie.no }.jpg" id="nowMovie" class="posterinfo rounded-3" alt="현재 상영작"></a>
								<div class="text-white" id="title"><strong>${movie.title }</strong></div>
								<div class="text-white" id="subs">예매율 ${movie.reservationRate } | <i class="fas fa-star"></i> ${movie.rating } |<i class="fas fa-grin-hearts"></i> ${movie.userLike }</div>
							</div>
        				</div>
        			</c:forEach>
      			</div>
      			<div class="swiper-pagination"></div><!-- 페이징 -->
    		</div>
   		</div>
   	</div>
   	<div class="row">
   		<div class="col-12 bg-dark">
   				
   		</div>
   	</div>
	<!-- 
		이벤트 card 이미지 시작 (4개)
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2">
				<div class="row">
					<div class="mainEvent col-6 mt-5 text-start">
						<strong>이벤트</strong> 
					</div>
					<div class="mainEvent col-6 mt-5 text-end">
						<small><a href="#" >더보기 > </a></small> 
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-8 offset-2 text-center">
				<div class="row">
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="mogadishuEvent" src="/cinemabox/resources/images/main/event/mogadishuEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="lotteEvent" src="/cinemabox/resources/images/main/event/LotteEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="squadEvent" src="/cinemabox/resources/images/main/event/squadEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="photoCardEvent" src="/cinemabox/resources/images/main/event/photoCardEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		스페셜관 이미지
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5">
				<div class="text-left"><strong>스페셜관</strong></div>
			</div>
		</div>
		<div class="row">
			<div class="col-8 offset-2 mt-2">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item flex-fill"> 
						<a href="#"><img alt="imax" src="/cinemabox/resources/images/main/specialTheaters/IMAX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="screenX" src="/cinemabox/resources/images/main/specialTheaters/screenX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="4DX" src="/cinemabox/resources/images/main/specialTheaters/4DX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="goldclass" src="/cinemabox/resources/images/main/specialTheaters/goldclass.png"></a>
					</li>
					<li class="list-group-item flex-fill mt-1" style="padding-left: 50px; "> 
						<a href="#"><img alt="cineDeChef" src="/cinemabox/resources/images/main/specialTheaters/cineDchef.png"></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 
		공지사항 시작
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5">
				<div class="row mb-3">
					<div class="col-2 mt-1">
						<a href="/cinemabox/notice/list"><div class="text-left"><strong><small>공지사항</small></strong></div></a>
					</div>
	<!-- 
		rolling-container (공지사항 title) 시작
	 -->
					<div class="col-10">
						<div class="rolling-container">
							<ul class="mainNoticeLists">
							<c:forEach var="noticeList" items="${noticeList }">
								<a href="/cinemabox/notice/detail?no=${noticeList.no}"><li class="noticeList">${noticeList.title }</li></a>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5 mb-5">
				<div>
					<a href="#"><img alt="ad" src="" id="adImg"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		Trailer 모달 부분
	 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered modal-xl">
    		<div class="modal-content w-100">
      			<div class="modal-header">
        			<button type="button" class="btn-close" id="modal-youtube-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body" id="modal-youtube-body">
       			 	<iframe width="100%" height="500" src="" title="YouTube video player" 
      					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      			</div>
    		</div>
  	  	</div>
	</div>
<%@include file="./common/footer.jsp" %>    
<script type="text/javascript">
$(function(){
   	//헤더수정
   	$("#header").removeClass('container').addClass('justify-content-center');
   	$("#header").css({'left':'0','transform':'translate(0%, 0%)'});
   	$("#header>nav").removeClass('row').addClass('col-12 container');
   
   	//header sub nav
   	$('.mainnav').mouseover(function(){
      	$(this).children('.subnav').stop().slideDown().css('display','flex');
   	})
   	$('.mainnav').mouseleave(function(){
      	$(this).children('.subnav').stop().slideUp();
   	})
	$("#i-close-top-banner").click(function(){
		$("#div-top-banner").hide();
		$("#header").css({'top':'70px','left':'50%','transform':'translate(-50%, -50%)'});
	})
   //Trailer 뜨게하기
   var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
	
   $('.carousel-inner img').click(function(){
    	var url = $(this).data("trailer-url");
    	
    	$('#staticBackdrop iframe').attr("src",url)
    	myModal.show();
   })
      
   //Trailer 닫기버튼 시 재생 종료 시키기
   $("#modal-youtube-close").click(function(){
	   location.reload();
   })
   
    //adImg 부분에 랜덤으로 이미지 나오게 하기
   $("#adImg").ready(function(){
	   var yourImages = ["/cinemabox/resources/images/main/ads/ad1.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad2.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad3.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad4.jpg"];
	   var randomImage = Math.trunc(Math.random()*yourImages.length);
	   $("#adImg").attr("src", yourImages[randomImage]);
   })
   
	//마우스오버 시 상세보기, 예매하기 버튼 보이기
	$(".poster").mouseenter(function(){
		console.log("마우스올리기");
		$(this).find('.a').show();
	})
	$(".poster").mouseleave(function(){
		console.log("마우스 내리기");
		$(this).find('.a').hide();
	})
});

//boxOffice swiper 설정
var swiper = new Swiper(".swiper-container", {
    slidesPerView: 4,
    spaceBetween: 30,
    freeMode: true,
    loop: true,
    autoplay: {
      delay: 4500,
      disableOnInteraction: false
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true
    }
  });
  
</script>
</body>
</html>