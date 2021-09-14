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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<style type="text/css">
.box-d { border: 1px solid black}
p {
	display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.tit {
    padding: 0 0 15px 0;
    font-size: 1.4666em;
    line-height: 1.1;
    font-family: Roboto;
}
.cell {
    overflow: hidden;
/*     position: absolute; */
    background-position: 0 0;
    background-repeat: no-repeat;
    border-radius: 10px;
}
* {
    box-sizing: border-box;
}

.hover {
	position:absolute;
	background: rgba(0,0,0,.7);
	height: 100%; 
	width: 100%;
	top:0;
	display:none;
}
.hover>div{
	position:absolute;
	bottom:25px;
	right:25px;
	cursor: pointer;
}
</style>
<title>특별관|CINEMA BOX</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/header.jsp"%>
		<div style="width:100%; height:430px; position:absolute; z-index:-10; background-image: url('resources/images/specialHall/bg-speacial-bg.png');"></div>
		<div class="container">
			<div class="row py-5 justify-content-center">
				<div class="col-10">
					<table class="table table-borderless" style="width: 85%">
						<tr>
							<td>
								<div class="cell" style="padding: 20px 0 0 0;">
									<p class="tit" style="color: #351f66; padding: 20px 0 0 0; font-size: 30px; line-height: 1.2;">
										<i class="fas fa-film mx-2"></i> CINEMA BOX <br />
										특별관을 <br />
										소개합니다. <br />
									</p>
								</div>
							</td>
							<td colspan="2">
								<div class="cell cell-img position-relative" id="cell-1" style="width: 540px; height: 260px; background-image: url('resources/images/specialHall/bg-bou.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit">THE BOUTIQUE</p>
										<p class="txt" style="margin-top: -25px;">부티크 호텔의 개성을 더한<br>CINEMA BOX만의 프리미엄 시네마</p>
									</div>
										<div class="hover">
												<div class="detailBtn text-white" data-special="부티크"  data-bs-toggle="modal" data-bs-target="#modalDetail">
													<span style="font-size:0.7rem;">상세보기&nbsp;</span>
													<img src="resources/images/specialHall/ico-sp-link.png" alt="">
												</div>
										</div>
								</div>
							</td>
							<td rowspan="2">
								<div class="cell cell-img position-relative" id="cell-2" style="width: 260px; height: 540px; background-image: url('resources/images/specialHall/bg-comfort.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit">COMFORT</p>
										<p class="txt" style="margin-top: -25px;">
											더욱 편안한 영화 관람을 <br/>
											위한 다양한 여유공간
										</p>
									</div>
									<div class="hover">
										<div class="detailBtn text-white" data-special="컴포트" data-bs-toggle="modal" data-bs-target="#modalDetail">
											<span style="font-size:0.7rem;">상세보기&nbsp;</span>
											<img src="resources/images/specialHall/ico-sp-link.png" alt="">
										</div>									
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="cell cell-img position-relative" id="cell-3" style="width: 820px; height: 252px; background-image: url('resources/images/specialHall/bg-db.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit">DOLBY CINEMA</p>
										<p class="txt" style="margin-top: -25px;">
											국내 최초로 CINEMA BOX가 선보이는<br>
											세계 최고 기술력의 몰입 시네마
										</p>
									</div>
									<div class="hover">
										<div class="detailBtn text-white" data-special="돌비" data-bs-toggle="modal" data-bs-target="#modalDetail">
											<span style="font-size:0.7rem;">상세보기&nbsp;</span>
											<img src="resources/images/specialHall/ico-sp-link.png" alt="">
										</div>									
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="cell cell-img position-relative" id="cell-4" style="width: 260px; height: 260px; background-image: url('resources/images/specialHall/bg-private.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit" style="margin-top: -5px;">THE BOUTIQUE PRIVATE</p>
										<p class="txt" style="margin-top: -25px;">
											당신의 특별한 순간을 빛나게 해줄
											프리미엄 어메니티와 룸서비스
										</p>
									</div>
									<div class="hover">
										<div class="detailBtn text-white" data-special="부티크" data-bs-toggle="modal" data-bs-target="#modalDetail">
											<span style="font-size:0.7rem;">상세보기&nbsp;</span>
											<img src="resources/images/specialHall/ico-sp-link.png" alt="">
										</div>									
									</div>
								</div>
							</td>
							<td colspan="2">
								<div class="cell cell-img position-relative" id="cell-5" style="width: 540px; height: 260px; background-image: url('resources/images/specialHall/bg-mx.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit" style="margin-top: -5px;">MX</p>
										<p class="txt" style="margin-top: -25px;">
											진정한 영화 사운드를 통한 최고의 영화!<br>
											CINEMA BOX의 차세대 표준 상영관
										</p>
									</div>
									<div class="hover">
										<div class="detailBtn text-white" data-special="MX" data-bs-toggle="modal" data-bs-target="#modalDetail">
											<span style="font-size:0.7rem;">상세보기&nbsp;</span>
											<img src="resources/images/specialHall/ico-sp-link.png" alt="">
										</div>									
									</div>
								</div>
							</td>
							<td>
								<div class="cell cell-img position-relative" id="cell-6" style="width: 260px; height: 260px; background-image: url('resources/images/specialHall/bg-kids.png');">
									<div style="padding: 30px 20px 30px 30px; color: #fff; background-color: transparent;">
										<p class="tit" style="margin-top: -5px;">KIDS</p>
										<p class="txt" style="margin-top: -25px;">
											아이와 가족이 함께 머물며<br>
											삶의 소중한 가치를 배우는<br>
											더 행복한 놀이공간
										</p>
									</div>
									<div class="hover">
										<div class="detailBtn text-white" data-special="KIDS" data-bs-toggle="modal" data-bs-target="#modalDetail">
											<span style="font-size:0.7rem;">상세보기&nbsp;</span>
											<img src="resources/images/specialHall/ico-sp-link.png" alt="">
										</div>									
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- modalDetail창  -->
			<!-- Modal -->
			<div class="modal fade" id="modalDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-xl">
			    <div class="modal-content" id="modalContent">
			    	<div class="modal-header" style="background-color: #ffc107; border-bottom: 1px solid #ffc107; color: white;">
			    		<h5 class="modal-title" id="exampleModalLabel"></h5>
			    		<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			    	</div>
			    	<div class="modal-body">
			    		<div class="row">
			    			<div class="col-12" style="border-bottom: 1px solid #ffc107">
			    				<ul class="nav justify-content-center" id="nav-ul">
								</ul>
			    			</div>
			    			<div class="col-12 mt-2" id="specialIntroImg" style="padding: 3px;">
			    			</div>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<!-- modalDetail창  -->
			<div class="quick-area container position-relative" style="display: block;">
				<a href="" class="btn-go-top" title="top"><i class="fas fa-arrow-circle-up" style="font-size: 50px; color: black;"></i></a>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			
			$(".theaterLi:last-child").css('border-right', 'none');
			
			$("#theater-place li").click(
					function() {
						$(this).css({'background-color':'#ffc107', 'border-top': 'none'}).siblings().css({'background-color':'white', 'border-top': 'none'});

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
									var $a = $("<a class='text-body nav-link'></a>")
									$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" + item.theaterNumber).text(item.theaterName).css("border-right", "1px solid #ffc107").appendTo($li).appendTo($ul).appendTo($div);
									$loca.append($div);
								})
							},
							error: function() {
								alert("지역 조회중 오류가 발생하였습니다.");
							}
						})
					})

			$(".cell-img").mouseover(function() {
				$(this).find('.hover').show();
			})
			$(".cell-img").mouseleave(function() {
				$(this).find('.hover').hide();
			})
			
			$('.detailBtn').click(function() {
				$('#modalDetail').show();
				var $specialHallName = $(this).data('special');
				var $dolby = 'DOLBY CINEMA';
				var $boutique = 'THE BOUTIQUE';
				var $comfort = 'COMFORT';
				var $MX = 'MX';
				var $KIDS = 'KIDS';
				var $name = '';
				console.log($specialHallName);
				if ('돌비' == $specialHallName) {
					$name = $dolby;
				} else if ('부티크' == $specialHallName) {
					$name = $boutique;
				} else if ('컴포트' == $specialHallName) {
					$name = $comfort;
				} else if ('MX' == $specialHallName) {
					$name = $MX;
				} else if ('KIDS' == $specialHallName) {
					$name = $KIDS;
				}
				$.ajax({
					type: "GET",
					url: "theater/specialDetail",
					data: {specialHall: $specialHallName},
					dataType: "json",
					success: function(specialHallName) {
						$('#nav-ul').empty();
						$('#specialIntroImg').empty();
						if ('부티크' == $specialHallName) {
							var specialImg = '<img src="resources/images/specialHall/'+$name+'-1-intro.png" alt="" style="width: 1117px; height: 1020 px"/>';
							specialImg += '<img src="resources/images/specialHall/'+$name+'-intro.png" alt="" style="width: 1117px; height: 1020 px"/>';
							$('#specialIntroImg').append(specialImg);
						} else {
							var specialImg = '<img src="resources/images/specialHall/'+$name+'-intro.png" alt="" style="width: 1117px; height: 1020 px"/>';
							$('#specialIntroImg').append(specialImg);
						}
						if ('돌비' == $specialHallName) {
							$('#exampleModalLabel').text('특별관 ' + $dolby);
						} else if ('부티크' == $specialHallName) {
							$('#exampleModalLabel').text('특별관 ' + $boutique);
						} else if ('컴포트' == $specialHallName) {
							$('#exampleModalLabel').text('특별관 ' + $comfort);
						} else if ('MX' == $specialHallName) {
							$('#exampleModalLabel').text('특별관 ' + $MX);
						} else if ('KIDS' == $specialHallName) {
							$('#exampleModalLabel').text('특별관 ' + $KIDS);
						}
						$.each(specialHallName, function(index, item) {
							var content =	'<li class="nav-item"><a href="detailTheater?no='+item.theaterNo+'&number='+item.theaterNumber+'" class="nav-link text-muted"> <i class="bi bi-arrow-right-short"></i> '+item.theaterName+'</a></li>';
							$('#nav-ul').append(content);
						})
						
					},
					error: function() {
						alert("특별관이름 전달중 오류가 발생하였습니다.");
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